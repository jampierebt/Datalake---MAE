CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.STTS_ROLE_raw`
(
  ROL_ID NUMERIC,
  ROL_DESCRIPTION STRING,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/STTS_ROLE_raw/*.parquet"]);