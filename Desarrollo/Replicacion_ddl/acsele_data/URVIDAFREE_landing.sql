CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.URVIDAFREE_landing`
(
  pk NUMERIC,
  static NUMERIC,
  status NUMERIC,
  periodopagoprimainput STRING,
  capitalaseguradoinput STRING,
  periodopagobenefinput STRING,
  capitalasegantvfinput STRING,
  urprimaanualinput STRING,
  urprimafpinput STRING,
  sumaaseguradasegtramoinput STRING,
  porcdevprimasfinalinput STRING,
  fecha_proceso DATE
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/URVIDAFREE_landing/*.parquet"]);