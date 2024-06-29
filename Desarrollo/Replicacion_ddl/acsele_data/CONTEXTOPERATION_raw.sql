CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.CONTEXTOPERATION_raw`
(
  ID NUMERIC,
  AUDITDATE TIMESTAMP,
  ESTADO_CARGA NUMERIC,
  FECHA_PROCESO DATETIME,
  TIME_STAMP TIMESTAMP
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/CONTEXTOPERATION_raw/*.parquet"]);