CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.ESTADO_COMPROBANTE_raw`
(
  codigo STRING,
  descripcion STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/ESTADO_COMPROBANTE_raw/*.parquet"]);