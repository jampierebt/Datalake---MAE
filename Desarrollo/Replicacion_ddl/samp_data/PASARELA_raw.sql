CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.PASARELA_raw`
(
  ID_PASARELA NUMERIC,
  GLS_PASARELA STRING,
  GLS_ENVIO_MOTOR STRING,
  FECHA_PROCESO TIMESTAMP
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/PASARELA_raw/*.parquet"]);