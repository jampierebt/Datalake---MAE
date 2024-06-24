CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_goldenrecord_poliza_cargo_abono()
OPTIONS(
  strict_mode=true)
BEGIN 
-- *********************************************************************
-- * Proyecto       : GOLDEN RECORD
-- * Fecha          : 17/08/2021
-- * Autor          : Ramirez Hurtado, Tito Jaime
-- * Tabla Destinos : - 
-- *                : - 
-- * Tablas Fuentes : - 
-- * Descripción    :  
-- *********************************************************************
-- *                       MODIFICACIONES POSTERIORES                  *
-- *===================================================================*
-- *===================================================================*
-- *   Fecha   | Persona |           Modificación Realizada            *
-- *           |         |                                            
-- *********************************************************************

-- =========================================================================================================
-- Paso 1: Universo de ID_PLANILLA y su detalle
-- =========================================================================================================

CREATE OR REPLACE TABLE  `iter-data-storage-pv-uat.samp_data.ABONO_CARGO_CLEAR`
AS
SELECT * FROM `iter-data-storage-pv-uat.samp_data.ABONO_CARGO_raw` 
WHERE COALESCE(ID_DEVOLUCION,0) NOT IN (
  SELECT DISTINCT COALESCE(ID_DEVOLUCION,0) FROM `iter-data-storage-pv-uat.samp_data.ABONO_CARGO_raw`
WHERE ID_CARGO IN (
  SELECT DISTINCT ID_CARGO FROM `iter-data-storage-pv-uat.samp_data.ABONO_CARGO_raw`
  WHERE ID_ABONO IN (SELECT ID_ABONO FROM `iter-data-storage-pv-uat.samp_data.ABONO_ERROR` ))
  AND ID_DEVOLUCION IS NOT NULL
  );

CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_COBR_PLANILLA_VIA_CA`
AS 
(
WITH TMP_VIA_ORIGEN_PAGO
AS(
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

-- =========================================================================================================
-- Paso A08: Relacion ABONO - PLANILLA [Caso donde un mismo ABONO esta asociado a 2 Planillas, por eso  cosiderar el mas reciente(ultimo) ]
-- =========================================================================================================
CREATE OR REPLACE  TABLE `iter-data-storage-pv-uat.temp.TMP_COBR_PLANILLA_ABONO_CA`
AS
(
WITH TMP_PLANILLA_DUP
AS(
SELECT   ID_PLANILLA
        ,ID_ABONO
        ,GLOSA_CONCEPTO
        ,CODIGO_CONCEPTO
        ,ROW_NUMBER()OVER(PARTITION BY ID_PLANILLA, ID_ABONO ORDER BY FECHA_CREACION DESC ) AS FLG_ULTIMO
  FROM `iter-data-storage-pv-uat.samp_data.DETALLE_PLANILLA_raw`
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
 INNER JOIN `iter-data-storage-pv-uat.samp_data.PLANILLA_raw` PLA
         ON PRP.ID_PLANILLA   = PLA.ID_PLANILLA
  LEFT JOIN `iter-data-storage-pv-uat.temp.TMP_COBR_PLANILLA_VIA_CA` PLI 
         ON PLI.ID_PLANILLA   = PLA.ID_PLANILLA
      WHERE PRP.FLG_ULTIMO = 1
);

-- ----------------------------------------------------------------------
-- Paso A09: VIA DE PAGO AGG [ POLIZA - ABONO ]
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_COBR_VIAS_PAGO`
AS
(
WITH TMP_VIA_ORIGEN_PAGO_PERU
AS(
        SELECT 
               cp.NUMERO_POLIZA
              ,ab.ID_ABONO
              ,ab.NUMERO_ABONO           
              ,MIN(dm.ID_DETALLE_MOVIMIENTO) AS ID_DETALLE_MOVIMIENTO
              ,MIN(pl.ID_PLANILLA) AS ID_PLANILLA
        FROM  `iter-data-storage-pv-uat.samp_data.ABONO_raw` ab 
              INNER JOIN `iter-data-storage-pv-uat.samp_data.CUENTA_POLIZA_raw` cp ON cast(cp.ID as string) = ab.ID_CUENTA_POLIZA
              INNER JOIN `iter-data-storage-pv-uat.samp_data.DETALLE_MOVIMIENTO_raw` dm ON dm.ID_ABONO = ab.ID_ABONO
              INNER JOIN `iter-data-storage-pv-uat.samp_data.PLANILLA_raw` pl ON pl.ID_PLANILLA = dm.ID_PLANILLA
        WHERE AB.ESTADO = 1        
              AND (
                     (DM.TIPO_MOVIMIENTO = 1 AND DM.TIPO_DETALLE IN(  1, 2) )
                  OR (DM.TIPO_MOVIMIENTO = 2 AND DM.TIPO_DETALLE IN ( 1,39) )
                  )        
              AND PL.ESTADO_PLANILLA <> 3
              AND DM.ESTADO = 1
        GROUP BY 
             cp.NUMERO_POLIZA
            ,ab.ID_ABONO
            ,ab.NUMERO_ABONO
   ) 
   SELECT 
       T.ID_ABONO
      ,T.NUMERO_ABONO
      ,T.NUMERO_POLIZA
      ,T.ID_DETALLE_MOVIMIENTO
      ,T.ID_PLANILLA
      ,PL.ORIGEN_RECAUDACION
      ,PL.DESCRIPCION
      ,COALESCE(cast(vc.NUM_VIA_PAGO_COBRO as string),'') AS  NUM_VIA_PAGO_COBRO
   FROM  TMP_VIA_ORIGEN_PAGO_PERU T
   LEFT JOIN `iter-data-storage-pv-uat.samp_data.PLANILLA_raw` PL
         ON PL.ID_PLANILLA = T.ID_PLANILLA      
   LEFT JOIN `iter-data-storage-pv-uat.samp_data.ORIGEN_RECAU_VIA_PAGO_COB_raw` vc 
         ON pl.ORIGEN_RECAUDACION = vc.Id_origen_reca_planilla
);

