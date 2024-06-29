CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.CURRENCYRATE_landing`
(
  currencyoriginid NUMERIC,
  currencytargetid NUMERIC,
  daterate TIMESTAMP,
  rate STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/CURRENCYRATE_landing/*.parquet"]);