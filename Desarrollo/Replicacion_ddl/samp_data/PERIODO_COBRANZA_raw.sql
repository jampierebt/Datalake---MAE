CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.PERIODO_COBRANZA_raw`
(
  id_periodo_cobranza NUMERIC,
  periodo NUMERIC,
  estado NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/PERIODO_COBRANZA_raw/*.parquet"]);