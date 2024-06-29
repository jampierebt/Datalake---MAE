CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.PLAN_landing`
(
  planid NUMERIC,
  productid NUMERIC,
  plantype NUMERIC,
  description STRING,
  pla_publisheddate TIMESTAMP,
  pla_closeddate TIMESTAMP,
  pla_versionid NUMERIC,
  pla_dcoid NUMERIC,
  pla_parentid NUMERIC,
  pla_hierarchystate NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/PLAN_landing/*.parquet"]);