

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/CLASE_USO/CLASE_USO-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 

select TRVAL_HIJO cod_clase,
TRVAL_PADRE cod_uso
from `iter-data-storage-pv-uat.acsele_data.VIEW_PROPLISTA_DEPEN_raw`  d 
where lower(D.SIMBOLO_PADRE)='uso'
