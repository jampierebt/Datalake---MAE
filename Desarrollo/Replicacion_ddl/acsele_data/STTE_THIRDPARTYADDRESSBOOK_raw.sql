CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.STTE_THIRDPARTYADDRESSBOOK_raw`
(
  tab_id NUMERIC,
  tpt_id NUMERIC,
  cot_id NUMERIC,
  iddco NUMERIC,
  tab_type NUMERIC,
  tab_status NUMERIC,
  isdefaultaddress NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/STTE_THIRDPARTYADDRESSBOOK_raw/*.parquet"]);