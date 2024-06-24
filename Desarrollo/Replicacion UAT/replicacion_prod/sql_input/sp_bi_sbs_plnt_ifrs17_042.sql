CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_bi_sbs_plnt_ifrs17_042(par_periodo INT64)
OPTIONS(
  strict_mode=true)
BEGIN
 /********************************************************************
* Proyecto      : IFRS17 - 042 
* Fecha         : 31 / 03 / 2024
* Autor         : Jampiere Berrio         
* Descripción   : Procesar la 042 
* Ejecuciòn     : Reprocesable
*********************************************************************
*                       MODIFICACIONES POSTERIORES                  *
*===================================================================*
*=  Fecha   | Persona |           Modificación Realizada           =*
*===================================================================*/

DECLARE var_periodo INT64;

IF par_periodo IS NULL THEN 

SET var_periodo = (( SELECT MAX(CAST(PERIODO AS INT64)) FROM `iter-data-storage-pv-uat.goldenrecord_data.DIM_PERIODO_CALENDARIO`
                     WHERE DATE_SUB(CURRENT_DATE,INTERVAL 8 DAY) BETWEEN PERIODO_DIA_INICIO  AND PERIODO_DIA_FIN ));

ELSE 

SET var_periodo = par_periodo;

END IF
;
--------------------------------------------------------------------
-- Distribucion de la prima de coaseguro en los siniestros MC
--------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_SINIESTROS_AGRUPADOS_042`
AS
SELECT
PERIODO
,NOMBRE_REPORTE
,TIPO_PAGO
,NUMERO_SINIESTRO
,CASE WHEN MONEDA= 'US DOLAR' THEN 'USD'
      WHEN MONEDA= 'NUEVO SOL' THEN 'PEN'
	  ELSE MONEDA END AS MONEDA
,MONTO
,NOMBRE_PRODUCTO
,NOMBRE_ASEGURADO
,GLS_COBERTURA
,NUMERO_CERTIFICADO
,FECHA_OCURRENCIA_SINIESTRO
,ANIO
,NUMERO_POLIZA
,FECHA_INICIO_VIGENCIA
,FECHA_REPORTE_CIA
FROM (
		SELECT
		PERIODO
		,'SINIESTRO_DESGRAVAMEN' AS NOMBRE_REPORTE
		,TIPO_PAGO
		,NUMERO_SINIESTRO
		,MONEDA
		,MONTO
		,NOMBRE_PRODUCTO
		,NOMBRE_ASEGURADO
		,GLS_COBERTURA
		,NUMERO_CERTIFICADO
		,FECHA_OCURRENCIA_SINIESTRO
		,ANIO
		,NUMERO_POLIZA
		,FECHA_INICIO_VIGENCIA
		,FECHA_REPORTE_CIA
		,CECO
		,SCOR
		,MUNICH
		,GEN_RE
		,HANNOVER
		,NAVIGATORS
		,RGA
		,MONTO_TIPO_CAMBIO
		,FECHA_PROCESO
		,NULL AS NOMBRE_BENEFICIARIO
		,NULL AS CANAL
		,NULL AS AGENCIA
		,NULL AS CLASE
		,NULL AS TIPO
		,NULL AS NOMBRE_PROVEEDOR
		FROM `iter-data-storage-pv-uat.inputfiles.SINIESTRO_DESGRAVAMEN`
		UNION ALL
		SELECT
		PERIODO
		,'SINIESTRO_VIDA' AS NOMBRE_REPORTE
		,NULL AS TIPO_PAGO
		,NUMERO_SINIESTRO
		,MONEDA
		,MONTO
		,NOMBRE_PRODUCTO
		,NOMBRE_ASEGURADO
		,GLS_COBERTURA
		,NULL AS NUMERO_CERTIFICADO
		,FECHA_OCURRENCIA_SINIESTRO
		,ANIO
		,NUMERO_POLIZA
		,FECHA_INICIO_VIGENCIA
		,FECHA_REPORTE_CIA
		,CECO
		,NULL AS SCOR
		,NULL AS MUNICH
		,NULL AS GEN_RE
		,NULL AS HANNOVER
		,NULL AS NAVIGATORS
		,NULL AS RGA
		,NULL AS MONTO_TIPO_CAMBIO
		,FECHA_PROCESO
		,NULL AS NOMBRE_BENEFICIARIO
		,NULL AS CANAL
		,NULL AS AGENCIA
		,NULL AS CLASE
		,NULL AS TIPO
		,NULL AS NOMBRE_PROVEEDOR
		FROM `iter-data-storage-pv-uat.inputfiles.SINIESTRO_VIDA`
)
WHERE PERIODO=CAST(var_periodo AS STRING)
;
--------------------------------------------------------------------
-- Calculo de los campos insurance e investment
--------------------------------------------------------------------
/*SOLICITAR QUE SE ME SUME EL ID_PRODUCTO PARA PODER HACER LOS CRUCES*/

CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.PLNT_IFRS17_042`
AS
WITH TMP_LIBRO_PRODUCTO AS (
SELECT DISTINCT 
NOMBRE_PRODUCTO
,ID_PRODUCTO
FROM (SELECT 
         PCH.NUMERO_POLIZA
        ,PCH.NUMERO_POLIZA_HOMOLOGADO
        ,PCH.MONEDA
        ,PCH.NOMBRE_PRODUCTO
        ,CNF.ID_PRODUCTO
        --FECHA_VIGENCIA_INICIO
        --FECHA_VIGENCIA_FIN
        ,PCH.FECHA_RECAUDACION AS FECHA_EMISION
        ,PCH.TOTAL AS PRIMA
        ,PCH.FECHA_INGRESO_COMPROBANTE AS FECHA_ABONO
        FROM `iter-data-storage-pv-uat.bi_sbs.POLIZA_COMPROBANTE_HIST` PCH
        INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO` CNF
                ON UPPER(TRIM(PCH.NOMBRE_PRODUCTO)) = CNF.NOMBRE_PRODUCTO --> COLUMNA ADICIONAL ID_PRODUCTO PARA IDENTIFICAR MEJOR
               AND CNF.INDICADOR_INVESTMENT_COMPONENT <> 'NO IDENTIFICADO' 
        WHERE PERIODO=var_periodo --> variable
     )
)
SELECT
AGS.PERIODO
,CNF.LINEA_NEGOCIO
,CNF.NOMBRE_PRODUCTO
,CNF.ID_PRODUCTO
,CNF.INDICADOR_INVESTMENT_COMPONENT
,AGS.NOMBRE_REPORTE
--1,AGS.TIPO_PAGO
,POL.PLAN
--,PL.NOMBREPLAN
,PL.GRUPO
,COALESCE(PLC.PORCENTAJE,0) AS PORCENTAJE_PLC
,COALESCE(ACR.PORCENTAJE,0) AS PORCENTAJE_ARC
,COALESCE(TVG.RESCATE,0) AS VALOR_RESCATE
,(CASE
        WHEN UPPER(CNF.INDICADOR_INVESTMENT_COMPONENT)='SI' THEN --Si Tiene Invest
             (CASE WHEN FORMAT_DATE('%Y%m',AGS.FECHA_OCURRENCIA_SINIESTRO) = FORMAT_DATE('%Y%m',AGS.FECHA_INICIO_VIGENCIA)  THEN --Tiene Flujo Rescate y Flujo vencimiento --> CAMBIAR FIN_VIG
                   COALESCE(AGS.MONTO,0)
              ELSE
                          -- A. Rescate a la fecha de fallecimiento
                          (CASE
                             WHEN CNF.ID_PRODUCTO <> '778219' AND CNF.ID_PRODUCTO <> '77830' AND CNF.ID_PRODUCTO <> '77831' THEN
                                  -- Valore rescate de la TVG
                                  COALESCE(TVG.RESCATE,0)
                             ELSE
                                  (CASE WHEN CNF.ID_PRODUCTO = '778219' OR CNF.ID_PRODUCTO = '77830' THEN --Si los productos son Vida Flex : 65 y 80
                                               --Rescate Total Rtot = CP - CRt + CAVt;       CRt = 100 - (% VA) * CP
                                                   --COALESCE(ST.CP_CUENTA,0) - (((100 - NVL(PLC.PORCENTAJE,0))/100) * NVL(ST.CP_CUENTA,0)) + NVL(ST.CAV_CUENTA,0)
                                                   0 - (((100 - COALESCE(PLC.PORCENTAJE,0))/100) * 0 ) + 0
                                        WHEN CNF.ID_PRODUCTO = '77831' THEN --Si los productos son VIDA INVERSI�N
                                                --Rescate Total Rtot = CP - CRt + CAVt; CR = 100 (% VA) * CP
                                                   --COALESCE(ST.CP_CUENTA,0) - (((100 - COALESCE(ACR.PORCENTAJE,0))/100) * COALESCE(ST.CP_CUENTA,0)) + COALESCE(ST.CAV_CUENTA,0)
                                                   0 - (((100 - COALESCE(ACR.PORCENTAJE,0))/100) * 0) + 0
                                  END)
                           END)
               END)
  ELSE 0  END)  INVESMENT
,(CASE WHEN UPPER(CNF.INDICADOR_INVESTMENT_COMPONENT)='NO' --No Tiene Invest
            THEN COALESCE(AGS.MONTO,0)
       ELSE  COALESCE(AGS.MONTO,0) - (CASE
                                             WHEN CNF.ID_PRODUCTO <> '778219' AND CNF.ID_PRODUCTO <> '77830' AND CNF.ID_PRODUCTO <> '77831' THEN
                                                  -- Valore rescate de la TVG
                                                  COALESCE(TVG.RESCATE,0)
                                             ELSE
                                                  (CASE WHEN CNF.ID_PRODUCTO = '778219' OR CNF.ID_PRODUCTO = '77830' THEN --Si los productos son Vida Flex : 65 y 80
                                                               --Rescate Total Rtot = CP - CRt + CAVt;       CRt = 100 - (% VA) * CP
                                                                 --COALESCE(ST.CP_CUENTA,0) - (((100 - COALESCE(PLC.PORCENTAJE,0))/100) * COALESCE(ST.CP_CUENTA,0)) + COALESCE(ST.CAV_CUENTA,0)
                                                                   0 - (((100 - COALESCE(PLC.PORCENTAJE,0))/100) * 0) + 0
                                                        WHEN CNF.ID_PRODUCTO = '77831' THEN --Si los productos son VIDA INVERSI�N
                                                                --Rescate Total Rtot = CP - CRt + CAVt; CR = 100 (% VA) * CP
                                                                 --COALESCE(ST.CP_CUENTA,0) - (((100 - COALESCE(ACR.PORCENTAJE,0))/100) * COALESCE(ST.CP_CUENTA,0)) + COALESCE(ST.CAV_CUENTA,0)
                                                                   0 - (((100 - COALESCE(ACR.PORCENTAJE,0))/100) * 0) + 0
                                                  END)
                                        END)
       END) INSURANCE
,AGS.NUMERO_SINIESTRO
,AGS.MONEDA
,AGS.MONTO
--,AGS.NOMBRE_PRODUCTO
,AGS.NOMBRE_ASEGURADO
,AGS.GLS_COBERTURA
,AGS.NUMERO_CERTIFICADO
,AGS.FECHA_OCURRENCIA_SINIESTRO
,AGS.ANIO
,AGS.NUMERO_POLIZA
,AGS.FECHA_INICIO_VIGENCIA
,AGS.FECHA_REPORTE_CIA
--SELECT * 
FROM  `iter-data-storage-pv-uat.temp.TMP_SINIESTROS_AGRUPADOS_042` AGS
INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO` CNF
        ON UPPER(TRIM(AGS.NOMBRE_PRODUCTO)) = CNF.NOMBRE_PRODUCTO --> COLUMNA ADICIONAL ID_PRODUCTO PARA IDENTIFICAR MEJOR
       AND CNF.INDICADOR_INVESTMENT_COMPONENT <> 'NO IDENTIFICADO'  
INNER JOIN TMP_LIBRO_PRODUCTO LP
        ON LP.ID_PRODUCTO = CNF.ID_PRODUCTO
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.POLIZA` POL
       ON AGS.NUMERO_POLIZA= POL.NUMERO_POLIZA
      AND POL.NOMBRE_GRUPO_PRODUCTO='VIDA' --> VALIDAR ESTO
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_TVG` TVG
       ON POL.NUMERO_POLIZA = TVG.NUMERO_POLIZA
      AND TVG.ANIO  = TRUNC(DATE_DIFF(AGS.FECHA_OCURRENCIA_SINIESTRO , AGS.FECHA_INICIO_VIGENCIA,MONTH)/12,0)
LEFT JOIN `iter-data-storage-pv-uat.config_data.CNF_PLAN_IFRS17` PL
       ON TRIM(PL.NOMBRE_PLAN) = TRIM(POL.PLAN)
-- LEFT JOIN (SELECT 
--            NUMERO_POLIZA
--            ,DESCRIPCION_EVENTO
--            ,MAX(NUMERO_OPERACION) AS NUMERO_OPERACION
--            FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION`
--            --WHERE NUMERO_POLIZA='11903'
--            WHERE DESCRIPCION_EVENTO = 'GENERARPRIMA'
--            AND ESTADO_OPERACION='Applied operation'
--            GROUP BY NUMERO_POLIZA, DESCRIPCION_EVENTO
--            ) PO ON PO.NUMERO_POLIZA = POL.NUMERO_POLIZA
-- LEFT JOIN `iter-data-storage-pv-uat.acsele_data.STPO_GUARANTEEDVALUESTABLE_raw`  B
--      ON B.COR_ID = PO.NUMERO_OPERACION
-- LEFT JOIN `iter-data-storage-pv-uat.acsele_data.STPO_GUARANTEEDVALUESDETAIL_raw`  CA
--      ON B.GVT_ID = CA.GVT_ID
LEFT JOIN `iter-data-storage-pv-uat.config_data.CNF_PLANES_CARGOS_IFRS17` PLC
       ON PLC.GRUPO = PL.GRUPO
      AND PLC.ANIO = (CASE WHEN TRUNC(DATE_DIFF(AGS.FECHA_OCURRENCIA_SINIESTRO , AGS.FECHA_INICIO_VIGENCIA,MONTH)/12,0) > 20 THEN 20 
                           ELSE TRUNC(DATE_DIFF(AGS.FECHA_OCURRENCIA_SINIESTRO , AGS.FECHA_INICIO_VIGENCIA,MONTH)/12,0) END)
LEFT JOIN `iter-data-storage-pv-uat.config_data.CNF_CARGOS_RESCATE_IFRS17` ACR
       ON ACR.ANIO = (CASE WHEN TRUNC(DATE_DIFF(AGS.FECHA_OCURRENCIA_SINIESTRO , AGS.FECHA_INICIO_VIGENCIA,MONTH)/12,0) > 10 THEN 10 
                           ELSE TRUNC(DATE_DIFF(AGS.FECHA_OCURRENCIA_SINIESTRO , AGS.FECHA_INICIO_VIGENCIA,MONTH)/12,0) END)
WHERE AGS.NOMBRE_PRODUCTO NOT IN('VIDALEYTTL','SEGURO INDIVIDUAL CORPORATIVO SOLES','VDLCESANTESURA','NUEVO SEGURO PLAN BASICO') --> REVISAR CON ALESSANDRA
ORDER BY NOMBRE_REPORTE DESC
;

--------------------------------------------------------------------
-- Delete
--------------------------------------------------------------------

DELETE FROM `iter-data-storage-pv-uat.bi_sbs.PLNT_IFRS17_042`
WHERE PERIODO = var_periodo;

--------------------------------------------------------------------
-- Insert
--------------------------------------------------------------------

INSERT INTO `iter-data-storage-pv-uat.bi_sbs.PLNT_IFRS17_042`
(
PERIODO
,LINEA_NEGOCIO
,NOMBRE_PRODUCTO
,ID_PRODUCTO
,INDICADOR_INVESTMENT_COMPONENT
,NOMBRE_REPORTE
,PLAN
,GRUPO
,PORCENTAJE_PLC
,PORCENTAJE_ARC
,VALOR_RESCATE
,INVESMENT
,INSURANCE
,NUMERO_SINIESTRO
,MONEDA
,MONTO
,NOMBRE_ASEGURADO
,GLS_COBERTURA
,NUMERO_CERTIFICADO
,FECHA_OCURRENCIA_SINIESTRO
,ANIO
,NUMERO_POLIZA
,FECHA_INICIO_VIGENCIA
,FECHA_REPORTE_CIA  
)
SELECT 
CAST(PERIODO AS INT64) AS PERIODO
,LINEA_NEGOCIO
,NOMBRE_PRODUCTO
,ID_PRODUCTO
,INDICADOR_INVESTMENT_COMPONENT
,NOMBRE_REPORTE
,PLAN
,GRUPO
,PORCENTAJE_PLC
,PORCENTAJE_ARC
,VALOR_RESCATE
,INVESMENT
,INSURANCE
,NUMERO_SINIESTRO
,MONEDA
,MONTO
,NOMBRE_ASEGURADO
,GLS_COBERTURA
,NUMERO_CERTIFICADO
,FECHA_OCURRENCIA_SINIESTRO
,ANIO
,NUMERO_POLIZA
,FECHA_INICIO_VIGENCIA
,FECHA_REPORTE_CIA
FROM `iter-data-storage-pv-uat.temp.PLNT_IFRS17_042`
;
--------------------------------------------------------------------
-- Drop 
--------------------------------------------------------------------
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_SINIESTROS_AGRUPADOS_042`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.PLNT_IFRS17_042`;

END;