-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/POLIZA_AGENTE/POLIZA_AGENTE-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT DISTINCT
 numero_poliza
,cod_agente_inicial
,cod_agencia_inicial
,nombre_agente_inicial
,cod_agente_final
FROM `interseguro-data.goldenrecord_data.POLIZA_AGENTE`
--from `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE`
;