-- ----------------------------------------------------------------------
-- Paso A10: Via de Cobro
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_COBR_VIA_COBRO_DF` 
AS 
(
    SELECT  AFI.NUMERO_POLIZA
             ,VIA.NOMBRE AS VIA_COBRO
      FROM `iter-data-storage-pv-uat.samp_data.AFILIACION_raw` AFI
INNER JOIN `iter-data-storage-pv-uat.samp_data.VIA_COBRO_raw` VIA
        ON AFI.ID_VIA_COBRO=VIA.ID
      WHERE AFI.ESTADO_AFILIACION = 4
        AND CODIGO_PRODUCTO IN (1, 2, 4)
        AND VIA.ESTADO_COBRANZA = 1
-- En caso tiene mas de dos en el mismo periodo, toma el mas reciente.
QUALIFY (ROW_NUMBER() OVER(PARTITION BY AFI.NUMERO_POLIZA ORDER BY AFI.FECHA_AFILIACION DESC )) = 1 
);

-- ----------------------------------------------------------------------
-- Paso A10: TABLA FINAL AGG [ DEVOLUCION - CARGO - ABONO - POLIZA]
-- ----------------------------------------------------------------------
-- ===================================================================================
--                                     POLIZA CON CARGOS              
-- ===================================================================================
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_POLIZA_CARGO_ABONO_UNIVERSO`
-- CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_CARGO_ABONO`
-- PARTITION BY DATE_TRUNC(CARGO_FECHA_COBERTURA_INICIO,MONTH)
CLUSTER BY ID_PRODUCTO
AS
(
WITH TMP_ABONO_CARGO
AS (
SELECT * EXCEPT(ULTIMA_RELACION)
FROM(
SELECT
       ID_ABONO
       ,ID_CARGO
       ,ID_DEVOLUCION
       ,ID_ABONO_CARGO
       ,MONTO_CANTIDAD
       ,MONTO_MONEDA
       --,FEC_APLICADO
       ,(CASE WHEN NULLIF(DATE(DATETIME(FEC_APLICADO,'America/Lima')),DATE(0001,01,01)) IS NOT NULL THEN FEC_APLICADO END)   AS FEC_APLICADO
       ,ROW_NUMBER()OVER(PARTITION BY ID_ABONO,ID_CARGO,ID_DEVOLUCION ORDER BY FEC_APLICADO DESC ) AS ULTIMA_RELACION
       --FROM `iter-data-storage-pv-uat.samp_data.ABONO_CARGO_raw`
       FROM `iter-data-storage-pv-uat.samp_data.ABONO_CARGO_CLEAR`
)TAB
WHERE TAB.ULTIMA_RELACION = 1
 -- AND TAB.ID_ABONO NOT IN (SELECT CAST(ID_ABONO AS STRING) AS ID_ABONO FROM  `iter-data-storage-pv-uat.samp_data.ABONO_ERROR` )
  -- ERROR EN LOS ABONOS, NO APLICA
  AND IFNULL(TAB.ID_ABONO,"0") NOT IN (SELECT CAST(ID_ABONO AS STRING) AS ID_ABONO FROM  `iter-data-storage-pv-uat.samp_data.ABONO_ERROR` )
 -- AND TAB.ID_DEVOLUCION NOT IN (SELECT ID_DEVOLUCION FROM `iter-data-storage-pv-uat.samp_data.DEVOLUCION_ERROR`)
)
,TMP_CUENTA_POLIZA AS (
SELECT DISTINCT
 ID
,NUMERO_POLIZA
,ID_POLIZA_ACSELE
FROM `iter-data-storage-pv-uat.samp_data.CUENTA_POLIZA_raw`
)
,TMP_POLIZA_ACSELE AS (
SELECT
       NOMBRE_PRODUCTO
      ,ID_PRODUCTO
      ,NOMBRE_GRUPO_PRODUCTO
      ,NUMERO_POLIZA
      ,SAFE_CAST(NUMERO_POLIZA AS INT64) AS NUMERO_POLIZA_INT
      ,FRECUENCIA_PAGO
 FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA`
WHERE ID_FUENTE IN ('01','80')
AND SAFE_CAST(NUMERO_POLIZA AS INT64) IS NOT NULL
)
,TMP_TIPO_CAMBIO AS (
    SELECT
         CAST(PERIODO AS STRING) AS PERIODO
        ,MONTO_TIPO_CAMBIO AS TIPO_CAMBIO_PERIODO
      FROM `iter-data-storage-pv-uat.goldenrecord_data.DIM_TIPO_CAMBIO_CONTABLE` 
    WHERE FRECUENCIA ='MENSUAL'
), TMP_TIPO_CAMBIO_CONTABLE AS (
    SELECT
         FECHA
        ,MONTO_TIPO_CAMBIO
      FROM `iter-data-storage-pv-uat.goldenrecord_data.DIM_TIPO_CAMBIO_CONTABLE` 
    WHERE FRECUENCIA ='DIARIO'
)
SELECT DISTINCT
 CURRENT_DATE AS FECHA_PROCESO
,'SAMP' AS FUENTE
,IMC.NUMERO_POLIZA AS NUMERO_POLIZA_INT
,ACC.NOMBRE_PRODUCTO
,ACC.NOMBRE_GRUPO_PRODUCTO
,ACC.ID_PRODUCTO
,ACC.NUMERO_POLIZA
,CAR.ID AS ID_CARGO
,CAR.NUMERO_CARGO
,COALESCE(ABC.ID_ABONO,'0') AS ID_ABONO
,COALESCE(ABO.NUMERO_ABONO,0) AS NUMERO_ABONO
,COALESCE(ABC.ID_DEVOLUCION,0) AS ID_DEVOLUCION
,ABC.ID_ABONO_CARGO
,CAR.CONCEPTO AS CONCEPTO_CARGO
,UPPER(COB.DESCRIPCION) AS CONCEPTO_CARGO_TIPO_INGRESO
,(CASE WHEN CAR.ESTADO=0 THEN 'DESCONOCIDO'
       WHEN CAR.ESTADO=1 THEN 'ACTIVO'
       WHEN CAR.ESTADO=2 THEN 'DESACTIVO' 
       WHEN CAR.ESTADO=3 THEN 'ELIMINADO'
       WHEN CAR.ESTADO=4 THEN 'COMODIN'
       WHEN CAR.ESTADO=5 THEN 'INHABILITADO'
       WHEN CAR.ESTADO=6 THEN 'DIFERIDO'
       ELSE CAST(CAR.ESTADO AS STRING)
  END) AS ESTADO_CARGO
