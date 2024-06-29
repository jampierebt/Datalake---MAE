CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.OASCTR_landing`
(
  auditdate TIMESTAMP,
  pk NUMERIC,
  static NUMERIC,
  status NUMERIC,
  tipoclienteinput STRING,
  tipoclientevalue STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/OASCTR_landing/*.parquet"]);