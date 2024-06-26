SELECT 
TABLE_CATALOG
,TABLE_SCHEMA
,TABLE_NAME
,REPLACE(REPLACE(REPLACE(DDL,'{dataset_id}','acsele_temp'),');',CONCAT(')OPTIONS (format="PARQUET",URIS=["gs://{bucket_name}/{dataset_id}/',TABLE_NAME,'/*.parquet"]);')),'CREATE TABLE','CREATE OR REPLACE EXTERNAL TABLE') AS DDL
FROM {project_id}.{dataset_id}.INFORMATION_SCHEMA.TABLES