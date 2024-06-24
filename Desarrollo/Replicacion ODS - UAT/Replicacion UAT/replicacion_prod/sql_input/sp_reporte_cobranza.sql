CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_reporte_cobranza()
OPTIONS(
  strict_mode=true)
BEGIN
-- *********************************************************************
-- * Proyecto       : GOLDEN RECORD
-- * Fecha          : 09/06/2020
-- * Autor          : Ramirez Hurtado, Tito Jaime
-- * Tabla Destinos : - 
-- *                : - 
-- * Tablas Fuentes : - 
-- * Descripción    : Generar REPORTE DE COBRANZAS-[SAMP - ACSELE]
-- *********************************************************************
-- *                       MODIFICACIONES POSTERIORES                  *
-- *===================================================================*
-- *   Fecha   | Persona |           Modificación Realizada            *
-- *===================================================================*f
-- *  03-05-2022 | Geraldine J.  | Se agregó la tabla poliza_raw para 
--                                 traer los pagado_hasta de las polizas
--                                 migradas.                                         
-- *********************************************************************


-- ----------------------------------------------------------------------
-- Paso 0: PERIODO
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_PERIODO_TOTAL
AS
(
SELECT  PER.PERIODO
       ,PARSE_DATE("%Y%m",CAST(PER.PERIODO AS STRING)) AS PERIODO_FECHA_COBERTURA_INICIO
       ,DATE_ADD(PARSE_DATE("%Y%m",CAST(PER.PERIODO AS STRING)), INTERVAL 1-4 MONTH) AS PERIODO_FECHA_INICIO
       ,DATE_ADD(PARSE_DATE("%Y%m",CAST(PER.PERIODO AS STRING)), INTERVAL 1 MONTH) AS PERIODO_FECHA_FIN
       ,FORMAT_DATE('%Y',PARSE_DATE("%Y%m",CAST(PER.PERIODO AS STRING))) AS PERIODO_ANIO
       ,FORMAT_DATE('%b',PARSE_DATE("%Y%m",CAST(PER.PERIODO AS STRING))) AS PERIODO_MES_NOMBRE_ABREV
       ,FORMAT_DATE('%B',PARSE_DATE("%Y%m",CAST(PER.PERIODO AS STRING))) AS PERIODO_MES_NOMBRE
       ,FORMAT_DATE('%m',PARSE_DATE("%Y%m",CAST(PER.PERIODO AS STRING))) AS PERIODO_MES
       ,DATE_ADD(DATE_ADD(PARSE_DATE("%Y%m",CAST(PER.PERIODO AS STRING)), INTERVAL -1 MONTH),INTERVAL 20 DAY) AS PERIODO_FECHA_APERTURA
       ,DATE_ADD(PARSE_DATE("%Y%m",CAST(PER.PERIODO AS STRING)), INTERVAL 19 DAY) AS PERIODO_FECHA_CIERRE
       ,ESTADO AS ESTADO_PERIODO
   FROM samp_data.PERIODO_COBRANZA_raw PER
);

-- ----------------------------------------------------------------------
-- Paso 0: PERIODO ACTUAL
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_PERIODO_ACTUAL
AS
(
SELECT  PER.PERIODO
       ,PER.PERIODO_FECHA_COBERTURA_INICIO
       ,PER.PERIODO_FECHA_INICIO
       ,PER.PERIODO_FECHA_FIN
       ,PER.PERIODO_ANIO
       ,PER.PERIODO_MES_NOMBRE_ABREV
       ,PER.PERIODO_MES_NOMBRE
       ,PER.PERIODO_MES
   FROM TMP_COBR_PERIODO_TOTAL PER
  WHERE ESTADO_PERIODO = 1
);

-- =========================================================================================================
-- Paso 1: Universo de ID_PLANILLA y su detalle
-- =========================================================================================================
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_PLANILLA_VIA
AS (

WITH TMP_VIA_ORIGEN_PAGO AS (
    SELECT  PLA.id_origen_reca_planilla
       ,PLA.DESCRIPCION                    AS ORIGEN_RECAUDACION_PLANILLA
       ,COALESCE(VIA.NUM_VIA_PAGO_COBRO,0) AS NUMERO_VIA_PAGO
       ,( CASE  
              COALESCE(VIA.NUM_VIA_PAGO_COBRO,0) 
              WHEN 300 THEN 'Abono por identificar'
              WHEN 400 THEN 'Pago de Memo'
              WHEN 500 THEN 'Cargo en cuenta'
              WHEN 600 THEN 'Caja ventanilla'
              WHEN 700 THEN 'Cargo en TC'
              ELSE 'Otros'
              END 
          ) AS DESCRIPCION_VIA_PAGO
    FROM samp_data.ORIGEN_RECAUDACION_PLANILLA_raw PLA
    LEFT JOIN samp_data.ORIGEN_RECAU_VIA_PAGO_COB_raw VIA
         ON PLA.id_origen_reca_planilla = VIA.id_origen_reca_planilla
)

SELECT PLA.ID_PLANILLA
      ,FORMAT_DATETIME('%Y-%m-%d %H:%M:%S',DATETIME(PLA.FECHA_PLANILLA,'America/Lima')) AS FECHA_PLANILLA
      ,PLA.DESCRIPCION AS DESCRIPCION_PLANILLA
      ,PLA.ESTADO_PLANILLA
      ,PLA.ID_VIA_COBRO
      ,PLA.ID_PRODUCTO_FINANCIERO
      ,PLA.TIPO_PLANILLA
      ,PLA.TIPO_INGRESO
      ,PLA.ORIGEN_RECAUDACION
      ,PLA.MODO_RECAUDACION
      ,POO.ORIGEN_RECAUDACION_PLANILLA
      ,POO.NUMERO_VIA_PAGO
      ,VIA.NOMBRE AS NOMBRE_VIA_COBRO
      ,POO.DESCRIPCION_VIA_PAGO
 FROM samp_data.PLANILLA_raw PLA 
 LEFT JOIN TMP_VIA_ORIGEN_PAGO POO 
   ON POO.id_origen_reca_planilla= PLA.ORIGEN_RECAUDACION
 LEFT JOIN samp_data.VIA_COBRO_raw VIA
        ON VIA.ID = PLA.ID_VIA_COBRO
);
--WHERE PLA.id_planilla in (select id_planilla from samp_data.DETALLE_PLANILLA_raw where id_abono = '8963502' );
-- =========================================================================================================
-- Paso 2: Relacion ABONO - PLANILLA [Caso donde un mismo ABONO esta asociado a 2 Planillas, por eso  cosiderar el mas reciente(ultimo) ]
-- =========================================================================================================
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_PLANILLA_ABONO
AS
(
WITH TMP_PLANILLA_DUP
AS(
SELECT   ID_PLANILLA
        ,ID_ABONO
        ,GLOSA_CONCEPTO
        ,CODIGO_CONCEPTO
        ,ROW_NUMBER()OVER(PARTITION BY ID_PLANILLA, ID_ABONO ORDER BY FECHA_CREACION DESC ) AS FLG_ULTIMO
  FROM samp_data.DETALLE_PLANILLA_raw
)
SELECT PLA.ID_PLANILLA
      ,PRP.ID_ABONO
      ,PRP.GLOSA_CONCEPTO
      ,PRP.CODIGO_CONCEPTO
      ,FORMAT_DATETIME('%Y-%m-%d %H:%M:%S',DATETIME(PLA.FECHA_PLANILLA,'America/Lima')) AS FECHA_PLANILLA
      ,ROW_NUMBER()OVER(PARTITION BY PRP.ID_ABONO ORDER BY PLA.FECHA_PLANILLA DESC) FLG_ULTIMO
      ,PLI.NUMERO_VIA_PAGO
      ,PLI.DESCRIPCION_VIA_PAGO
       FROM TMP_PLANILLA_DUP PRP
 INNER JOIN samp_data.PLANILLA_raw PLA
         ON PRP.ID_PLANILLA   = PLA.ID_PLANILLA
  LEFT JOIN TMP_COBR_PLANILLA_VIA PLI 
         ON PLI.ID_PLANILLA   = PLA.ID_PLANILLA
      WHERE PRP.FLG_ULTIMO = 1
      --AND PRP.ID_ABONO = '8963502';
);

