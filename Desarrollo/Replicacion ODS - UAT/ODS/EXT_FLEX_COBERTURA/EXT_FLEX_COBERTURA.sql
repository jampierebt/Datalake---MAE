-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/EXT_FLEX_COBERTURA/EXT_FLEX_COBERTURA-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
NUMEROPOLIZA
, FECHA_INI
, FECHA_FIN
, IDPOLIZA
, IDOPERACION
, COVDESCCOBERTURAINPUT
, COVSUMAASEGURADA
, ORDEN
FROM interseguro-data.acsele_data.EXT_FLEX_COBERTURA_raw 
;
