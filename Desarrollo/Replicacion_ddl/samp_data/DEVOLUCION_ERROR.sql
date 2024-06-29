CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.DEVOLUCION_ERROR`
(
  ID_CARGO NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/DEVOLUCION_ERROR/*.parquet"]);