,DATE(DATETIME(FECHA_COBERTURA_INICIO)) AS CARGO_FECHA_COBERTURA_INICIO
,DATE(DATETIME(CAR.FECHA_COBERTURA_FIN,'America/Lima')) AS CARGO_FECHA_COBERTURA_FIN
,DATE(DATETIME(CAR.PERIODO_COBRANZA,'America/Lima')) AS CARGO_PERIODO_COBRANZA
,CAR.MONTO_CARGO_CANTIDAD
,CAR.MONTO_CARGO_MONEDA
,CASE WHEN COALESCE(ABC.ID_DEVOLUCION,0)!=0 
      THEN 0 
      -- En caso el saldo es negativo, considerar 0.
      ELSE IF(MAX(COALESCE(CAR.MONTO_CARGO_CANTIDAD,0))OVER(PARTITION BY CAR.NUMERO_CARGO,IMC.NUMERO_POLIZA)-(
           SUM(CASE WHEN COALESCE(ABC.ID_DEVOLUCION,0)=0  THEN COALESCE(ABC.MONTO_CANTIDAD,0) ELSE 0 END )OVER(PARTITION BY CAR.NUMERO_CARGO,IMC.NUMERO_POLIZA)+
            SUM(CASE WHEN COALESCE(ABC.ID_DEVOLUCION,0)!=0 THEN COALESCE(ABC.MONTO_CANTIDAD,0) ELSE 0 END )OVER(PARTITION BY CAR.NUMERO_CARGO,IMC.NUMERO_POLIZA))<=0,0,
            MAX(COALESCE(CAR.MONTO_CARGO_CANTIDAD,0))OVER(PARTITION BY CAR.NUMERO_CARGO,IMC.NUMERO_POLIZA)-(
           SUM(CASE WHEN COALESCE(ABC.ID_DEVOLUCION,0)=0  THEN COALESCE(ABC.MONTO_CANTIDAD,0) ELSE 0 END )OVER(PARTITION BY CAR.NUMERO_CARGO,IMC.NUMERO_POLIZA)+
            SUM(CASE WHEN COALESCE(ABC.ID_DEVOLUCION,0)!=0 THEN COALESCE(ABC.MONTO_CANTIDAD,0) ELSE 0 END )OVER(PARTITION BY CAR.NUMERO_CARGO,IMC.NUMERO_POLIZA))
            )
  END AS SALDO_CANTIDAD
,CAR.SALDO_MONEDA
-- ABONO
,ABO.COD_CONCEPTO_ABONO
,ABO.FEC_REGISTRO_CAJA  AS FECHA_REGISTRO_CAJA
,DATE(DATETIME(ABO.FEC_REGISTRO_CAJA,'America/Lima')) AS FECHA_REGISTRO_CAJA_P
,ABO.FEC_REGISTRO_ABONO AS FECHA_REGISTRO_ABONO
,ABO.MONTO_ORIGEN_MONEDA
,ABC.MONTO_CANTIDAD
,ABC.MONTO_MONEDA
,DATETIME(ABC.FEC_APLICADO ,'America/Lima') AS FECHA_APLICADO_CARGO_ABONO
,IFNULL(ABO.VALOR_MONEDA_ORIGEN,0) AS VALOR_MONEDA_ORIGEN	
,IFNULL(ABO.MONTO_ORIGEN_CANTIDAD,0) AS MONTO_ORIGEN_CANTIDAD
,IFNULL(ABO.VALOR_SALDO_ORIGEN,0) AS VALOR_SALDO_ORIGEN
,(CASE WHEN ABO.ESTADO=0 THEN 'DESCONOCIDO'
              WHEN ABO.ESTADO=1 THEN 'ACTIVO'
              WHEN ABO.ESTADO=2 THEN 'ANULADO'
  END) AS ESTADO_ABONO
,TIP.NOMBRE_CORTO_TIPO_INGRESO   AS TIPO_ABONO
,CAM.TIPO_CAMBIO_PERIODO AS TIPO_CAMBIO_PERIODO_ABONO
,CAO.TIPO_CAMBIO_PERIODO AS TIPO_CAMBIO_PERIODO_CARGO

,CAMJ.MONTO_TIPO_CAMBIO AS TIPO_CAMBIO_DIA_ABONO
,CAOJ.MONTO_TIPO_CAMBIO AS TIPO_CAMBIO_DIA_CARGO

,(CASE WHEN CAR.MONTO_CARGO_MONEDA='PEN' THEN MONTO_CARGO_CANTIDAD ELSE MONTO_CARGO_CANTIDAD*CAOJ.MONTO_TIPO_CAMBIO END) AS MONTO_CARGO_CANTIDAD_PEN
,(CASE WHEN CAR.MONTO_CARGO_MONEDA='USD' THEN MONTO_CARGO_CANTIDAD ELSE MONTO_CARGO_CANTIDAD/CAOJ.MONTO_TIPO_CAMBIO END) AS MONTO_CARGO_CANTIDAD_USD
,(CASE WHEN COALESCE(ABC.ID_DEVOLUCION,0)!=0 
      THEN 0
      ELSE (CASE WHEN CAR.SALDO_MONEDA='PEN' THEN SALDO_CANTIDAD ELSE SALDO_CANTIDAD*CAOJ.MONTO_TIPO_CAMBIO END)
  END) AS SALDO_CANTIDAD_PEN
,(CASE WHEN COALESCE(ABC.ID_DEVOLUCION,0)!=0 
      THEN 0
      ELSE (CASE WHEN CAR.SALDO_MONEDA='USD' THEN SALDO_CANTIDAD ELSE SALDO_CANTIDAD/CAOJ.MONTO_TIPO_CAMBIO END) 
 END) AS SALDO_CANTIDAD_USD
