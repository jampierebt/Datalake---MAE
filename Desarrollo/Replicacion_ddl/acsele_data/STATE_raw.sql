CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.STATE_raw`
(
  stateid NUMERIC,
  lifecycleid NUMERIC,
  idnodo NUMERIC,
  description STRING,
  width FLOAT64,
  height FLOAT64,
  x FLOAT64,
  y FLOAT64,
  status NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/STATE_raw/*.parquet"]);