-- ----------------------------------------------------------------------
-- Paso 1: Universo de CONTRATANTES - [NIVEL CONTRATANTE IDCONTRANTE]
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_CONTRATANTE_UNI
AS
(
WITH V_MD_PERSONA AS (
    SELECT HASH_ID
    ,LOWER(CORREO) AS CORREO
    ,TELEFONO
    ,CELULAR
    FROM `iter-data-storage-pv-uat.master_party.V_MD_PERSONA`
)


SELECT DISTINCT
       CON.NUMERO_DOCUMENTO
      ,CON.ID_PERSONA
      ,CON.TIPO_DOCUMENTO
      ,CON.APELLIDO_PATERNO
      ,CON.APELLIDO_MATERNO
      ,CON.NOMBRE
      ,CON.RAZON_SOCIAL
      ,CON.FECHA_NACIMIENTO
      ,CON.GENERO
      ,CON.ESTADO_CIVIL
      ,DATE_DIFF(CURRENT_DATE, CON.FECHA_NACIMIENTO, YEAR) AS EDAD
      ,PER.CELULAR  AS TELEFONO_MOVIL_LN_RECIENTE
      ,PER.CELULAR  AS TELEFONO_MOVIL_LN
      ,PER.TELEFONO AS TELEFONO_FIJO_LN_RECIENTE
      ,PER.TELEFONO AS TELEFONO_FIJO_LN
      ,PER.CORREO   AS CORREO_UL
      ,PER.CORREO   AS CORREO_LN
     FROM goldenrecord_data.CONTRATANTE CON
LEFT JOIN V_MD_PERSONA PER
       ON PER.HASH_ID = CON.HASH_ID
);

-- ----------------------------------------------------------------------
-- Paso 2: Universo de POLIZAS [POLIZA]
--         Se convierte los numeros de poliza a numericos, porque el PAGOS es numero; los que tiene caracteres no numericos, se excluye
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_POLIZA_UNI
AS
(
SELECT  POL.NUMERO_POLIZA
       ,(CASE WHEN REGEXP_CONTAINS(TRIM(POL.NUMERO_POLIZA),'([^0-9])')=true THEN -1 else CAST(POL.NUMERO_POLIZA AS NUMERIC) end ) AS NUMERO_POLIZA_INT
       ,POL.FECHA_EMISION 
       ,POL.FECHA_INICIO AS FECHA_INICIO_VIGENCIA
       ,POL.FECHA_FIN    AS FECHA_FIN_VIGENCIA
       ,POL.NOMBRE_PRODUCTO 
       ,POL.MONEDA 
       ,POL.PRIMA_NETA
       ,POL.FRECUENCIA_PAGO 
       ,POL.ESTADO
       ,POL.PLAN
       ,POL.NOMBRE_GRUPO_PRODUCTO
       ,POL.ID_PERSONA
       ,POL.ID_PRODUCTO
       ,TPE.PERIODO
       ,TPE.PERIODO_ANIO
       ,TPE.PERIODO_MES
       ,TPE.PERIODO_FECHA_FIN
       ,TPE.PERIODO_FECHA_INICIO
    FROM goldenrecord_data.POLIZA POL
    CROSS JOIN TMP_COBR_PERIODO_ACTUAL TPE
   WHERE POL.ID_GRUPO_PRODUCTO IN ( '01','05')
);
-- ----------------------------------------------------------------------
-- Paso 3: TIPO DE CUENTA
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_POLIZA_TIPOCUENTA_AFI
AS
SELECT 
 TAB.NUMERO_POLIZA
