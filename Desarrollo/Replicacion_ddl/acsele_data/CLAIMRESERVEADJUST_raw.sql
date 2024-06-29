CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.CLAIMRESERVEADJUST_raw`
(
  claimreserveadjustid NUMERIC,
  claimreserveid NUMERIC,
  dateclaimreserveadjustid TIMESTAMP,
  description STRING,
  reason STRING,
  type STRING,
  cra_status NUMERIC,
  amount FLOAT64,
  doneby STRING,
  ccy_id NUMERIC,
  cra_exchangeamount NUMERIC,
  cra_originadjust NUMERIC,
  endorsementletterid NUMERIC,
  item NUMERIC,
  type_abbr STRING,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/CLAIMRESERVEADJUST_raw/*.parquet"]);