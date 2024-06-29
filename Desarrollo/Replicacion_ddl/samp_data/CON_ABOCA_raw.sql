CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.samp_temp.CON_ABOCA_raw`
(
  cod_concepto_abono_cargo STRING,
  gls_concepto_abono_cargo STRING,
  cod_tipo_movimiento STRING,
  num_cta_contable NUMERIC,
  ind_libro_venta STRING,
  ind_genera_cobranza STRING,
  ind_abono_rvi STRING,
  ind_abono_valido STRING,
  ind_cargo_valido STRING,
  cod_tipo_concepto_aboca STRING,
  ind_paga_comision STRING,
  ind_paga_comis_agente STRING,
  ind_igv STRING,
  FECHA_PROCESO DATETIME
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/samp_data/CON_ABOCA_raw/*.parquet"]);