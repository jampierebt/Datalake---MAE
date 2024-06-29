CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.claimnormalreserve`
(
  CLAIMNORMALRESERVEDID NUMERIC,
  CLAIMINSURANCEOBJECTID NUMERIC,
  CNR_STATUS NUMERIC,
  DESCRIPTION STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/claimnormalreserve/*.parquet"]);