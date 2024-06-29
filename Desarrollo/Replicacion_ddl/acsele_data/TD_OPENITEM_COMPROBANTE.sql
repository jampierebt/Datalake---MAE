CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.TD_OPENITEM_COMPROBANTE`
(
  numero_poliza STRING,
  id_producto NUMERIC,
  comprobante STRING,
  fecha_pago_inicial TIMESTAMP,
  monto_prima_pago FLOAT64,
  fecha_pagado_hasta TIMESTAMP
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/TD_OPENITEM_COMPROBANTE/*.parquet"]);