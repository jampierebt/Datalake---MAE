CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.COTPROPERTY_landing`
(
  propertyid NUMERIC,
  cotpropertyid NUMERIC,
  numasociation NUMERIC,
  ttloption NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/COTPROPERTY_landing/*.parquet"]);