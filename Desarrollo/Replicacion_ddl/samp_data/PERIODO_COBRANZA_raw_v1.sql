CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.PERIODO_COBRANZA_raw_v1`
(
  ID_PERIODO_COBRANZA NUMERIC,
  PERIODO NUMERIC,
  ESTADO NUMERIC,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/PERIODO_COBRANZA_raw_v1/*.parquet"]);