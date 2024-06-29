CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.VENDEDOR_CANAL_raw`
(
  numero_vendedor STRING,
  codigo_canal STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/VENDEDOR_CANAL_raw/*.parquet"]);