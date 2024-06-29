CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.stcl_paymentliquidation`
(
  POR_ID NUMERIC,
  OPM_ID NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/stcl_paymentliquidation/*.parquet"]);