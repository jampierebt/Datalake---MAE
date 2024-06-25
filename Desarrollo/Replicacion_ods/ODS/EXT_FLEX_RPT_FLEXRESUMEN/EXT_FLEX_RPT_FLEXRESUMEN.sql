-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/EXT_FLEX_RPT_FLEXRESUMEN/EXT_FLEX_RPT_FLEXRESUMEN-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  NUMEROPOLIZA
,FEC_INICIO_COBERTURA
,FEC_TERMINO_COBERTURA
,FEC_PAGO_REAL
,VAL_ORIGEN_CARGO
,VAL_ORIGEN_ABONO
,VAL_PRIMA_MINIMA_PAGADA
,VAL_PRIMA_VOLUNTARIA_PAGADA
,VAL_INTERES_PRESTAMO
,VAL_GASTO_COBRANZA
,VIA_PAGO
,TIPO
FROM interseguro-data.acsele_data.EXT_FLEX_RPT_FLEXRESUMEN_raw 
;

