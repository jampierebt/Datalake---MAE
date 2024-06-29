CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.DEPOSITO_DETALLE_PLANILLA_raw`
(
  id_deposito_detalle_planilla NUMERIC,
  id_detalle_planilla NUMERIC,
  id_deposito NUMERIC,
  fecha_creacion STRING,
  usuario_creacion STRING,
  fecha_modificacion STRING,
  usuario_modificacion STRING,
  estado NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/DEPOSITO_DETALLE_PLANILLA_raw/*.parquet"]);