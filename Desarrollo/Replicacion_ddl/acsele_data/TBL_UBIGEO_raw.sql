CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.TBL_UBIGEO_raw`
(
  TTL_NAME STRING,
  TTL_VALUE STRING,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/TBL_UBIGEO_raw/*.parquet"]);