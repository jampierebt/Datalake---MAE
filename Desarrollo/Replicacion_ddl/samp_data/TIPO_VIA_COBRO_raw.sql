CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.TIPO_VIA_COBRO_raw`
(
  ID STRING,
  DESCRIPCION STRING,
  CODIGO STRING,
  FECHA_PROCESO TIMESTAMP
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/TIPO_VIA_COBRO_raw/*.parquet"]);