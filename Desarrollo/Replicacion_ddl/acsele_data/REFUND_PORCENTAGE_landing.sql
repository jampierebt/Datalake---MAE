CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.REFUND_PORCENTAGE_landing`
(
  policyid NUMERIC,
  policy_height NUMERIC,
  ref_percentage NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/REFUND_PORCENTAGE_landing/*.parquet"]);