

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/CLASE/CLASE-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 

SELECT distinct TRVAL codigo,
TR_DISPLAY nombre 
FROM `iter-data-storage-pv-uat.acsele_data.VIEW_PROPIEDAD_VALORES_raw` WHERE SIMBOLO = 'Clase'
;
