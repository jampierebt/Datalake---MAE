CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.OADESGPERSONAL_raw`
(
  AUDITDATE TIMESTAMP,
  PK NUMERIC,
  STATIC NUMERIC,
  STATUS NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/OADESGPERSONAL_raw/*.parquet"]);