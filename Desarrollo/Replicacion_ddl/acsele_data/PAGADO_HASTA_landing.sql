CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.PAGADO_HASTA_landing`
(
  numero_poliza STRING,
  id_producto NUMERIC,
  fecha_pagado_hasta TIMESTAMP,
  fecha_proceso DATE
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/PAGADO_HASTA_landing/*.parquet"]);