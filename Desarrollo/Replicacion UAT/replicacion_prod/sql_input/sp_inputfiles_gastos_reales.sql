CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_inputfiles_gastos_reales()
OPTIONS(
  strict_mode=true)
BEGIN

 /********************************************************************
* Proyecto      : IFRS17 - ACTUALS
* Fecha         : 23 / 11 / 2023
* Autor         : Jampiere Berrio         
* Descripción   :    
* Ejecuciòn     :  
*********************************************************************
*                       MODIFICACIONES POSTERIORES                  *
*===================================================================*
*=  Fecha   | Persona |           Modificación Realizada           =*
*===================================================================*/

-- ----------------------------------------------------------------------
-- Paso A10: Temporal con Universo
-- ----------------------------------------------------------------------

CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.inputfiles.GASTOS_REALES_landing`
(
PERIODO	                   STRING
,CATEGORIA	               STRING
,COSTOS_ADQUISICION	       STRING
,GASTOS_MANTENIMIENTO      STRING
)OPTIONS(
    format=CSV,
    URIS=["gs://uat-interseguro-normativo-ifrs17-actuals/GASTOS_REALES/*.csv"],
    field_delimiter=';',
    skip_leading_rows=1,
    max_bad_records = 1
);
-- ----------------------------------------------------------------------
-- Paso A10:
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.inputfiles.TMP_GASTOS_REALES`
AS
SELECT 
CAST(PERIODO AS INT64) AS PERIODO
,UPPER(CATEGORIA) AS CATEGORIA
,SAFE_CAST(REPLACE(COSTOS_ADQUISICION,',','') AS NUMERIC) AS COSTOS_ADQUISICION
,SAFE_CAST(REPLACE(GASTOS_MANTENIMIENTO,',','') AS NUMERIC) AS GASTOS_MANTENIMIENTO
FROM `iter-data-storage-pv-uat.inputfiles.GASTOS_REALES_landing`
WHERE PERIODO IS NOT NULL
;
-- ----------------------------------------------------------------------
-- Insert
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.inputfiles.GASTOS_REALES`
(
PERIODO
,CATEGORIA
,COSTOS_ADQUISICION
,GASTOS_MANTENIMIENTO
)
SELECT 
PERIODO
,CATEGORIA
,COSTOS_ADQUISICION
,GASTOS_MANTENIMIENTO
FROM `iter-data-storage-pv-uat.inputfiles.TMP_GASTOS_REALES` A 
WHERE NOT EXISTS ( SELECT PERIODO FROM `iter-data-storage-pv-uat.inputfiles.GASTOS_REALES` B
                   WHERE A.PERIODO = B.PERIODO);


-- ----------------------------------------------------------------------
-- Paso A10: Eliminar la Temporal
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.GASTOS_REALES_landing`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TMP_GASTOS_REALES`;

END;