,TAB.TIPO_CUENTA
,TAB.ID_POLIZA_ACSELE
,ROW_NUMBER()OVER(PARTITION BY TAB.NUMERO_POLIZA ORDER BY TAB.ID_POLIZA_ACSELE DESC ) AS CORRELATIVO
FROM (
SELECT  DISTINCT
 AFI.NUMERO_POLIZA
,TV.DESCRIPCION AS GLS_TIPO_VIA_COBRO_AFILIACION
,CP.ID_POLIZA_ACSELE
,(CASE AFI.ESTADO_AFILIACION  WHEN 0 
       THEN 'Desconocido'
       WHEN 1  THEN 'Ingresado'
       WHEN 2  THEN 'EnProceso'
       WHEN 3  THEN 'Rechazado'
       WHEN 4  THEN 'Aprobado'
       WHEN 5  THEN 'Validado'
       WHEN 6  THEN 'NoConforme'
       WHEN 7  THEN 'Desistido'
       WHEN 8  THEN 'PorValidar'
       WHEN 9  THEN 'EnProcesoValidacion'
       WHEN 10 THEN 'ValidacionAprobada'
       WHEN 11 THEN 'ValidacionRechazada'
       WHEN 12 THEN 'PorAprobar'
   END) AS GLS_ESTADO_AFILIACION
,VC.ID_TIPO_VIA_COBRO AS ID_TIPO_VIA_COBRO_AFILIACION
,(CASE WHEN VC.ID_TIPO_VIA_COBRO = 3 THEN 'Caja-Ventanilla'
      -- WHEN VC.ID_TIPO_VIA_COBRO = 1 AND TAR.MONEDA ='PEN' THEN 'Ahorro Moneda Nacional'
       --WHEN VC.ID_TIPO_VIA_COBRO = 1 AND TAR.MONEDA ='USD' THEN 'Ahorro Moneda Extranjera'
       WHEN VC.ID_TIPO_VIA_COBRO = 2 AND TAR.MONEDA ='PEN' THEN 'Tarjeta Crédito Moneda Nacional'
       WHEN VC.ID_TIPO_VIA_COBRO = 2 AND TAR.MONEDA ='USD' THEN 'Tarjeta Crédito Moneda Extranjera'
       WHEN VC.ID_TIPO_VIA_COBRO = 1 THEN CAST(TC.GLS_TIPO_CUENTA AS STRING)
       ELSE 'Tipo Indefinido'
  END) TIPO_CUENTA
  FROM samp_data.AFILIACION_raw AFI
 INNER JOIN samp_data.CUENTA_POLIZA_raw CP
    ON AFI.NUMERO_POLIZA      = CP.NUMERO_POLIZA
 INNER JOIN samp_data.VIA_COBRO_raw VC
    ON AFI.ID_VIA_COBRO       = VC.ID
 INNER JOIN samp_data.TIPO_VIA_COBRO_raw TV
    ON CAST(VC.ID_TIPO_VIA_COBRO AS STRING) = TV.ID
 INNER JOIN sampmed_data.TARJETA_AFILIACION_raw TA
    ON TA.ID_AFILIACION     = AFI.ID
LEFT JOIN sampmed_data.TARJETA_raw TAR
      ON TA.ID_TARJETA        = TAR.ID_TARJETA
 LEFT JOIN sampmed_data.TIPO_CUENTA_raw TC
        ON TAR.VIA_COBRO          = CAST(TC.TIPO_VIA_COBRO AS STRING)
       AND TAR.ID_TIPO_CUENTA     = TC.TARJ_TIPO_CUENTA
       AND TAR.MONEDA = TC.MON_POLIZA
     WHERE AFI.ESTADO_AFILIACION =4
)TAB;

