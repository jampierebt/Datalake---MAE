-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/EXT_POLIZA_TIR/EXT_POLIZA_TIR-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  NUMPOLIZA
,PERIODO
,SALDOFINAL_CP
,SALDOFINAL_CAV
,TIRMENSUAL_CP
,TIRMENSUAL_CAV
,TIRANUAL_CP
,TIRANUAL_CAV
,USUARIO_CREA
,FECHA_CREA
,USUARIO_MODIFICA
,FECHA_MODIFICA
FROM iter-data-storage-pv-uat.acsele_data.EXT_POLIZA_TIR_raw 
;

