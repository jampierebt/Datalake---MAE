CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.CONCEPTO_COBRANZA_raw`
(
  CODIGO STRING,
  DESCRIPCION STRING,
  ABREVIACION STRING,
  FECHA_PROCESO TIMESTAMP
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/CONCEPTO_COBRANZA_raw/*.parquet"]);