-- ----------------------------------------------------------------------
-- Paso 3: 
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TB_COBR_ABONO_VIA_PAGO
AS 
(
    SELECT DISTINCT 
       dp.ID_ABONO,
       vc.nombre as NOMBRE_VIA_PAGO,
      (CASE WHEN pp.tipo_ingreso=2 
            THEN 'TRANSFERENCIA'
            WHEN pp.tipo_ingreso=3 
            THEN 'VOUCHER'
            WHEN pp.tipo_ingreso=1
            THEN 'CHEQUE'
            WHEN pp.tipo_ingreso=4
            THEN 'VENTANILLA'
            WHEN pp.tipo_ingreso=5 
            THEN 'NOTA_DE_CREDITO'
            WHEN pp.tipo_ingreso=6 
            THEN 'LIQUIDACION'
            WHEN pp.tipo_ingreso=0 
            THEN 'DESCONOCIDO'
       END ) AS TIPO_INGRESO,
      UPPER(ifi.nombre) as NOMBRE_BANCO_PAGO
from   samp_data.PRE_PLANILLA_raw  pp
      inner join samp_data.PLANILLA_raw p 
              on pp.id_planilla = p.id_planilla
      inner join samp_data.DETALLE_PLANILLA_raw dp 
              on p.id_planilla = dp.id_planilla
      inner join samp_data.ABONO_raw a 
              on CAST(dp.id_abono AS NUMERIC) = a.id_abono
      inner join samp_data.CUENTA_POLIZA_raw cp 
              on cp.id = CAST(a.id_cuenta_poliza AS NUMERIC)
             and cp.tipo = 1
       left join iter-data-storage-pv-uat.samp_data.PRODUCTO_FINANCIERO_raw pf 
              on pf.id = pp.id_producto_financiero
       left join samp_data.INSTITUCION_FINANCIERA_landing ifi 
              on ifi.id = pf.id_emisor
       left join samp_data.VIA_COBRO_raw vc 
              on vc.id = pp.id_via_cobro
          where pp.cod_ramo = '1'
            and a.estado = 1
UNION ALL 
    SELECT  DISTINCT
          DET.ID_ABONO
        ,VIA.NOMBRE AS NOMBRE_VIA_PAGO
        ,'TRAMA' AS TIPO_INGRESO
        ,CAST(NULL AS STRING ) AS banco
   FROM samp_data.PROCESO_COBRANZA_raw COB
   LEFT JOIN samp_data.VIA_COBRO_raw VIA
     ON COB.ID_VIA_COBRO = VIA.ID
 INNER JOIN samp_data.RECEPCION_raw REC
     ON CAST(REC.ID_PROCESO_COBRANZA AS NUMERIC)  = COB.ID
  INNER JOIN samp_data.DETALLE_PLANILLA_raw DET
    ON DET.ID_PLANILLA = CAST(REC.ID_PLANILLA AS NUMERIC)
);
-- ----------------------------------------------------------------------
-- Paso 3: Universo de POLIZA [ CARGO-ABONO ]
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TB_COBR_POLIZA_CARGO
 AS (
WITH TMP_VIA_COBRO AS 
(
     SELECT   AFI.NUMERO_POLIZA
             ,VIA.NOMBRE AS VIA_COBRO
             ,ROW_NUMBER() OVER(PARTITION BY AFI.NUMERO_POLIZA ORDER BY AFI.FECHA_AFILIACION DESC ) AS FLG_ULTIMO
      FROM samp_data.AFILIACION_raw AFI
INNER JOIN samp_data.VIA_COBRO_raw VIA
        ON AFI.ID_VIA_COBRO=VIA.ID
      WHERE AFI.ESTADO_AFILIACION = 4
        AND CODIGO_PRODUCTO IN (1, 2, 4)
        AND VIA.ESTADO_COBRANZA = 1
)
,TMP_ABONO_CARGO AS
(
    SELECT AB.MONTO_MONEDA
          ,AB.MONTO_CANTIDAD
          ,AB.FEC_APLICADO
          ,PUN.PERIODO_COMERCIAL  AS PERIODO_PAGO
          ,AB.ID_ABONO
          ,AB.ID_CARGO
      FROM samp_data.ABONO_CARGO_raw AB
INNER JOIN goldenrecord_data.TB_DIM_PERIODO_COMERCIAL PUN
        ON  DATE(DATETIME(AB.FEC_APLICADO,'America/Lima')) BETWEEN PUN.PERIODO_COMERCIAL_DIA_INICIO AND PUN.PERIODO_COMERCIAL_DIA_FIN
)
SELECT DISTINCT
        IMC.NUMERO_POLIZA 
       ,CAR.NUMERO_CARGO
       ,IFNULL(ABO.NUMERO_ABONO,0)                           AS NUMERO_ABONO
       ,CAR.CONCEPTO
       ,COB.DESCRIPCION AS CONCEPTO_DESCRIPCION
       ,DATE(CAR.FECHA_COBERTURA_INICIO)                     AS FECHA_COBERTURA_INICIO
       ,DATE(CAR.FECHA_COBERTURA_FIN)                        AS FECHA_COBERTURA_FIN
       ,MAX( CASE WHEN (CAR.SALDO_CANTIDAD=0 OR CAR.ESTADO=6) THEN DATE(CAR.FECHA_COBERTURA_FIN) END )OVER(PARTITION BY IMC.NUMERO_POLIZA) AS FECHA_PAGADO_HASTA
       ,(CASE WHEN CAR.SALDO_CANTIDAD > 0 AND DATE(FECHA_COBERTURA_FIN) < CURRENT_DATE 
              THEN (CASE WHEN CAR.ESTADO=6 
                         THEN 0 
                         WHEN CAR.ESTADO= 1
                         THEN 1
                         ELSE 0 
                   END)
              ELSE 0 
       END ) AS FLG_MORA
       ,CAR.MONTO_CARGO_CANTIDAD
       ,CAR.SALDO_CANTIDAD                                   AS SALDO_CARGO_CANTIDAD
       ,CAR.SALDO_MONEDA                                     AS SALDO_CARGO_MONEDA
       ,CAR.ESTADO                                           AS ESTADO_CARGO
       ,CBO.MONTO_MONEDA                                     AS MONTO_MONEDA_PAGO
       ,CBO.MONTO_CANTIDAD                                   AS MONTO_CANTIDAD_PAGO
       ,MAX(DATE(CBO.FEC_APLICADO))OVER(PARTITION BY IMC.NUMERO_POLIZA) AS FECHA_PAGO
       ,CBO.FEC_APLICADO
       ,CBO.PERIODO_PAGO
       ,ABO.MONTO_ORIGEN_MONEDA 
       ,ABO.VALOR_MONEDA_ORIGEN
       ,FORMAT_DATE('%Y-%m-%d',DATE(ABO.FEC_REGISTRO_CAJA))  AS FEC_REGISTRO_CAJA
       ,(CASE WHEN ABO.ESTADO=0 THEN 'Desconocido'
              WHEN ABO.ESTADO=1 THEN 'Activo'
              WHEN ABO.ESTADO=2 THEN 'Anulado'
        END) AS ESTADO_PAGO
       ,TIP.NOMBRE_CORTO_TIPO_INGRESO                        AS TIPO_DEL_INGRESO
       ,DATE(CAR.PERIODO_COBRANZA)                           AS PERIODO_COBRANZA
       ,VIA.VIA_COBRO
       ,ABP.NOMBRE_VIA_PAGO  
       ,ABP.TIPO_INGRESO
       ,ABP.NOMBRE_BANCO_PAGO
       ,PLA.NUMERO_VIA_PAGO
       ,PLA.DESCRIPCION_VIA_PAGO
       ,CAR.ID AS ID_CARGO
        FROM samp_data.CARGO_raw CAR
--  INNER JOIN samp_data.INTERMEDIO_CARGO_raw IMC
  INNER JOIN samp_data.CUENTA_POLIZA_raw IMC
          --ON IMC.ID_CARGO     = CAR.ID
          ON IMC.ID        = CAR.ID_CUENTA_POLIZA
   LEFT JOIN samp_data.CONCEPTO_COBRANZA_raw COB
          ON COB.CODIGO    =CAST(CAR.CONCEPTO AS STRING)
   LEFT JOIN TMP_ABONO_CARGO CBO
          ON CBO.ID_CARGO  = CAST(CAR.ID AS STRING)
   LEFT JOIN samp_data.ABONO_raw ABO
          ON CBO.ID_ABONO  = CAST(ABO.ID_ABONO AS STRING)
         AND ABO.ESTADO    = 1
   LEFT JOIN TB_COBR_ABONO_VIA_PAGO ABP
          ON ABP.ID_ABONO  = CAST(ABO.ID_ABONO AS STRING)
   LEFT JOIN samp_data.TIPO_INGRESO_ABONO_raw TIP
          ON ABO.ID_TIPO_INGRESO_ABONO = TIP.ID_TIPO_INGRESO_ABONO
   LEFT JOIN TMP_VIA_COBRO VIA
          ON VIA.NUMERO_POLIZA = IMC.NUMERO_POLIZA 
         AND VIA.FLG_ULTIMO    = 1
   LEFT JOIN TMP_COBR_PLANILLA_ABONO PLA
          ON CAST(PLA.ID_ABONO AS STRING) = CAST(ABO.ID_ABONO AS STRING)
         AND PLA.FLG_ULTIMO               = 1
       WHERE CAR.ESTADO                IN (1,4,6)
);

