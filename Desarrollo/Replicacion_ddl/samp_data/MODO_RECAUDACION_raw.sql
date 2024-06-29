CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.MODO_RECAUDACION_raw`
(
  id_modo_recaudacion NUMERIC,
  codigo STRING,
  descripcion STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/MODO_RECAUDACION_raw/*.parquet"]);