CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.CONFIGURABLEOBJECTTYPE_landing`
(
  configurableobjecttypeid NUMERIC,
  description STRING,
  type NUMERIC,
  state STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/CONFIGURABLEOBJECTTYPE_landing/*.parquet"]);