-- ----------------------------------------------------------------------
-- Paso 4: Temporal con informacion de POLIZAS - FECHAS PAGO,RECHAZO
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_POLIZA_FECHAS
AS
(
      SELECT 
             PRO.NUMERO_POLIZA
            ,PRO.FECHA_PAGADO_HASTA
            ,PRO.FECHA_PAGO
            ,(CASE WHEN PRO.FECHA_PAGADO_HASTA < CURRENT_DATE THEN DATE_DIFF(CURRENT_DATE,PRO.FECHA_PAGADO_HASTA,DAY) ELSE 0 END) AS CANTIDAD_DIA_VENCIMIENTO
            ,(CASE WHEN SUM(PRO.FLG_MORA)>1 THEN SUM(PRO.FLG_MORA)+1 ELSE SUM(PRO.FLG_MORA) END) AS MORA
      FROM TB_COBR_POLIZA_CARGO PRO
      WHERE PRO.ESTADO_CARGO =1
        AND PRO.CONCEPTO     = 100
      GROUP BY  PRO.NUMERO_POLIZA
               ,PRO.FECHA_PAGADO_HASTA
               ,PRO.FECHA_PAGO
);

-- ----------------------------------------------------------------------
-- Paso 5: Temporal con informacion de POLIZAS que ingresan al PERIODO cobranza en el PERIODO ACTUAL (periodo cada 20 a 21 de cada mes)
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_POLIZA_PERIODO_ABO_CARG
AS
(
SELECT
       UNI.NUMERO_POLIZA
      ,UNI.NUMERO_CARGO
      ,UNI.NUMERO_ABONO
      ,UNI.CONCEPTO
      ,UNI.FECHA_COBERTURA_INICIO
      ,UNI.FECHA_COBERTURA_FIN
      ,UNI.FECHA_PAGADO_HASTA
      ,UNI.FLG_MORA
      ,UNI.MONTO_CARGO_CANTIDAD
      ,UNI.SALDO_CARGO_CANTIDAD
      ,UNI.SALDO_CARGO_MONEDA
      ,UNI.ESTADO_CARGO
      ,UNI.MONTO_MONEDA_PAGO
      ,UNI.MONTO_CANTIDAD_PAGO
      ,UNI.FECHA_PAGO
      ,UNI.FEC_APLICADO
      ,UNI.PERIODO_PAGO
      ,UNI.MONTO_ORIGEN_MONEDA
      ,UNI.VALOR_MONEDA_ORIGEN
      ,UNI.FEC_REGISTRO_CAJA
      ,UNI.ESTADO_PAGO
      ,UNI.TIPO_DEL_INGRESO
      ,UNI.PERIODO_COBRANZA
      ,UNI.VIA_COBRO
      ,PRO.PERIODO
      ,PRO.PERIODO_FECHA_COBERTURA_INICIO
      ,PRO.PERIODO_FECHA_INICIO
      ,PRO.PERIODO_FECHA_FIN
      ,PRO.PERIODO_ANIO
      ,PRO.PERIODO_MES_NOMBRE_ABREV
      ,PRO.PERIODO_MES_NOMBRE
      ,PRO.PERIODO_MES
  FROM TB_COBR_POLIZA_CARGO UNI
  CROSS JOIN TMP_COBR_PERIODO_ACTUAL PRO
   WHERE UNI.PERIODO_COBRANZA < PRO.PERIODO_FECHA_FIN 
     AND UNI.PERIODO_COBRANZA >= PRO.PERIODO_FECHA_INICIO
     AND UNI.FECHA_COBERTURA_INICIO <=PRO.PERIODO_FECHA_COBERTURA_INICIO
     AND UNI.FECHA_COBERTURA_INICIO >=PRO.PERIODO_FECHA_INICIO
     AND UNI.ESTADO_CARGO=1
     AND COALESCE(DATE(DATETIME(UNI.FEC_APLICADO,'America/Lima')),DATE(9999,12,31))  > DATE_ADD(DATE_ADD(PRO.PERIODO_FECHA_COBERTURA_INICIO, INTERVAL -1 MONTH), INTERVAL 19 DAY)
);

-- ----------------------------------------------------------------------
-- Paso 6: Información de Rechazos
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_POLIZA_RECHAZO
AS
(
WITH TMP_RECHAZOS AS 
(
SELECT TRIM(REC.NUMERO_POLIZA) AS NUMERO_POLIZA
      ,CAST(TRIM(REC.PERIODO) AS NUMERIC) AS PERIODO
      ,REC.MENSAJE_HOMOLOGADO
      ,REC.MENSAJE_TERMINAL
      ,ROW_NUMBER()OVER(PARTITION BY TRIM(REC.NUMERO_POLIZA) , CAST(TRIM(REC.PERIODO) AS NUMERIC) ORDER BY REC.FECHA_RETORNO DESC) AS FLG_ULTIMO
      ,REC.FECHA_RETORNO
  FROM salomon_data.RECHAZOS_RECAUDACION_raw REC
)
 SELECT CAST(RE.NUMERO_POLIZA AS NUMERIC) AS NUMERO_POLIZA
       ,RE.PERIODO
       ,RE.MENSAJE_HOMOLOGADO
       ,RE.MENSAJE_TERMINAL AS RECHAZO
   FROM TMP_RECHAZOS RE
  INNER JOIN TMP_COBR_PERIODO_ACTUAL PE 
     ON PE.PERIODO = RE.PERIODO
  WHERE RE.FLG_ULTIMO = 1
);

