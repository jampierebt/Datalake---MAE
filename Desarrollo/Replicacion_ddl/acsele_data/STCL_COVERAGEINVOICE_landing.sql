CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.STCL_COVERAGEINVOICE_landing`
(
  covi_invoice STRING,
  covi_date TIMESTAMP,
  tpt_id NUMERIC,
  dco_id NUMERIC,
  crbf_id NUMERIC,
  cot_id NUMERIC,
  pod_id NUMERIC,
  dco_idtaxes NUMERIC,
  cot_idtaxes NUMERIC,
  covi_rate NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/STCL_COVERAGEINVOICE_landing/*.parquet"]);