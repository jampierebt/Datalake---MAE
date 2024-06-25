-----------------------------------------------------------------------------
-- Lectura de sheets
-----------------------------------------------------------------------------
/*
CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv.inputfiles.STORE_PROCEDURE_MIGRACION_landing`
(
ORDEN  STRING
,STORE_PROCEDURE       STRING
,NOMBRE_PROYECTO STRING
,NOMBRE_STORE_PROCEDURE          STRING
,RESPONSABLE          STRING
,ESTADO STRING
,REVISION STRING
)
OPTIONS (
    format=GOOGLE_SHEETS,
    sheet_range='Migrar SP',
    URIS=["https://docs.google.com/spreadsheets/d/11bvxmTaA1ZbQpkKlbX5fnUuCj1XfiqUhNn1vJUbB3-w"], 
    -- NO ES TODO EL LINKSINO SOLO EL CODIGO DEL CENTRO
    skip_leading_rows=1, 
    max_bad_records = 0  
);

-----------------------------------------------------------------------------
-- Lista de Store a Migrar
-----------------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv.inputfiles.STORE_PROCEDURE_MIGRACION`
AS
SELECT * FROM `iter-data-storage-pv.inputfiles.STORE_PROCEDURE_MIGRACION_landing`
WHERE NOMBRE_STORE_PROCEDURE IS NOT NULL
;
*/
-----------------------------------------------------------------------------
-- Listado
-----------------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv.temp.MIGRACION_STORE_PROCEDURE`
AS
WITH TMP_DATA AS (
SELECT * FROM `iter-data-storage-pv.inputfiles.STORE_PROCEDURE_MIGRACION`
WHERE RESPONSABLE = 'JAMPIERE'
AND NOMBRE_STORE_PROCEDURE IS NOT NULL
AND REVISION = 'Realizar'
--AND COALESCE(ESTADO,'VACIO') <> 'Migrado'
)
SELECT
PST.NOMBRE_PROYECTO
,PST.NOMBRE_DATASET
,PST.NOMBRE_STORE_PROCEDURE
,PST.TIPO_RUTINA
,PST.FECHA_CREACION
--,REPLACE(REPLACE(PST.DDL,'CREATE PROCEDURE','CREATE OR REPLACE PROCEDURE' ),'interseguro-data`.programs','iter-data-storage-pv-uat`.programs') AS DDL
,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(PST.DDL,'CREATE PROCEDURE','CREATE OR REPLACE PROCEDURE' )
,'interseguro-data`.programs','iter-data-storage-pv-uat`.programs'),'iter-data-storage-pv'
,'iter-data-storage-pv-uat'),'interseguro-data','iter-data-storage-pv-uat'),'iter-data-storage-pv-uat-uat','iter-data-storage-pv-uat') AS DDL
--,PST.hash_diff
--,PST.FECHA_CREACION_REGISTRO
FROM (SELECT * FROM  `iter-data-storage-pv.logging_bigquery.CLOUD_BIGQUERY_STORE_PROCEDURE_raw`
      QUALIFY(ROW_NUMBER()OVER(PARTITION BY NOMBRE_PROYECTO,NOMBRE_STORE_PROCEDURE ORDER BY FECHA_CREACION DESC)) =1) PST
INNER JOIN TMP_DATA TD
        ON PST.NOMBRE_STORE_PROCEDURE = TD.NOMBRE_STORE_PROCEDURE
       AND PST.NOMBRE_PROYECTO = TD.NOMBRE_PROYECTO
;