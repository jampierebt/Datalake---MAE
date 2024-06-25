-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/EXT_RENTABILIDAD_CAB/EXT_RENTABILIDAD_CAB-*.csv.gz',
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
FROM iter-data-storage-pv-uat.acsele_data.EXT_RENTABILIDAD_CAB_raw 
;

