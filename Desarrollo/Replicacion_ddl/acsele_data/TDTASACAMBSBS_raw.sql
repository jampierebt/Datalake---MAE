CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.TDTASACAMBSBS_raw`
(
  pk STRING,
  static STRING,
  status STRING,
  mescontabinput STRING,
  mescontabvalue STRING,
  fechainput STRING,
  fechavalue STRING,
  dolasolinput STRING,
  dolasolvalue STRING,
  soladolinput STRING,
  soladolvalue STRING,
  fechacierremesinput STRING,
  fechacierremesvalue STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/TDTASACAMBSBS_raw/*.parquet"]);