

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/BASE_CATEGORIA/BASE_CATEGORIA-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 

SELECT
idbase_categoria,
idbase_tipo,
codigo,
descripcion,
descripcion_fecha,
activo
FROM `interseguro-data.plaft_data.BASE_CATEGORIA_raw`;