,(CASE WHEN ABC.MONTO_MONEDA='PEN' THEN ABC.MONTO_CANTIDAD ELSE ABC.MONTO_CANTIDAD*CAMJ.MONTO_TIPO_CAMBIO END) AS MONTO_CANTIDAD_ABONO_PEN
,(CASE WHEN ABC.MONTO_MONEDA='USD' THEN ABC.MONTO_CANTIDAD ELSE ABC.MONTO_CANTIDAD/CAMJ.MONTO_TIPO_CAMBIO END) AS MONTO_CANTIDAD_ABONO_USD
,ACC.FRECUENCIA_PAGO
,JUJU.NUMERO_VIA_PAGO
,JUJU.DESCRIPCION_VIA_PAGO
,PPP.ORIGEN_RECAUDACION
,PPP.DESCRIPCION
,PPP.NUM_VIA_PAGO_COBRO
,VICO.VIA_COBRO
,MAX(CASE WHEN COALESCE(ABC.ID_DEVOLUCION,0)!=0 THEN TRUE ELSE FALSE END)OVER(PARTITION BY IMC.NUMERO_POLIZA,CAR.ID ) AS FLAG_CARGO_DEVOLUCION
      FROM `iter-data-storage-pv-uat.samp_data.CARGO_raw` CAR
INNER JOIN TMP_CUENTA_POLIZA IMC
        ON IMC.ID        = CAR.ID_CUENTA_POLIZA
 LEFT JOIN TMP_ABONO_CARGO ABC
        ON ABC.ID_CARGO = CAST(CAR.ID AS STRING)
 LEFT JOIN `iter-data-storage-pv-uat.samp_data.ABONO_raw` ABO
	 ON CAST(ABO.ID_ABONO AS STRING) = ABC.ID_ABONO   
 LEFT JOIN `iter-data-storage-pv-uat.samp_data.TIPO_INGRESO_ABONO_raw` TIP
        ON ABO.ID_TIPO_INGRESO_ABONO = TIP.ID_TIPO_INGRESO_ABONO
 LEFT JOIN `iter-data-storage-pv-uat.samp_data.CONCEPTO_COBRANZA_raw` COB
        ON COB.CODIGO    =CAST(CAR.CONCEPTO AS STRING)
 LEFT JOIN TMP_POLIZA_ACSELE ACC 
        ON ACC.NUMERO_POLIZA_INT = IMC.NUMERO_POLIZA
 LEFT JOIN TMP_TIPO_CAMBIO CAM
        ON CAM.PERIODO = FORMAT_DATE("%Y%m", DATE_SUB(DATE(DATETIME(ABC.FEC_APLICADO,'America/Lima')) , INTERVAL 1 MONTH) )
 LEFT JOIN TMP_TIPO_CAMBIO CAO
        ON CAO.PERIODO = FORMAT_DATE("%Y%m", DATE_SUB(DATE(DATETIME(FECHA_COBERTURA_INICIO)), INTERVAL 1 MONTH) )
 LEFT JOIN TMP_TIPO_CAMBIO_CONTABLE CAMJ
        ON CAMJ.FECHA = DATE(DATETIME(ABO.FEC_REGISTRO_CAJA,'America/Lima'))
 LEFT JOIN TMP_TIPO_CAMBIO_CONTABLE CAOJ
        ON CAOJ.FECHA = DATE(DATETIME(FECHA_COBERTURA_INICIO))
 LEFT JOIN `iter-data-storage-pv-uat.temp.TMP_COBR_PLANILLA_ABONO_CA` JUJU  
        ON CAST(ABC.ID_ABONO AS STRING) = JUJU.ID_ABONO  
       AND JUJU.FLG_ULTIMO = 1
 LEFT JOIN `iter-data-storage-pv-uat.temp.TMP_COBR_VIAS_PAGO` PPP 
        ON CAST(PPP.ID_ABONO AS STRING) =  CAST(ABO.ID_ABONO AS STRING)
 --LEFT JOIN TMP_VIA_COBRO VICO 
 LEFT JOIN `iter-data-storage-pv-uat.temp.TMP_COBR_VIA_COBRO_DF`  VICO 
  ON VICO.NUMERO_POLIZA = IMC.NUMERO_POLIZA
