CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.VIA_COBRO_landing`
(
  id NUMERIC,
  nombre STRING,
  id_tipo_via_cobro NUMERIC,
  moneda_cobranza STRING,
  id_marca_tarjeta NUMERIC,
  indicador_validacion NUMERIC,
  id_institucion_financiera NUMERIC,
  id_medio_envio NUMERIC,
  estado_afiliacion NUMERIC,
  estado_cobranza NUMERIC,
  estrategia_agrupacion NUMERIC,
  correo_afiliacion STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/VIA_COBRO_landing/*.parquet"]);