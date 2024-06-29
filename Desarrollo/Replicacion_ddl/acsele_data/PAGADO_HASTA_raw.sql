CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.PAGADO_HASTA_raw`
(
  NUMERO_POLIZA STRING,
  FECHA_PAGADO_HASTA DATE,
  FECHA_PROCESO DATE
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/PAGADO_HASTA_raw/*.parquet"]);