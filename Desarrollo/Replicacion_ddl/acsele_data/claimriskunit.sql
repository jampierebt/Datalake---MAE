CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.claimriskunit`
(
  CLAIMID NUMERIC,
  CLAIMRISKUNITID NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/claimriskunit/*.parquet"]);