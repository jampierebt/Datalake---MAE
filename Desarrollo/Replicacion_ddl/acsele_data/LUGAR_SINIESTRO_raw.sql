CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.LUGAR_SINIESTRO_raw`
(
  NUMERO_SINIESTRO STRING,
  NUMERO_POLIZA STRING,
  LUGAR_SINIESTRO STRING,
  FECHA_PROCESO DATE
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/LUGAR_SINIESTRO_raw/*.parquet"]);