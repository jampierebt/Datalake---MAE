CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.CLAIM_raw`
(
  productid NUMERIC,
  description STRING,
  claimid NUMERIC,
  claimdate TIMESTAMP,
  policyid NUMERIC,
  policydate TIMESTAMP,
  totalamount FLOAT64,
  state NUMERIC,
  eventclaimid NUMERIC,
  claimnumber STRING,
  claimnotificationid NUMERIC,
  excessclaimeventid NUMERIC,
  substate NUMERIC,
  bof_id NUMERIC,
  operationpk NUMERIC,
  usc_login STRING,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/CLAIM_raw/*.parquet"]);