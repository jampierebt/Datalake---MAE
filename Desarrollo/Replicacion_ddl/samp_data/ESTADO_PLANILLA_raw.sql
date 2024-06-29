CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.ESTADO_PLANILLA_raw`
(
  id NUMERIC,
  descripcion STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/ESTADO_PLANILLA_raw/*.parquet"]);