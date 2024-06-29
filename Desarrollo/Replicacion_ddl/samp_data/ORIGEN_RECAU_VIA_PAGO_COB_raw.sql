CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.ORIGEN_RECAU_VIA_PAGO_COB_raw`
(
  id_orirec_viapagocobro NUMERIC,
  id_origen_reca_planilla NUMERIC,
  num_via_pago_cobro NUMERIC,
  estado NUMERIC,
  fecha_creacion TIMESTAMP,
  usuario_creacion STRING,
  fecha_modificacion TIMESTAMP,
  usuario_modificacion STRING,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/ORIGEN_RECAU_VIA_PAGO_COB_raw/*.parquet"]);