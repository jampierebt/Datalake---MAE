CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.URVIDATOTALPROTEGIDA_landing`
(
  auditdate TIMESTAMP,
  pk NUMERIC,
  static NUMERIC,
  status NUMERIC,
  productosvidainput STRING,
  productosvidavalue STRING,
  periodopagoprimainput STRING,
  periodopagoprimavalue STRING,
  capitalasegantaccinput STRING,
  capitalasegantaccvalue STRING,
  capitalaseguradoaccinput STRING,
  capitalaseguradoaccvalue STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/URVIDATOTALPROTEGIDA_landing/*.parquet"]);