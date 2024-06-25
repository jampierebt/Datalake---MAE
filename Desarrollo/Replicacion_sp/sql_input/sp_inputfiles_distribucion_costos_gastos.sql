CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_inputfiles_distribucion_costos_gastos()
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

CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.inputfiles.DISTRIBUCION_COSTOS_GASTOS_landing`
(
PERIODO            STRING
,IFRS_GRP_UNIQUE_ID	   STRING
,MONEDA	           STRING
,CATEGORIA	       STRING
,DISTRIBUCION      STRING
,ANIADA            STRING
)OPTIONS(
    format=CSV,
    URIS=["gs://uat-interseguro-normativo-ifrs17-actuals/DISTRIBUCION_COSTOS_GASTOS/*.csv"],
    field_delimiter=';',
    skip_leading_rows=1,
    max_bad_records = 1
);
-- ----------------------------------------------------------------------
-- Paso A10:
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.inputfiles.TMP_DISTRIBUCION_COSTOS_GASTOS`
AS
SELECT 
PERIODO
,IFRS_GRP_UNIQUE_ID
,MONEDA
,UPPER(CATEGORIA) AS CATEGORIA
,UPPER(DISTRIBUCION) AS DISTRIBUCION
,ANIADA
FROM `iter-data-storage-pv-uat.inputfiles.DISTRIBUCION_COSTOS_GASTOS_landing`
WHERE IFRS_GRP_UNIQUE_ID IS NOT NULL
;
-- ----------------------------------------------------------------------
-- Insert
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.inputfiles.DISTRIBUCION_COSTOS_GASTOS`
(
PERIODO
,IFRS_GRP_UNIQUE_ID
,MONEDA
,CATEGORIA
,DISTRIBUCION
,ANIADA
,FECHA_PROCESO
)
SELECT 
PERIODO
,IFRS_GRP_UNIQUE_ID
,MONEDA
,CATEGORIA
,DISTRIBUCION
,ANIADA
,CURRENT_DATETIME('America/Lima') AS FECHA_PROCESO
FROM `iter-data-storage-pv-uat.inputfiles.TMP_DISTRIBUCION_COSTOS_GASTOS` A 
WHERE NOT EXISTS ( SELECT PERIODO FROM `iter-data-storage-pv-uat.inputfiles.DISTRIBUCION_COSTOS_GASTOS` B
                   WHERE A.PERIODO = B.PERIODO);


-- ----------------------------------------------------------------------
-- Paso A10: Eliminar la Temporal
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.DISTRIBUCION_COSTOS_GASTOS_landing`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TMP_DISTRIBUCION_COSTOS_GASTOS`;

END;