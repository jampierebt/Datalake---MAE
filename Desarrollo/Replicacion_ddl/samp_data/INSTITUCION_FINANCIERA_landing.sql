CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.INSTITUCION_FINANCIERA_landing`
(
  id NUMERIC,
  nombre STRING,
  codigo STRING,
  id_tipo_inst_financ NUMERIC,
  abreviatura STRING,
  fecha_proceso DATE
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/INSTITUCION_FINANCIERA_landing/*.parquet"]);