-- ----------------------------------------------------------------------
-- Paso 8: Información de POLIZAS [Por Cobrar y Cobrado]
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_POLIZA_PERIODO_CARGO
AS
(
WITH TMP_TIPO_CAMBIO AS 
(
    SELECT
             DATE(B.DATERATE,'America/Lima') AS FECHA_TIPO_CAMBIO
            ,MAX(CASE WHEN A.CURRENCYID =2163 THEN CAST(B.RATE AS NUMERIC) ELSE -1 END)  AS SOL_A_DOLAR
            ,MAX(CASE WHEN A.CURRENCYID =2123 THEN CAST(B.RATE AS NUMERIC) ELSE -1 END)  AS DOLAR_A_SOL
            ,MAX(CASE WHEN A.CURRENCYID =2123 THEN CAST(B.RATE AS NUMERIC) ELSE -1 END)  AS TIPO_CAMBIO_DOLAR
      FROM acsele_data.CURRENCY_raw A
INNER JOIN acsele_data.CURRENCYRATE_raw B 
        ON A.CURRENCYID=B.CURRENCYORIGINID
     WHERE A.CURRENCYID IN (2163,2123)
     GROUP BY DATERATE
)
SELECT COB.NUMERO_POLIZA
      ,COB.FECHA_PAGADO_HASTA
      ,COB.PERIODO
      ,COB.PERIODO_ANIO
      ,COB.PERIODO_MES
      ,REC.RECHAZO
      ,COB.VIA_COBRO
      ,SUM(COB.SALDO_CARGO_CANTIDAD)            AS CUENTA_POR_COBRAR
      ,SUM(COALESCE(COB.MONTO_CANTIDAD_PAGO,0)) AS MONTO_PAGO
      ,MAX(COB.MONTO_MONEDA_PAGO) AS MONEDA_PAGO
 FROM TMP_COBR_POLIZA_PERIODO_ABO_CARG COB
 LEFT JOIN TMP_COBR_POLIZA_RECHAZO REC 
         ON REC.PERIODO       = COB.PERIODO
        AND REC.NUMERO_POLIZA = COB.NUMERO_POLIZA
GROUP BY COB.NUMERO_POLIZA
        ,COB.FECHA_PAGADO_HASTA
        ,COB.PERIODO
        ,COB.PERIODO_ANIO
        ,COB.PERIODO_MES
        ,REC.RECHAZO
        ,COB.VIA_COBRO
);
-- ----------------------------------------------------------------------
-- Paso 9 : POLIZA - PERIODO - Monto abono total en el periodo de 21 a 20(Periodo Comercial)
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_COBR_POLIZA_PERIODO_ABONO
AS
(
    SELECT
             NUMERO_POLIZA
            ,PERIODO_PAGO
            ,SUM(IFNULL(MONTO_CANTIDAD_PAGO,0)) AS TOTAL_COBRADO
       FROM TB_COBR_POLIZA_CARGO
    GROUP BY NUMERO_POLIZA
            ,PERIODO_PAGO
);
-- ----------------------------------------------------------------------
-- Paso 10 : Elimina el Periodo y Carga lo actualizado
-- ----------------------------------------------------------------------
DELETE 
  FROM  `goldenrecord_data`.TB_COBRANZA_POLIZA_MDC TAB
 WHERE TAB.PERIODO_COBRANZA IN (SELECT DISTINCT PERIODO 
                                  FROM TMP_COBR_PERIODO_ACTUAL );
-- ----------------------------------------------------------------------
-- Paso 11: TABLA FINAL [RESUMEN]
-- ----------------------------------------------------------------------
INSERT 
  INTO `goldenrecord_data`.TB_COBRANZA_POLIZA_MDC
