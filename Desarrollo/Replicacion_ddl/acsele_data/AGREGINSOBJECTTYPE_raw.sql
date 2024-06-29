CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.AGREGINSOBJECTTYPE_raw`
(
  agregatedinsuranceobjectypeid NUMERIC,
  planpk NUMERIC,
  templatepk NUMERIC,
  description STRING,
  ait_parentid NUMERIC,
  pro_id NUMERIC,
  ait_hierarchystate NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/AGREGINSOBJECTTYPE_raw/*.parquet"]);