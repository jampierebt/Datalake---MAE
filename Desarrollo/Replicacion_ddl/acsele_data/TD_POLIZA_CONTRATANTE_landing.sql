CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.acsele_temp.TD_POLIZA_CONTRATANTE_landing`
(
  numero_poliza STRING,
  numero_operacion NUMERIC,
  auditdate_system_date STRING,
  operation_datetime STRING,
  id_producto NUMERIC,
  nombre_producto STRING,
  status_operation STRING,
  thirdpartyid NUMERIC,
  rol_id NUMERIC,
  description STRING,
  estado_poliza STRING
)OPTIONS (format="PARQUET",URIS=["gs://interseguro-datalake-alloy-uat-new/acsele_data/TD_POLIZA_CONTRATANTE_landing/*.parquet"]);