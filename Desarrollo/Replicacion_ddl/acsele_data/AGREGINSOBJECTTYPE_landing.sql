CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.AGREGINSOBJECTTYPE_landing`
(
  agregatedinsuranceobjectypeid NUMERIC,
  planpk NUMERIC,
  templatepk NUMERIC,
  description STRING,
  ait_parentid NUMERIC,
  pro_id NUMERIC,
  ait_hierarchystate NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/AGREGINSOBJECTTYPE_landing/*.parquet"]);