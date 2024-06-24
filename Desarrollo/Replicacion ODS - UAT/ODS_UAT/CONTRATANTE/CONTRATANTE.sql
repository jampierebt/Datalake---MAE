-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/CONTRATANTE/CONTRATANTE-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
select DISTINCT 
ID_PERSONA
,APELLIDO_PATERNO
,APELLIDO_MATERNO
,NOMBRE
from `iter-data-storage-pv-uat.goldenrecord_data.CONTRATANTE`
--from `iter-data-storage-pv-uat.goldenrecord_data.CONTRATANTE`
;