(  
       NUMERO_POLIZA
      ,ID_PRODUCTO
      ,NOMBRE_PRODUCTO
      ,NOMBRE_GRUPO_PRODUCTO
      ,FECHA_EMISION
      ,FECHA_INICIO_VIGENCIA
      ,FECHA_FIN_VIGENCIA
      ,MONEDA
      ,PRIMA_NETA
      ,FRECUENCIA_PAGO
      ,ESTADO
      ,NUMERO_DOCUMENTO
      ,TIPO_DOCUMENTO
      ,APELLIDO_PATERNO
      ,APELLIDO_MATERNO
      ,NOMBRE
      ,RAZON_SOCIAL
      ,FECHA_NACIMIENTO
      ,GENERO
      ,ESTADO_CIVIL
      ,EDAD
      ,CORREO_LN
      ,CORREO_UL
      ,TELEFONO_FIJO_LN
      ,TELEFONO_FIJO_LN_RECIENTE
      ,TELEFONO_MOVIL_LN
      ,TELEFONO_MOVIL_LN_RECIENTE
      ,MONTO_PAGO
      ,MONEDA_PAGO
      ,FECHA_PAGADO_HASTA
      ,VIA_COBRO
      ,FECHA_PAGO
      ,CANTIDAD_DIA_VENCIMIENTO
      ,MORA
      ,CUENTA_POR_COBRAR
      ,MOTIVO_RECHAZO
      ,PERIODO_COBRANZA
      ,MES_COBRANZA
      ,ANIO_COBRANZA
      ,COD_AGENTE_ACTUAL
      ,NOMBRES_AGENTE_ACTUAL
      ,AGENCIA_ACTUAL
      ,CORREO_AGENTE
      ,CARGO_AGENTE
      ,CELULAR_AGENTE
      ,SUPERVISOR_AGENTE
      ,SCORE
      ,ULTIMA_VIA_PAGO
      ,FECHA_ACTUALIZACION_TABLA
)
    SELECT  POL.NUMERO_POLIZA
           ,POL.ID_PRODUCTO
           ,POL.NOMBRE_PRODUCTO
           ,POL.NOMBRE_GRUPO_PRODUCTO
           ,POL.FECHA_EMISION 
           ,POL.FECHA_INICIO_VIGENCIA
           ,POL.FECHA_FIN_VIGENCIA
           ,POL.MONEDA 
           ,IFNULL(POL.PRIMA_NETA,0) AS PRIMA_NETA
           ,POL.FRECUENCIA_PAGO 
           ,POL.ESTADO
           ,CON.NUMERO_DOCUMENTO
           ,CON.TIPO_DOCUMENTO
           ,CON.APELLIDO_PATERNO
           ,CON.APELLIDO_MATERNO
           ,CON.NOMBRE
           ,CON.RAZON_SOCIAL
           ,CON.FECHA_NACIMIENTO
           ,CON.GENERO
           ,CON.ESTADO_CIVIL
           ,CON.EDAD
           ,CON.CORREO_LN
           ,CON.CORREO_UL
           ,CON.TELEFONO_FIJO_LN
           ,CON.TELEFONO_FIJO_LN_RECIENTE
           ,CON.TELEFONO_MOVIL_LN
           ,CON.TELEFONO_MOVIL_LN_RECIENTE
           --,CAST(NULL AS STRING ) AS FECHA_FIN_VIGENCIA_COBERTURA
           ,COALESCE(ABO.TOTAL_COBRADO,0) AS MONTO_PAGO
           ,(CASE 
                 WHEN PAG.MONEDA_PAGO = 'USD' 
                 THEN 'US Dolar'
                 WHEN PAG.MONEDA_PAGO ='PEN' 
                 THEN 'Nuevo Sol'
             END) AS MONEDA_PAGO
           --,FEC.FECHA_PAGADO_HASTA
		   ,COALESCE(PAH.FECHA_PAGADO_HASTA,FEC.FECHA_PAGADO_HASTA) AS FECHA_PAGADO_HASTA
           ,PAG.VIA_COBRO
           ,FEC.FECHA_PAGO
           ,FEC.CANTIDAD_DIA_VENCIMIENTO
           --,CAST(NULL AS STRING ) AS TIPO_CAMBIO
           ,FEC.MORA
           ,PAG.CUENTA_POR_COBRAR
           ,PAG.RECHAZO
           ,POL.PERIODO           AS PERIODO_COBRANZA
           ,POL.PERIODO_MES       AS MES_COBRANZA
           ,POL.PERIODO_ANIO      AS ANIO_COBRANZA
           ,AGE.COD_AGENTE_FINAL        AS COD_AGENTE_ACTUAL
           ,AGE.NOMBRE_AGENTE_FINAL     AS NOMBRES_AGENTE_ACTUAL
           ,AGE.COD_AGENCIA_FINAL       AS AGENCIA_ACTUAL
           ,AGE.CELULAR_AGENTE_FINAL    AS CORREO_AGENTE
           ,AGE.CARGO_AGENTE_FINAL      AS CARGO_AGENTE
           ,AGE.CELULAR_AGENTE_FINAL    AS CELULAR_AGENTE
           ,AGE.SUPERVISOR_AGENTE_FINAL AS SUPERVISOR_AGENTE
           ,SCO.SCORE
           ,TAB.ULTIMA_VIA_PAGO
           ,FORMAT_DATETIME('%Y-%m-%d %H:%M:%S',CURRENT_DATETIME('America/Lima')) AS FECHA_ACTUALIZACION_TABLA
       FROM TMP_COBR_POLIZA_UNI POL
 INNER JOIN TMP_COBR_CONTRATANTE_UNI CON
         ON POL.ID_PERSONA        = CON.ID_PERSONA
  LEFT JOIN TMP_COBR_POLIZA_PERIODO_ABONO ABO 
         ON POL.NUMERO_POLIZA_INT = ABO.NUMERO_POLIZA
        AND CAST(POL.PERIODO AS STRING)= ABO.PERIODO_PAGO
  LEFT JOIN TMP_COBR_POLIZA_PERIODO_CARGO PAG
         ON POL.NUMERO_POLIZA_INT = PAG.NUMERO_POLIZA
  LEFT JOIN TMP_COBR_POLIZA_FECHAS FEC
         ON POL.NUMERO_POLIZA_INT = FEC.NUMERO_POLIZA
  LEFT JOIN goldenrecord_data.POLIZA_AGENTE AGE 
         ON AGE.NUMERO_POLIZA     = POL.NUMERO_POLIZA
  LEFT JOIN inputfiles.BASE_VIDA_SCORED_landing SCO
         ON POL.NUMERO_POLIZA_INT = SCO.NUM_POLIZA
  LEFT JOIN (
              SELECT 
               NUMERO_POLIZA
              ,(CASE WHEN TIPO_INGRESO='TRAMA' 
                     THEN NOMBRE_VIA_PAGO
                     ELSE VIA_COBRO
               END) AS ULTIMA_VIA_PAGO
              ,ROW_NUMBER() OVER( PARTITION BY NUMERO_POLIZA ORDER BY FEC_APLICADO DESC ) AS CORRELATIVO 
              FROM TB_COBR_POLIZA_CARGO
              ) TAB
       ON TAB.NUMERO_POLIZA = POL.NUMERO_POLIZA_INT
      AND TAB.CORRELATIVO   = 1
  LEFT JOIN `iter-data-storage-pv-uat.acsele_data.PAGADO_HASTA_raw`  PAH
		 ON PAH.NUMERO_POLIZA = POL.NUMERO_POLIZA
;


