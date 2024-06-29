CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.CURRENCY_landing`
(
  currencyid NUMERIC,
  description STRING,
  ccy_isocode STRING,
  ccy_default NUMERIC,
  ccy_symbol STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/CURRENCY_landing/*.parquet"]);