CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.EXT_FLEX_POLIZA_PAGOS_raw`
(
  IDPOLIZA NUMERIC,
  POLIZA STRING,
  PAGADOHASTA TIMESTAMP
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/EXT_FLEX_POLIZA_PAGOS_raw/*.parquet"]);