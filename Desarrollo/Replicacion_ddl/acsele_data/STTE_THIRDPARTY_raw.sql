CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.STTE_THIRDPARTY_raw`
(
  tpt_id NUMERIC,
  tpt_status BOOL,
  tpt_issystem BOOL,
  cot_id NUMERIC,
  iddco NUMERIC,
  hpl_id NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/STTE_THIRDPARTY_raw/*.parquet"]);