WHERE CAR.ESTADO NOT IN (3) -- 2,5 se considerar para el analisis
-- ===================================================================================
--                              POLIZA - CON ABONOS  Y SIN CARGOS 
-- ===================================================================================
UNION ALL
SELECT * 
FROM 
(
with
TMP_TIPO_CAMBIO_CONTABLE AS (
    SELECT
         FECHA
        ,MONTO_TIPO_CAMBIO
      FROM `iter-data-storage-pv-uat.goldenrecord_data.DIM_TIPO_CAMBIO_CONTABLE` 
    WHERE FRECUENCIA ='DIARIO'
),
TMP_TIPO_CAMBIO AS (
    SELECT
         CAST(PERIODO AS STRING) AS PERIODO
        ,MONTO_TIPO_CAMBIO AS TIPO_CAMBIO_PERIODO
      FROM `iter-data-storage-pv-uat.goldenrecord_data.DIM_TIPO_CAMBIO_CONTABLE` 
    WHERE FRECUENCIA ='MENSUAL'
),
TMP_CUENTA_POLIZA AS (
SELECT DISTINCT
 ID
,NUMERO_POLIZA
,ID_POLIZA_ACSELE
FROM `iter-data-storage-pv-uat.samp_data.CUENTA_POLIZA_raw`
)
,TMP_POLIZA_ACSELE AS (
SELECT
       NOMBRE_PRODUCTO
      ,ID_PRODUCTO
      ,NOMBRE_GRUPO_PRODUCTO
      ,NUMERO_POLIZA
      ,SAFE_CAST(NUMERO_POLIZA AS INT64) AS NUMERO_POLIZA_INT
      ,FRECUENCIA_PAGO
 FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA`
WHERE ID_FUENTE IN ( '01','80' )
 AND NOMBRE_GRUPO_PRODUCTO IN ("VIDA","VEHICULAR")
AND SAFE_CAST(NUMERO_POLIZA AS INT64) IS NOT NULL
),
TMP_ABONO_CARGO
AS (
SELECT * EXCEPT(ULTIMA_RELACION)
FROM(
SELECT
 ID_ABONO
,ID_CARGO
,ID_DEVOLUCION
,ID_ABONO_CARGO
,MONTO_CANTIDAD
,MONTO_MONEDA
,FEC_APLICADO
,ROW_NUMBER()OVER(PARTITION BY ID_ABONO,ID_CARGO,ID_DEVOLUCION ORDER BY FEC_APLICADO DESC ) AS ULTIMA_RELACION
-- FROM `iter-data-storage-pv-uat.samp_data.ABONO_CARGO_raw`
FROM `iter-data-storage-pv-uat.samp_data.ABONO_CARGO_CLEAR`
)TAB
WHERE TAB.ULTIMA_RELACION = 1
)
SELECT
DISTINCT
 CURRENT_DATE AS FECHA_PROCESO     
,'SAMP' AS FUENTE
,ctapol.NUMERO_POLIZA  AS NUMERO_POLIZA_INT
,ACC.NOMBRE_PRODUCTO
,ACC.NOMBRE_GRUPO_PRODUCTO
,ACC.ID_PRODUCTO
,ACC.NUMERO_POLIZA
,0 AS ID_CARGO
,0 AS NUMERO_CARGO  
,COALESCE(ABC.ID_ABONO,'0') AS ID_ABONO 
,ABO.NUMERO_ABONO
,0 AS ID_DEVOLUCION  
,ABC.ID_ABONO_CARGO 
,0 as CONCEPTO_CARGO
,''as CONCEPTO_CARGO_TIPO_INGRESO
,'SIN CARGO'as ESTADO_CARGO
,DATE(DATETIME('0001-01-01')) AS CARGO_FECHA_COBERTURA_INICIO  
,DATE(DATETIME('0001-01-01')) AS CARGO_FECHA_COBERTURA_FIN   
,DATE(DATETIME('0001-01-01')) AS CARGO_PERIODO_COBRANZA   
,0 AS MONTO_CARGO_CANTIDAD
,UPPER(ABO.MONTO_ORIGEN_MONEDA) as MONTO_CARGO_MONEDA
,0 as SALDO_CANTIDAD
,UPPER(ABO.MONTO_ORIGEN_MONEDA) AS SALDO_MONEDA                                       
,ABO.COD_CONCEPTO_ABONO
,ABO.FEC_REGISTRO_CAJA  AS FECHA_REGISTRO_CAJA                           
,DATE(DATETIME(ABO.FEC_REGISTRO_CAJA,'America/Lima')) AS FECHA_REGISTRO_CAJA_P
,ABO.FEC_REGISTRO_ABONO AS FECHA_REGISTRO_ABONO                          
,ABO.MONTO_ORIGEN_MONEDA                              
,IFNULL(ABO.MONTO_ORIGEN_CANTIDAD,0) AS MONTO_CANTIDAD  
,UPPER(ABO.MONTO_ORIGEN_MONEDA) AS MONTO_MONEDA 
,COALESCE(DATETIME(ABC.FEC_APLICADO ,'America/Lima'),DATETIME(ABO.FEC_REGISTRO_ABONO,'America/Lima')) AS FECHA_APLICADO_CARGO_ABONO
,IFNULL(ABO.VALOR_MONEDA_ORIGEN,0) AS VALOR_MONEDA_ORIGEN	
,IFNULL(ABO.MONTO_ORIGEN_CANTIDAD,0) AS MONTO_ORIGEN_CANTIDAD
,IFNULL(ABO.VALOR_SALDO_ORIGEN,0) AS VALOR_SALDO_ORIGEN
,(CASE WHEN ABO.ESTADO=0 THEN 'DESCONOCIDO'
              WHEN ABO.ESTADO=1 THEN 'ACTIVO'
              WHEN ABO.ESTADO=2 THEN 'ANULADO'
  END) AS ESTADO_ABONO 
,TIA.NOMBRE_CORTO_TIPO_INGRESO   AS TIPO_ABONO
,CAM.TIPO_CAMBIO_PERIODO AS TIPO_CAMBIO_PERIODO_ABONO
,0 AS TIPO_CAMBIO_PERIODO_CARGO
,CAMJ.MONTO_TIPO_CAMBIO AS TIPO_CAMBIO_DIA_ABONO
,0 AS TIPO_CAMBIO_DIA_CARGO
,0 AS MONTO_CARGO_CANTIDAD_PEN
,0 AS MONTO_CARGO_CANTIDAD_USD
,0 AS SALDO_CANTIDAD_PEN
,0 AS SALDO_CANTIDAD_USD
,(CASE WHEN ABO.MONTO_ORIGEN_MONEDA='PEN' 
       THEN IFNULL(ABO.MONTO_ORIGEN_CANTIDAD,0) 
       ELSE IFNULL(ABO.MONTO_ORIGEN_CANTIDAD,0)*CAMJ.MONTO_TIPO_CAMBIO 
  END) AS MONTO_CANTIDAD_ABONO_PEN
,(CASE WHEN ABO.MONTO_ORIGEN_MONEDA='USD' 
       THEN IFNULL(ABO.MONTO_ORIGEN_CANTIDAD,0) 
       ELSE IFNULL(ABO.MONTO_ORIGEN_CANTIDAD,0)/CAMJ.MONTO_TIPO_CAMBIO 
  END) AS MONTO_CANTIDAD_ABONO_USD  
,ACC.FRECUENCIA_PAGO
,JUJU.NUMERO_VIA_PAGO
,JUJU.DESCRIPCION_VIA_PAGO
,PPP.ORIGEN_RECAUDACION
,PPP.DESCRIPCION
,PPP.NUM_VIA_PAGO_COBRO
,VICO.VIA_COBRO
,FALSE AS FLAG_CARGO_DEVOLUCION
      FROM `iter-data-storage-pv-uat.samp_data.ABONO_raw` ABO
INNER JOIN `iter-data-storage-pv-uat.samp_data.CON_ABOCA_raw` conab 
        ON conab.cod_concepto_abono_cargo = abo.cod_concepto_abono
INNER JOIN TMP_CUENTA_POLIZA ctapol 
        ON ABO.id_cuenta_poliza     = CAST(ctapol.id as string) 
INNER JOIN TMP_POLIZA_ACSELE ACC 
        ON ACC.NUMERO_POLIZA_INT      = ctapol.numero_poliza
 LEFT JOIN `iter-data-storage-pv-uat.samp_data.TIPO_INGRESO_ABONO_raw` tia  
        ON tia.Id_Tipo_Ingreso_Abono = abo.id_tipo_ingreso_abono
 LEFT JOIN TMP_ABONO_CARGO ABC  
        ON CAST(ABO.ID_ABONO AS STRING) = ABC.ID_ABONO
 LEFT JOIN TMP_TIPO_CAMBIO CAM
        ON CAM.PERIODO               = FORMAT_DATE("%Y%m", DATE_SUB(DATE(DATETIME(ABC.FEC_APLICADO,'America/Lima')) , INTERVAL 1 MONTH) )
 LEFT JOIN TMP_TIPO_CAMBIO_CONTABLE CAMJ
        ON CAMJ.FECHA = DATE(DATETIME(ABO.FEC_REGISTRO_CAJA,'America/Lima'))
 LEFT JOIN `iter-data-storage-pv-uat.temp.TMP_COBR_PLANILLA_ABONO_CA` JUJU
        ON CAST(ABC.ID_ABONO AS STRING) = JUJU.ID_ABONO    
       AND JUJU.FLG_ULTIMO=1     
 LEFT JOIN `iter-data-storage-pv-uat.temp.TMP_COBR_VIAS_PAGO` PPP
        ON CAST(PPP.ID_ABONO AS STRING)=  CAST(ABO.ID_ABONO AS STRING)     
 LEFT JOIN `iter-data-storage-pv-uat.temp.TMP_COBR_VIA_COBRO_DF`  VICO
        ON VICO.NUMERO_POLIZA = ctapol.NUMERO_POLIZA
     WHERE (CASE WHEN abo.monto_origen_cantidad = abo.valor_saldo_origen then 'N' when abo.valor_saldo_origen = 0 then 'S' else 'A' end) = 'N'
       AND ABO.estado = 1
       --Considerar solo abonos SIN CARGO
       AND ABC.ID_CARGO IS NULL
       AND CAST(ABO.ID_ABONO AS STRING) NOT IN (SELECT CAST(ID_ABONO AS STRING) AS ID_ABONO FROM  `iter-data-storage-pv-uat.samp_data.ABONO_ERROR`)
       -- ERROR EN LOS ABONOS.
       --AND IFNULL(CAST(ABO.ID_ABONO AS STRING),"0") NOT IN (SELECT CAST(ID_ABONO AS STRING) AS ID_ABONO FROM  `iter-data-storage-pv-uat.samp_data.ABONO_ERROR`)
)
);


-- ----------------------------------------------------------------------
-- Paso 2: Diferencial con los registros nuevos y Modificados(algun campo no llave)
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_POLIZA_CARGO_ABONO_UNIVERSO_DIFF`
AS
-- Universo de Registros NUEVOS o que se Modificados
WITH TMP_LANDING AS 
(
SELECT 
 FECHA_PROCESO
,FUENTE
,NUMERO_POLIZA_INT
,NOMBRE_PRODUCTO
,NOMBRE_GRUPO_PRODUCTO
,ID_PRODUCTO
,NUMERO_POLIZA
,ID_CARGO
,NUMERO_CARGO
,ID_ABONO
,NUMERO_ABONO
,ID_DEVOLUCION
,ID_ABONO_CARGO
,CONCEPTO_CARGO
,CONCEPTO_CARGO_TIPO_INGRESO
,ESTADO_CARGO
,CARGO_FECHA_COBERTURA_INICIO
,CARGO_FECHA_COBERTURA_FIN
,CARGO_PERIODO_COBRANZA
,MONTO_CARGO_CANTIDAD
,MONTO_CARGO_MONEDA
,SALDO_CANTIDAD
,SALDO_MONEDA
,COD_CONCEPTO_ABONO
,FECHA_REGISTRO_CAJA
,FECHA_REGISTRO_CAJA_P
,FECHA_REGISTRO_ABONO
,MONTO_ORIGEN_MONEDA
,MONTO_CANTIDAD
,MONTO_MONEDA
,FECHA_APLICADO_CARGO_ABONO
,VALOR_MONEDA_ORIGEN
,MONTO_ORIGEN_CANTIDAD
,VALOR_SALDO_ORIGEN
,ESTADO_ABONO
,TIPO_ABONO
,TIPO_CAMBIO_PERIODO_ABONO
,TIPO_CAMBIO_PERIODO_CARGO
,TIPO_CAMBIO_DIA_ABONO
,TIPO_CAMBIO_DIA_CARGO
,MONTO_CARGO_CANTIDAD_PEN
,MONTO_CARGO_CANTIDAD_USD
,SALDO_CANTIDAD_PEN
,SALDO_CANTIDAD_USD
,MONTO_CANTIDAD_ABONO_PEN
,MONTO_CANTIDAD_ABONO_USD
,FRECUENCIA_PAGO
,NUMERO_VIA_PAGO
,DESCRIPCION_VIA_PAGO
,ORIGEN_RECAUDACION
,DESCRIPCION
,NUM_VIA_PAGO_COBRO
,VIA_COBRO
,FLAG_CARGO_DEVOLUCION
,UPPER(TO_HEX(SHA256(CONCAT( --COALESCE(NUMERO_POLIZA_INT,0)
 COALESCE(NOMBRE_PRODUCTO,'')
,COALESCE(NOMBRE_GRUPO_PRODUCTO,'')
,COALESCE(ID_PRODUCTO,'')
,COALESCE(NUMERO_POLIZA,'')
,COALESCE(ID_CARGO,0)
--,COALESCE(NUMERO_CARGO,0)
,COALESCE(ID_ABONO,'')
--,COALESCE(NUMERO_ABONO,0)
--,COALESCE(ID_DEVOLUCION,0)
,COALESCE(ID_ABONO_CARGO,0)
,COALESCE(CONCEPTO_CARGO,0)
,COALESCE(CONCEPTO_CARGO_TIPO_INGRESO,'')
,COALESCE(ESTADO_CARGO,'')
,COALESCE(CARGO_FECHA_COBERTURA_INICIO,'1990-01-01')
,COALESCE(CARGO_FECHA_COBERTURA_FIN,'1990-01-01')
,COALESCE(CARGO_PERIODO_COBRANZA,'1990-01-01')
,COALESCE(MONTO_CARGO_CANTIDAD,0)
,COALESCE(MONTO_CARGO_MONEDA,'')
,COALESCE(SALDO_CANTIDAD,0)
,COALESCE(SALDO_MONEDA,'')
,COALESCE(COD_CONCEPTO_ABONO,'')
,COALESCE(FECHA_REGISTRO_CAJA,'1990-01-01')
,COALESCE(FECHA_REGISTRO_CAJA_P,'1990-01-01')
,COALESCE(FECHA_REGISTRO_ABONO,'1990-01-01')
,COALESCE(MONTO_ORIGEN_MONEDA,'')
,COALESCE(MONTO_CANTIDAD,0)
,COALESCE(MONTO_MONEDA,'')
,COALESCE(FECHA_APLICADO_CARGO_ABONO,'1990-01-01')
,COALESCE(VALOR_MONEDA_ORIGEN,0)
,COALESCE(MONTO_ORIGEN_CANTIDAD,0)
,COALESCE(VALOR_SALDO_ORIGEN,0)
,COALESCE(ESTADO_ABONO,'')
,COALESCE(TIPO_ABONO,'')
,COALESCE(TIPO_CAMBIO_PERIODO_ABONO,0)
,COALESCE(TIPO_CAMBIO_PERIODO_CARGO,0)
,COALESCE(TIPO_CAMBIO_DIA_ABONO,0)
,COALESCE(TIPO_CAMBIO_DIA_CARGO,0)
,COALESCE(MONTO_CARGO_CANTIDAD_PEN,0)
,COALESCE(MONTO_CARGO_CANTIDAD_USD,0)
,COALESCE(SALDO_CANTIDAD_PEN,0)
,COALESCE(SALDO_CANTIDAD_USD,0)
,COALESCE(MONTO_CANTIDAD_ABONO_PEN,0)
,COALESCE(MONTO_CANTIDAD_ABONO_USD,0)
,COALESCE(FRECUENCIA_PAGO,'')
,COALESCE(NUMERO_VIA_PAGO,0)
,COALESCE(DESCRIPCION_VIA_PAGO,'')
,COALESCE(ORIGEN_RECAUDACION,0)
,COALESCE(DESCRIPCION,'')
,COALESCE(NUM_VIA_PAGO_COBRO,'')
,COALESCE(VIA_COBRO,'')
,COALESCE(FLAG_CARGO_DEVOLUCION,TRUE))))) AS HASH_DIFF
FROM `iter-data-storage-pv-uat.temp.TMP_POLIZA_CARGO_ABONO_UNIVERSO`
QUALIFY(ROW_NUMBER()OVER(PARTITION BY NUMERO_POLIZA_INT,NUMERO_CARGO,NUMERO_ABONO,ID_DEVOLUCION))=1
)
SELECT LAN.*
      ,COALESCE(DIFF.FECHA_CREACION_REGISTRO,CURRENT_DATE('America/Lima')) AS FECHA_CREACION_REGISTRO
      ,CURRENT_DATE('America/Lima')   AS FECHA_MODIFICACION_REGISTRO
     FROM TMP_LANDING LAN
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_CARGO_ABONO` /*TMP_DIFF*/ DIFF -- Universo de Registros EXISTENTES en la tabla DESTINO
        ON LAN.NUMERO_POLIZA_INT   = DIFF.NUMERO_POLIZA_INT
       AND LAN.NUMERO_CARGO   = DIFF.NUMERO_CARGO
       AND LAN.NUMERO_ABONO   = DIFF.NUMERO_ABONO
       AND LAN.ID_DEVOLUCION  = DIFF.ID_DEVOLUCION
     WHERE LAN.HASH_DIFF     <> DIFF.HASH_DIFF -- Registros Modificados
        OR DIFF.HASH_DIFF IS NULL  -- Registros Nuevos
;

-- -----------------------------------------------------------------------------------
-- Paso 4: Diferencial 
-- -----------------------------------------------------------------------------------
--TRUNCATE TABLE `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_CARGO_ABONO`;

 DELETE FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_CARGO_ABONO` CAR
 WHERE EXISTS (
 SELECT 1
   FROM `iter-data-storage-pv-uat.temp.TMP_POLIZA_CARGO_ABONO_UNIVERSO_DIFF` LAN
   WHERE LAN.NUMERO_POLIZA_INT = CAR.NUMERO_POLIZA_INT
     AND LAN.NUMERO_CARGO      = CAR.NUMERO_CARGO
     AND LAN.NUMERO_ABONO      = CAR.NUMERO_ABONO
     AND LAN.ID_DEVOLUCION     = CAR.ID_DEVOLUCION
 )
 ;

-- -----------------------------------------------------------------------------------
-- Paso 5: Insertar en la tabla final
-- -----------------------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_CARGO_ABONO`
(
 FECHA_PROCESO
,FUENTE
,NUMERO_POLIZA_INT
,NOMBRE_PRODUCTO
,NOMBRE_GRUPO_PRODUCTO
,ID_PRODUCTO
,NUMERO_POLIZA
,ID_CARGO
,NUMERO_CARGO
,ID_ABONO
,NUMERO_ABONO
,ID_DEVOLUCION
,ID_ABONO_CARGO
,CONCEPTO_CARGO
,CONCEPTO_CARGO_TIPO_INGRESO
,ESTADO_CARGO
,CARGO_FECHA_COBERTURA_INICIO
,CARGO_FECHA_COBERTURA_FIN
,CARGO_PERIODO_COBRANZA
,MONTO_CARGO_CANTIDAD
,MONTO_CARGO_MONEDA
,SALDO_CANTIDAD
,SALDO_MONEDA
,COD_CONCEPTO_ABONO
,FECHA_REGISTRO_CAJA
,FECHA_REGISTRO_CAJA_P
,FECHA_REGISTRO_ABONO
,MONTO_ORIGEN_MONEDA
,MONTO_CANTIDAD
,MONTO_MONEDA
,FECHA_APLICADO_CARGO_ABONO
,VALOR_MONEDA_ORIGEN
,MONTO_ORIGEN_CANTIDAD
,VALOR_SALDO_ORIGEN
,ESTADO_ABONO
,TIPO_ABONO
,TIPO_CAMBIO_PERIODO_ABONO
,TIPO_CAMBIO_PERIODO_CARGO
,TIPO_CAMBIO_DIA_ABONO
,TIPO_CAMBIO_DIA_CARGO
,MONTO_CARGO_CANTIDAD_PEN
,MONTO_CARGO_CANTIDAD_USD
,SALDO_CANTIDAD_PEN
,SALDO_CANTIDAD_USD
,MONTO_CANTIDAD_ABONO_PEN
,MONTO_CANTIDAD_ABONO_USD
,FRECUENCIA_PAGO
,NUMERO_VIA_PAGO
,DESCRIPCION_VIA_PAGO
,ORIGEN_RECAUDACION
,DESCRIPCION
,NUM_VIA_PAGO_COBRO
,VIA_COBRO
,FLAG_CARGO_DEVOLUCION
,HASH_DIFF
,FECHA_CREACION_REGISTRO
,FECHA_MODIFICACION_REGISTRO
)
SELECT 
 FECHA_PROCESO
,FUENTE
,NUMERO_POLIZA_INT
,NOMBRE_PRODUCTO
,NOMBRE_GRUPO_PRODUCTO
,ID_PRODUCTO
,NUMERO_POLIZA
,ID_CARGO
,NUMERO_CARGO
,ID_ABONO
,NUMERO_ABONO
,ID_DEVOLUCION
,ID_ABONO_CARGO
,CONCEPTO_CARGO
,CONCEPTO_CARGO_TIPO_INGRESO
,ESTADO_CARGO
,CARGO_FECHA_COBERTURA_INICIO
,CARGO_FECHA_COBERTURA_FIN
,CARGO_PERIODO_COBRANZA
,MONTO_CARGO_CANTIDAD
,MONTO_CARGO_MONEDA
,SALDO_CANTIDAD
,SALDO_MONEDA
,COD_CONCEPTO_ABONO
,FECHA_REGISTRO_CAJA
,FECHA_REGISTRO_CAJA_P
,FECHA_REGISTRO_ABONO
,MONTO_ORIGEN_MONEDA
,MONTO_CANTIDAD
,MONTO_MONEDA
,FECHA_APLICADO_CARGO_ABONO
,VALOR_MONEDA_ORIGEN
,MONTO_ORIGEN_CANTIDAD
,VALOR_SALDO_ORIGEN
,ESTADO_ABONO
,TIPO_ABONO
,TIPO_CAMBIO_PERIODO_ABONO
,TIPO_CAMBIO_PERIODO_CARGO
,TIPO_CAMBIO_DIA_ABONO
,TIPO_CAMBIO_DIA_CARGO
,MONTO_CARGO_CANTIDAD_PEN
,MONTO_CARGO_CANTIDAD_USD
,SALDO_CANTIDAD_PEN
,SALDO_CANTIDAD_USD
,MONTO_CANTIDAD_ABONO_PEN
,MONTO_CANTIDAD_ABONO_USD
,FRECUENCIA_PAGO
,NUMERO_VIA_PAGO
,DESCRIPCION_VIA_PAGO
,ORIGEN_RECAUDACION
,DESCRIPCION
,NUM_VIA_PAGO_COBRO
,VIA_COBRO
,FLAG_CARGO_DEVOLUCION
,HASH_DIFF
,FECHA_CREACION_REGISTRO
,FECHA_MODIFICACION_REGISTRO
  FROM `iter-data-storage-pv-uat.temp.TMP_POLIZA_CARGO_ABONO_UNIVERSO_DIFF` 
   --FROM  `iter-data-storage-pv-uat.temp.TMP_POLIZA_CARGO_ABONO_UNIVERSO` 
;

-- -----------------------------------------------------------------------------------
-- Paso 4: Eliminar los que dejaron de venir 
-- -----------------------------------------------------------------------------------
 DELETE FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_CARGO_ABONO` CAR
 WHERE NOT EXISTS (
 SELECT 1
   FROM `iter-data-storage-pv-uat.temp.TMP_POLIZA_CARGO_ABONO_UNIVERSO` LAN
   WHERE LAN.NUMERO_POLIZA_INT = CAR.NUMERO_POLIZA_INT
     AND LAN.NUMERO_CARGO      = CAR.NUMERO_CARGO
     AND LAN.NUMERO_ABONO      = CAR.NUMERO_ABONO
     AND LAN.ID_DEVOLUCION     = CAR.ID_DEVOLUCION
 )
 ;

-- -----------------------------------------------------------------------------------
-- Paso 5: Eliminar devoluciones con error
-- -----------------------------------------------------------------------------------


DELETE FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_CARGO_ABONO` A
WHERE ID_CARGO IN (SELECT ID_CARGO FROM `iter-data-storage-pv-uat.samp_data.DEVOLUCION_ERROR`);


DELETE FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_CARGO_ABONO` A
WHERE NUMERO_ABONO IN (SELECT CAST(NUMERO_ABONO AS NUMERIC) NUMERO_ABONO FROM `iter-data-storage-pv-uat.inputfiles.ODS_ABONO_ERROR`);

-- =========================================================================================================
-- Paso 1: Eliminar tablas temporales
-- =========================================================================================================
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_COBR_PLANILLA_VIA_CA`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_COBR_PLANILLA_ABONO_CA`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_COBR_VIAS_PAGO`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_COBR_VIA_COBRO_DF` ;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_POLIZA_CARGO_ABONO_UNIVERSO_DIFF` ;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_POLIZA_CARGO_ABONO_UNIVERSO` ;

END;