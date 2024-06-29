CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.CONFIGURATEDCOVERAGE_raw`
(
  configuratedcoverageid NUMERIC,
  agregatedinsuranceobjecttypeid NUMERIC,
  coveragetytleid NUMERIC,
  templateid NUMERIC,
  description STRING,
  mandatory STRING,
  ccv_parentid NUMERIC,
  pro_id NUMERIC,
  ccv_hierarchystate NUMERIC,
  gct_id NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/CONFIGURATEDCOVERAGE_raw/*.parquet"]);