-- ----------------------------------------------------------------------
-- Paso 12: TABLA FINAL [HISTORIA]
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `goldenrecord_data`.TB_COBRANZA_POLIZA_CARGO_MDC
AS 
 (    SELECT DISTINCT
             UNI.NUMERO_POLIZA
            ,UNI.FECHA_EMISION
            ,UNI.FECHA_INICIO_VIGENCIA
            ,UNI.FECHA_FIN_VIGENCIA
            ,UNI.NOMBRE_PRODUCTO
            ,UNI.MONEDA
            ,IFNULL(UNI.PRIMA_NETA,0) AS PRIMA_NETA
            ,UNI.FRECUENCIA_PAGO
            ,UNI.ESTADO
            ,UNI.PLAN
            ,UNI.NOMBRE_GRUPO_PRODUCTO
            ,UNI.ID_PRODUCTO
            ,CON.NUMERO_DOCUMENTO
            ,CON.TIPO_DOCUMENTO
            ,CON.APELLIDO_PATERNO
            ,CON.APELLIDO_MATERNO
            ,CON.NOMBRE
            ,CON.RAZON_SOCIAL
            ,CON.FECHA_NACIMIENTO
            ,CON.GENERO
            ,CON.ESTADO_CIVIL
            ,CON.EDAD
            ,CON.TELEFONO_MOVIL_LN_RECIENTE
            ,CON.TELEFONO_MOVIL_LN
            ,CON.TELEFONO_FIJO_LN_RECIENTE
            ,CON.TELEFONO_FIJO_LN
            ,CON.CORREO_UL
            ,CON.CORREO_LN
            ,COB.NUMERO_CARGO
            ,(CASE WHEN TACU.ID_CARGO IS NOT NULL 
                  THEN 9999999
                  ELSE COB.NUMERO_ABONO
             END) AS NUMERO_ABONO
            ,COB.CONCEPTO
            ,COB.CONCEPTO_DESCRIPCION
            ,COB.FECHA_COBERTURA_INICIO
            ,COB.FECHA_COBERTURA_FIN
            ,COALESCE(PAH.FECHA_PAGADO_HASTA,COB.FECHA_PAGADO_HASTA) AS FECHA_PAGADO_HASTA
            ,COB.FLG_MORA
            ,COB.MONTO_CARGO_CANTIDAD
            ,COB.SALDO_CARGO_CANTIDAD
            ,COB.SALDO_CARGO_MONEDA
            ,(CASE WHEN COB.ESTADO_CARGO=0 THEN 'Desconocido'
                   WHEN COB.ESTADO_CARGO=1 THEN 'Activo'
                   WHEN COB.ESTADO_CARGO=2 THEN 'Desactivo'
                   WHEN COB.ESTADO_CARGO=3 THEN 'Eliminado'
                   WHEN COB.ESTADO_CARGO=4 THEN 'Comodin'
                   WHEN COB.ESTADO_CARGO=5 THEN 'Inhabilitado'
                   WHEN COB.ESTADO_CARGO=6 THEN 'Diferido'
             END) AS ESTADO_CARGO
            ,COB.MONTO_MONEDA_PAGO
            ,
            CASE
            WHEN COALESCE(COB.SALDO_CARGO_CANTIDAD,0)=0 
            AND UNI.NOMBRE_PRODUCTO='VIDACASHSTOCK' THEN COB.MONTO_CARGO_CANTIDAD
            WHEN TACU.ID_CARGO IS NOT NULL  THEN COB.MONTO_CARGO_CANTIDAD
            ELSE  COB.MONTO_CANTIDAD_PAGO END AS MONTO_CANTIDAD_PAGO
            ,DATE(COB.FEC_APLICADO) AS FEC_APLICADO
            ,FORMAT_DATE('%Y%m',DATE(COB.FEC_APLICADO)) AS PERIODO_PAGO
            ,COB.MONTO_ORIGEN_MONEDA
            ,COB.VALOR_MONEDA_ORIGEN
            ,COB.FEC_REGISTRO_CAJA
            ,(CASE 
              WHEN COB.ESTADO_PAGO ='Activo' THEN 'PAGADO' 
              WHEN COALESCE(COB.SALDO_CARGO_CANTIDAD,0)=0 AND UNI.NOMBRE_PRODUCTO='VIDACASHSTOCK' THEN 'PAGADO'
              WHEN TACU.ID_CARGO IS NOT NULL  THEN 'PAGADO'
            ELSE 'IMPAGO' END ) AS ESTADO_PAGO
            ,COB.ESTADO_PAGO AS ESTADO_PAGO_SAMP
            ,COB.TIPO_DEL_INGRESO
            ,COB.PERIODO_COBRANZA
            ,(CASE WHEN COB.TIPO_INGRESO='TRAMA' 
                  THEN COB.NOMBRE_VIA_PAGO
                  ELSE COB.VIA_COBRO
             END) AS VIA_COBRO
            ,COB.NOMBRE_VIA_PAGO  
            ,COB.TIPO_INGRESO
            ,TCP.TIPO_CUENTA
            ,COB.NOMBRE_BANCO_PAGO
            ,AGE.COD_AGENTE_FINAL         AS COD_AGENTE_ACTUAL
            ,AGE.NOMBRE_AGENTE_FINAL      AS NOMBRES_AGENTE_ACTUAL
            ,AGE.COD_AGENCIA_FINAL        AS AGENCIA_ACTUAL
            ,AGE.CELULAR_AGENTE_FINAL     AS CORREO_AGENTE
            ,AGE.CARGO_AGENTE_FINAL       AS CARGO_AGENTE
            ,AGE.CELULAR_AGENTE_FINAL     AS CELULAR_AGENTE
            ,AGE.SUPERVISOR_AGENTE_FINAL  AS SUPERVISOR_AGENTE
            ,AGE.JEFE_AGENTE_FINAL        AS JEFE_AGENTE
            ,COB.NUMERO_VIA_PAGO
            ,COB.DESCRIPCION_VIA_PAGO
            ,FORMAT_DATETIME('%Y-%m-%d %H:%M:%S',CURRENT_DATETIME('America/Lima')) AS FECHA_ACTUALIZACION_TABLA
      FROM TMP_COBR_POLIZA_UNI UNI
     INNER JOIN TMP_COBR_CONTRATANTE_UNI CON 
             ON CON.ID_PERSONA        = UNI.ID_PERSONA
      LEFT JOIN TB_COBR_POLIZA_CARGO COB
             ON UNI.NUMERO_POLIZA_INT = COB.NUMERO_POLIZA
      LEFT JOIN goldenrecord_data.POLIZA_AGENTE AGE 
             ON AGE.NUMERO_POLIZA = UNI.NUMERO_POLIZA
      LEFT JOIN TMP_COBR_POLIZA_TIPOCUENTA_AFI TCP
             ON UNI.NUMERO_POLIZA_INT = TCP.NUMERO_POLIZA
            AND TCP.CORRELATIVO = 1      
	  LEFT JOIN `iter-data-storage-pv-uat.acsele_data.PAGADO_HASTA_raw`  PAH
	         ON PAH.NUMERO_POLIZA = UNI.NUMERO_POLIZA
      LEFT JOIN `iter-data-storage-pv-uat.samp_data.stk_vidacash_log_migra_oi_raw` TACU
             ON TACU.NUMERO_POLIZA=SAFE_CAST(UNI.NUMERO_POLIZA AS NUMERIC) 
            AND TACU.ID_CARGO  =SAFE_CAST(COB.ID_CARGO AS NUMERIC)
);

SELECT 'OK' ESTADO_EJECUCION;

END;