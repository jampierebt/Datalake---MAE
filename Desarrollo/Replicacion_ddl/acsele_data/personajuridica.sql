CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.personajuridica`
(
  pk NUMERIC,
  static NUMERIC,
  status NUMERIC,
  rucinput STRING,
  rucvalue STRING,
  nombrecompempvalue STRING,
  fechaconstitucioninput STRING,
  fechaconstitucionvalue STRING,
  paginawebinput STRING,
  paginawebvalue STRING,
  nombrecompempinput STRING
)
OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/personajuridica/*.parquet"]);