-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/EXT_RENTABILIDAD_DET/EXT_RENTABILIDAD_DET-*.csv.gz',
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
,TIPO_FONDO
,RENTABILIDAD_1
,RENTABILIDAD_3
,RENTABILIDAD_5
,RENTABILIDAD_10
,RENTABILIDAD_DETALLE
,USUARIO_CREA
,FECHA_CREA
,USUARIO_MODIFICA
,FECHA_MODIFICA
FROM iter-data-storage-pv-uat.acsele_data.EXT_RENTABILIDAD_DET_raw 
;

