CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.claiminsuranceobject`
(
  AGREGATEDINSURANCEOBJECTID NUMERIC,
  CLAIMINSURANCEOBJECTID NUMERIC,
  CLAIMRISKUNITID NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/claiminsuranceobject/*.parquet"]);