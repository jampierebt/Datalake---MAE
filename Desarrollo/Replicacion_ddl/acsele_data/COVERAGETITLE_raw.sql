CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.COVERAGETITLE_raw`
(
  COVERAGETITLEID NUMERIC,
  DESCRIPTION STRING,
  CVT_GENERATECUMULUS NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/COVERAGETITLE_raw/*.parquet"]);