CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.ABONO_ERROR`
(
  ID_ABONO STRING,
  FECHA_PROCESO DATE
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/ABONO_ERROR/*.parquet"]);