

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/TIPO_DOCUMENTO/TIPO_DOCUMENTO-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 

SELECT 
idtipo_documento,
codigo,
nombre,
nomenclatura,
activo
FROM `iter-data-storage-pv-uat.plaft_data.TIPO_DOCUMENTO_raw`;
