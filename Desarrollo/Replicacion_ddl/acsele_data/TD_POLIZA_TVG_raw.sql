CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.TD_POLIZA_TVG_raw`
(
  numero_poliza STRING,
  numero_operacion NUMERIC,
  anio NUMERIC,
  mes NUMERIC,
  rescate NUMERIC,
  saldo NUMERIC,
  suma_asegurada NUMERIC,
  anios_prorrogados NUMERIC,
  meses_prorrogados NUMERIC,
  beneficio_supervivencia NUMERIC
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/TD_POLIZA_TVG_raw/*.parquet"]);