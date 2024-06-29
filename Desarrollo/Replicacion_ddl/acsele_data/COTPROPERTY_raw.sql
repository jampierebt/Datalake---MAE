CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.COTPROPERTY_raw`
(
  propertyid NUMERIC,
  cotpropertyid NUMERIC,
  numasociation NUMERIC,
  ttloption NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/COTPROPERTY_raw/*.parquet"]);