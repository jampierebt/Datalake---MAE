-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/EXT_FLEX_RPT_PORTAFOLIO/EXT_FLEX_RPT_PORTAFOLIO-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  NUMEROPOLIZA
,FECHA_INI
,FECHA_FIN
,PERIODO
,PRODUCTO
,FONDO
,TIPO_FONDO
,PORTAFOLIO
,PESO
,PRECIO
FROM iter-data-storage-pv-uat.acsele_data.EXT_FLEX_RPT_PORTAFOLIO_raw 
;

