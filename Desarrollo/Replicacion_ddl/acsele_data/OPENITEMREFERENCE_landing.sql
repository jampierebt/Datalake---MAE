CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.OPENITEMREFERENCE_landing`
(
  oih_auditdate TIMESTAMP,
  openitemdate TIMESTAMP,
  openitemreferenceid NUMERIC,
  openitemid NUMERIC,
  policyid NUMERIC,
  riskunitid NUMERIC,
  reference NUMERIC,
  additionalreference NUMERIC,
  paymentsequence STRING,
  opr_policynumber STRING,
  opr_riskunitnumber STRING,
  opr_claimnumber STRING,
  opr_recoverynumber STRING,
  pgc_category STRING,
  opr_productpk STRING,
  ciop_id NUMERIC,
  opr_componentid NUMERIC,
  agv_id NUMERIC,
  opr_rcin_id NUMERIC,
  rco_id NUMERIC,
  rop_id NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/OPENITEMREFERENCE_landing/*.parquet"]);