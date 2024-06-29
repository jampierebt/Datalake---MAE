CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.AGREGATEDPOLICYTYPE_raw`
(
  agregatedpolicyid NUMERIC,
  productid NUMERIC,
  policytypeid NUMERIC,
  lifecycleid NUMERIC,
  description STRING,
  apt_publisheddate TIMESTAMP,
  apt_closeddate TIMESTAMP,
  apt_versionid NUMERIC,
  apt_parentid NUMERIC,
  apt_hierarchystate NUMERIC,
  apt_lcyhierarchystate NUMERIC,
  apt_parentlifecycleid NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/AGREGATEDPOLICYTYPE_raw/*.parquet"]);