-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/EXT_FLEX_CARGOS_ACUM/EXT_FLEX_CARGOS_ACUM-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  NUM_POLIZA
, FECHA_INI
, FECHA_FIN
, ID_TOTAL_PRIMAMIN
, ID_TOTAL_PRIMAVOL
, ID_TOTAL_INTERES
FROM iter-data-storage-pv-uat.acsele_data.EXT_FLEX_CARGOS_ACUM_raw
;

