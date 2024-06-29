CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.STCA_DOCTYPE_raw`
(
  dty_id NUMERIC,
  dty_isdebit NUMERIC,
  dty_description STRING,
  dty_ismanual NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/STCA_DOCTYPE_raw/*.parquet"]);