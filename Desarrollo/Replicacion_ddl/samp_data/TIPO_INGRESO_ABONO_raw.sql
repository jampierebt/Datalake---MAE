CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.TIPO_INGRESO_ABONO_raw`
(
  id_tipo_ingreso_abono NUMERIC,
  nombre_tipo_ingreso STRING,
  nombre_corto_tipo_ingreso STRING,
  indicador_paga_comision STRING,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/TIPO_INGRESO_ABONO_raw/*.parquet"]);