CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.TBL_UBIGEO_landing`
(
  ttl_name STRING,
  ttl_value STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/TBL_UBIGEO_landing/*.parquet"]);