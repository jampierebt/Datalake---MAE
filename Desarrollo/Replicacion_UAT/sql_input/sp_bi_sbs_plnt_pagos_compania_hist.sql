CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_bi_sbs_plnt_pagos_compania_hist(par_periodo INT64)
OPTIONS(
  strict_mode=true)
BEGIN

 /********************************************************************
* Proyecto      : IFRS17
* Fecha         : 15 / 11 / 2023
* Autor         : Jampiere Berrio         
* Descripción   : 
* Ejecuciòn     : Mensual - 7 de cada mes
*********************************************************************
*                       MODIFICACIONES POSTERIORES                  *
*===================================================================*
*=  Fecha   | Persona |           Modificación Realizada           =*
*===================================================================*/
 
-- ------------------------------------------------------------------------------------
-- VARIABLES UTILIZADAS EN EL PROCESO
-- ------------------------------------------------------------------------------------

DECLARE var_periodo_calendario INT64;

IF par_periodo IS NULL THEN
 
SET var_periodo_calendario = ( SELECT   MAX(CAST(PERIODO AS INT64))  FROM `iter-data-storage-pv-uat.goldenrecord_data.DIM_PERIODO_CALENDARIO`
WHERE DATE_SUB(CURRENT_DATE,INTERVAL 8 DAY) BETWEEN PERIODO_DIA_INICIO  AND PERIODO_DIA_FIN ) ;
                        
ELSE 
 
SET var_periodo_calendario = par_periodo ;

END IF;

-- ----------------------------------------------------------------------
-- Paso 1: Tomamos la informacion del planeta de movimientos contables 
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_PLNT_PAGOS_COMPANIA_SAC_VIDA`  
AS
SELECT 
AREA
,ID
,SOLICITUD_ID
,ID_PERSONA
,TIPO_DOCUMENTO
,NUMERO_DOCUMENTO
,NOMBRE
,NOMBRE_BENEFICIARIO
,MONTO
,NUMERO_INCIDENTE
,NUMERO_POLIZA
,NUMERO_SINIESTRO
,FECHA_CREACION
,ASUNTO
,BANCO
,TIPO_PAGO
,SUBTIPO_PAGO
,FECHA_PAGO
,ESTADO_PAGO
,OBSERVACION
,MONEDA_PAGO
,NRO_FILA
,FECHA_PROCESO
,ASIENTO
FROM `iter-data-storage-pv-uat.goldenrecord_data.PAGOS_COMPANIA`
WHERE CAST(FORMAT_DATE("%Y%m",FECHA_CREACION) AS INT64) = var_periodo_calendario  -- var_periodo_calendario
--WHERE  FECHA_CREACION BETWEEN '2023-09-01' AND '2023-09-30'
--AND FECHA_PAGO <='2023-10-31' --> Este filtro solo es para octubre porque no lo enviaron en ese corte alessandra
AND NUMERO_INCIDENTE <> 0
AND AREA='VIDA'
UNION ALL
SELECT 
AREA
,ID
,SOLICITUD_ID
,ID_PERSONA
,TIPO_DOCUMENTO
,NUMERO_DOCUMENTO
,NOMBRE
,NOMBRE_BENEFICIARIO
,MONTO
,NUMERO_INCIDENTE
,NUMERO_POLIZA
,NUMERO_SINIESTRO
,FECHA_CREACION
,ASUNTO
,BANCO
,TIPO_PAGO
,SUBTIPO_PAGO
,FECHA_PAGO
,ESTADO_PAGO
,OBSERVACION
,MONEDA_PAGO
,NRO_FILA
,FECHA_PROCESO
,ASIENTO
FROM `iter-data-storage-pv-uat.goldenrecord_data.PAGOS_COMPANIA`
WHERE CAST(FORMAT_DATE("%Y%m",FECHA_CREACION) AS INT64) = var_periodo_calendario  -- var_periodo_calendario
AND AREA ='SAC'
AND ASUNTO IN ('RESCATE POLIZA (ACSEL -E)','RETIRO AHORRO VOLUNTARIO')
;
-- ----------------------------------------------------------------------
-- Delete
-- ----------------------------------------------------------------------

DELETE FROM `iter-data-storage-pv-uat.bi_sbs.PLNT_PAGOS_COMPANIA_HIST` 
WHERE PERIODO= var_periodo_calendario;

-- ----------------------------------------------------------------------
-- Paso 4: insert a la tabla historica mensual
-- ----------------------------------------------------------------------

INSERT INTO `iter-data-storage-pv-uat.bi_sbs.PLNT_PAGOS_COMPANIA_HIST` 
(
PERIODO
,AREA
,ID
,SOLICITUD_ID
,ID_PERSONA
,TIPO_DOCUMENTO
,NUMERO_DOCUMENTO
,NOMBRE
,NOMBRE_BENEFICIARIO
,MONTO
,NUMERO_INCIDENTE
,NUMERO_POLIZA
,NUMERO_SINIESTRO
,FECHA_CREACION
,ASUNTO
,BANCO
,TIPO_PAGO
,SUBTIPO_PAGO
,FECHA_PAGO
,ESTADO_PAGO
,OBSERVACION
,MONEDA_PAGO
,NRO_FILA
,ASIENTO
,FECHA_PROCESO
)
SELECT 
var_periodo_calendario AS PERIODO
,AREA
,ID
,SOLICITUD_ID
,ID_PERSONA
,TIPO_DOCUMENTO
,NUMERO_DOCUMENTO
,NOMBRE
,NOMBRE_BENEFICIARIO
,MONTO
,NUMERO_INCIDENTE
,NUMERO_POLIZA
,NUMERO_SINIESTRO
,FECHA_CREACION
,ASUNTO
,BANCO
,TIPO_PAGO
,SUBTIPO_PAGO
,FECHA_PAGO
,ESTADO_PAGO
,OBSERVACION
,MONEDA_PAGO
,NRO_FILA
,ASIENTO
,CURRENT_DATETIME('America/Lima') AS FECHA_PROCESO
FROM `iter-data-storage-pv-uat.temp.TMP_PLNT_PAGOS_COMPANIA_SAC_VIDA` ;

-- ----------------------------------------------------------------------
-- Drop
-- ----------------------------------------------------------------------
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_PLNT_PAGOS_COMPANIA_SAC_VIDA`; 

END;