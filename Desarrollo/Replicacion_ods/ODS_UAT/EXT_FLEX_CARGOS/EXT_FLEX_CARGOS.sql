-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/EXT_FLEX_CARGOS/EXT_FLEX_CARGOS-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  NUM_POLIZA
, FECHA_INI
, FECHA_FIN
, FEC_INICIO_COBERTURA
, FEC_TERMINO_COBERTURA
, FEC_PAGO_REAL
, VAL_ORIGEN_CARGO
, VAL_ORIGEN_ABONO
, VAL_PRIMA_MINIMA_PAGADA
, VAL_PRIMA_VOLUNTARIA_PAGADA
, VAL_INTERES_PRESTAMO
, VAL_GASTO_COBRANZA
, OPENITEMDATE
, DOCDATE
, ORDEN
FROM iter-data-storage-pv-uat.acsele_data.EXT_FLEX_CARGOS_raw 
;

