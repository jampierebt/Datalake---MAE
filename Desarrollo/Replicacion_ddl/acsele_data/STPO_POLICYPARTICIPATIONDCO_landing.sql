CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.STPO_POLICYPARTICIPATIONDCO_landing`
(
  firstpaymentmodedcok NUMERIC,
  firstpaymentmodetemplate STRING,
  cto_id NUMERIC,
  ctob_id NUMERIC,
  cnw_id NUMERIC,
  status NUMERIC,
  auditdate TIMESTAMP,
  time_stamp TIMESTAMP,
  addressbookmailid NUMERIC,
  addressbookid NUMERIC,
  paymentmodedcopk NUMERIC,
  paymentmodetemplatename STRING,
  dcoid NUMERIC,
  operationpk NUMERIC,
  agregatedobjectid NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/STPO_POLICYPARTICIPATIONDCO_landing/*.parquet"]);