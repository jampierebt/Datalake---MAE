CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.STTS_ROLE_landing`
(
  rol_id NUMERIC,
  rol_description STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/STTS_ROLE_landing/*.parquet"]);