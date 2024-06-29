CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.sampmed_temp.TARJETA_raw`
(
  id_tarjeta NUMERIC,
  numero_tarjeta STRING,
  fecha_vencimiento STRING,
  via_cobro NUMERIC,
  medio_pago STRING,
  moneda STRING,
  estado NUMERIC,
  fecha_creacion STRING,
  fecha_modificacion STRING,
  id_tipo_cuenta NUMERIC,
  pasarela STRING,
  fecha_proceso STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/sampmed_data/TARJETA_raw/*.parquet"]);