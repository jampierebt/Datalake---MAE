CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.CONFIGURABLEOBJECTTYPE_raw`
(
  configurableobjecttypeid NUMERIC,
  description STRING,
  type NUMERIC,
  state STRING,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/CONFIGURABLEOBJECTTYPE_raw/*.parquet"]);