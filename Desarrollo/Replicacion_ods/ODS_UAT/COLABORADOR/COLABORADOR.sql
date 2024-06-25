-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/COLABORADOR/COLABORADOR-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
select DISTINCT 
CODIGO_IS
,DOCUMENTO_IDENTIDAD
 from `iter-data-storage-pv-uat.goldenrecord_data.COLABORADOR`
-- from `iter-data-storage-pv-uat.goldenrecord_data.COLABORADOR`
;

