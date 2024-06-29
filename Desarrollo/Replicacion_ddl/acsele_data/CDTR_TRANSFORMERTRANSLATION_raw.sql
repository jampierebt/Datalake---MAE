CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.CDTR_TRANSFORMERTRANSLATION_raw`
(
  TTL_NAME STRING,
  TTL_VALUE STRING,
  TTL_LANGUAGE STRING,
  TRF_ID STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/CDTR_TRANSFORMERTRANSLATION_raw/*.parquet"]);