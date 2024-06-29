CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.DEPOSITO_PLANILLA_raw`
(
  id_deposito_planilla NUMERIC,
  id_deposito NUMERIC,
  id_planilla NUMERIC,
  estado NUMERIC,
  fecha_creacion STRING,
  usuario_creacion STRING,
  fecha_modificacion STRING,
  usuario_modificacion STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/DEPOSITO_PLANILLA_raw/*.parquet"]);