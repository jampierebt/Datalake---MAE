
-----------------------------------------------------------------------------
-- Lectura de sheets
-----------------------------------------------------------------------------
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
-----------------------------------------------------------------------------
-- Listado
-----------------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv.temp.MIGRACION_STORE_PROCEDURE`
AS
WITH TMP_DATA AS (
SELECT * FROM `iter-data-storage-pv.inputfiles.STORE_PROCEDURE_MIGRACION_landing`
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
FROM (SELECT * FROM  `iter-data-storage-pv.master_product.PLNT_STORE_PROCEDURE_HIST`
      QUALIFY(ROW_NUMBER()OVER(PARTITION BY NOMBRE_PROYECTO,NOMBRE_STORE_PROCEDURE ORDER BY FECHA_CREACION DESC)) =1) PST
INNER JOIN TMP_DATA TD
        ON PST.NOMBRE_STORE_PROCEDURE = TD.NOMBRE_STORE_PROCEDURE
       AND PST.NOMBRE_PROYECTO = TD.NOMBRE_PROYECTO
;

----------------------------------------------------------------
--> Validacion de tipos de datos PROD VS UAT
-- No existen casos por lo tanto es identico
----------------------------------------------------------------
SELECT 
 A.TABLE_NAME
,A.COLUMN_NAME
,A.DATA_TYPE
,B.DATA_TYPE
FROM interseguro-data.acsele_data.INFORMATION_SCHEMA.COLUMNS A 
LEFT JOIN interseguro-data.acsele_data.INFORMATION_SCHEMA.COLUMNS B
       ON A.COLUMN_NAME = B.COLUMN_NAME
      AND A.TABLE_NAME = B.TABLE_NAME
WHERE A.DATA_TYPE <> B.DATA_TYPE
UNION ALL
SELECT 
 A.TABLE_NAME
,A.COLUMN_NAME
,A.DATA_TYPE
,B.DATA_TYPE
FROM interseguro-data.samp_data.INFORMATION_SCHEMA.COLUMNS A 
LEFT JOIN interseguro-data.samp_data.INFORMATION_SCHEMA.COLUMNS B
       ON A.COLUMN_NAME = B.COLUMN_NAME
      AND A.TABLE_NAME = B.TABLE_NAME
WHERE A.DATA_TYPE <> B.DATA_TYPE

;

----------------------------------------------------------------
--> Validacion de tipos de datos PROD VS UAT
-- No existen casos por lo tanto es identico
----------------------------------------------------------------
SELECT
 project_id AS NOMBRE_PROYECTO
,dataset_id AS NOMBRE_DATASET
,table_id AS NOMBRE_TABLA
,DATETIME(TIMESTAMP_MILLIS(creation_time),'America/Lima') AS FECHA_CREACION
,DATETIME(TIMESTAMP_MILLIS(last_modified_time),'America/Lima') AS FECHA_MODIFICACION
,row_count AS CANTIDAD_REGISTROS
,size_bytes / POW(1024,3) AS PESO_GB
FROM iter-data-storage-pv-uat.acsele_data.__TABLES__
UNION ALL
SELECT
 project_id AS NOMBRE_PROYECTO
,dataset_id AS NOMBRE_DATASET
,table_id AS NOMBRE_TABLA
,DATETIME(TIMESTAMP_MILLIS(creation_time),'America/Lima') AS FECHA_CREACION
,DATETIME(TIMESTAMP_MILLIS(last_modified_time),'America/Lima') AS FECHA_MODIFICACION
,row_count AS CANTIDAD_REGISTROS
,size_bytes / POW(1024,3) AS PESO_GB
FROM iter-data-storage-pv-uat.samp_data.__TABLES__
UNION ALL
SELECT
 project_id AS NOMBRE_PROYECTO
,dataset_id AS NOMBRE_DATASET
,table_id AS NOMBRE_TABLA
,DATETIME(TIMESTAMP_MILLIS(creation_time),'America/Lima') AS FECHA_CREACION
,DATETIME(TIMESTAMP_MILLIS(last_modified_time),'America/Lima') AS FECHA_MODIFICACION
,row_count AS CANTIDAD_REGISTROS
,size_bytes / POW(1024,3) AS PESO_GB
FROM iter-data-storage-pv-uat.sampmed_data.__TABLES__



;



-----------------------------------------------------------------------------
-- Lectura de sheets
-----------------------------------------------------------------------------
CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv.inputfiles.TABLES_ORACLE_landing`
(
TABLE_NAME	STRING
,COLUMN_NAME	STRING
,DATA_TYPE	STRING
,CONSTRAINT_TYPE STRING
,INDICADOR	STRING
,PROYECTO_PROD	STRING
,PROYECTO_UAT	STRING
,DATASET STRING
)
OPTIONS (
    format=GOOGLE_SHEETS,
    sheet_range='granularidad',
    URIS=["https://docs.google.com/spreadsheets/d/11bvxmTaA1ZbQpkKlbX5fnUuCj1XfiqUhNn1vJUbB3-w"], 
    -- NO ES TODO EL LINKSINO SOLO EL CODIGO DEL CENTRO
    skip_leading_rows=1, 
    max_bad_records = 0  
);
-----------------------------------------------------------------------------
-- Lista de Store a Migrar
-----------------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv.inputfiles.TABLES_ORACLE`
AS
SELECT 
CASE WHEN TABLE_NAME LIKE '%_raw' THEN TABLE_NAME ELSE CONCAT(TABLE_NAME,'_raw') END AS TABLE_NAME                
,COLUMN_NAME
,CONCAT(PROYECTO_PROD,'.',DATASET,'.',(CASE WHEN TABLE_NAME LIKE '%_raw' THEN TABLE_NAME ELSE CONCAT(TABLE_NAME,'_raw') END)) AS AMBIENTE_PROD
,CONCAT(PROYECTO_UAT,'.',DATASET,'.',(CASE WHEN TABLE_NAME LIKE '%_raw' THEN TABLE_NAME ELSE CONCAT(TABLE_NAME,'_raw') END)) AS AMBIENTE_UAT 
FROM `iter-data-storage-pv.inputfiles.TABLES_ORACLE_landing`
WHERE TABLE_NAME IS NOT NULL
;
