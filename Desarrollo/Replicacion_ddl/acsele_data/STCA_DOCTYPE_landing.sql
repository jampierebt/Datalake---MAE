CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.STCA_DOCTYPE_landing`
(
  dty_id NUMERIC,
  dty_isdebit NUMERIC,
  dty_description STRING,
  dty_ismanual NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/STCA_DOCTYPE_landing/*.parquet"]);