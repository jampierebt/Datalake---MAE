-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/EXT_FLEX_RPT_COBERTURA/EXT_FLEX_RPT_COBERTURA-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  NUMEROPOLIZA
,IDOPERACION
,FECHA_INI
,FECHA_FIN
,COBERTURA
,CAPITAL
,ORDEN
FROM iter-data-storage-pv-uat.acsele_data.EXT_FLEX_RPT_COBERTURA_raw 
;

