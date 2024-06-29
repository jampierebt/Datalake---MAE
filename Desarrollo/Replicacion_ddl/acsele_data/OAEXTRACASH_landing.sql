CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.OAEXTRACASH_landing`
(
  AUDITDATE TIMESTAMP,
  PK NUMERIC,
  STATIC NUMERIC,
  STATUS NUMERIC,
  EDADINPUT STRING,
  EDADVALUE STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/OAEXTRACASH_landing/*.parquet"]);