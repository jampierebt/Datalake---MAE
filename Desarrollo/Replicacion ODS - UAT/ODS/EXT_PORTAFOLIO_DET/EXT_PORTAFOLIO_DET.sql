-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/EXT_PORTAFOLIO_DET/EXT_PORTAFOLIO_DET-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  CODIGO_DET
,CODIGO_CAB
,PERIODO
,CODIGO_PROD
,PRODUCTO
,FONDO
,TIPO_FONDO
,PORTAFOLIO
,PESO
,PRECIO
,USUARIO_CREA
,FECHA_CREA
,USUARIO_MODIFICA
,FECHA_MODIFICA
FROM interseguro-data.acsele_data.EXT_PORTAFOLIO_DET_raw 
;

