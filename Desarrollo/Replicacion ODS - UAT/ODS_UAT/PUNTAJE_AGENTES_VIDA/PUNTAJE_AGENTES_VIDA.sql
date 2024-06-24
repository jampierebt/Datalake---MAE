-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/PUNTAJE_AGENTES_VIDA/PUNTAJE_AGENTES_VIDA-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT DISTINCT
 PERIODO
,CODIGO_AGENTE
,RATIO_COBRANZA_VIDA
FROM `iter-data-storage-pv.bi_finanzas.V_PUNTAJE_AGENTES_VIDA`
--from `iter-data-storage-pv-uat.bi_finanzas.V_PUNTAJE_AGENTES_VIDA`

