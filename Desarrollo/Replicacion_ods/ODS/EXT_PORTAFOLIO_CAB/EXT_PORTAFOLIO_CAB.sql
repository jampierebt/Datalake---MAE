-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/EXT_PORTAFOLIO_CAB/EXT_PORTAFOLIO_CAB-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  CODIGO_CAB
,ARCHIVO
,FECHA_CARGA
,PERIODO
,COD_ESTADO
,USUARIO_CREA
,FECHA_CREA
,USUARIO_MODIFICA
,FECHA_MODIFICA
FROM interseguro-data.acsele_data.EXT_PORTAFOLIO_CAB_raw 
;

