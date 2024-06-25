-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/ESTRUCTURA_COMERCIAL/ESTRUCTURA_COMERCIAL-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
)
AS
SELECT DISTINCT
 CODIGO_GDH
,CATEGORIA
,COD_AGENCIA
,COD_AGENTE
,DOC_AGENTE
,NOM_AGENTE
,FECHA_INICIO_VIGENCIA
,CODIGO_CONTRATO
,COD_USERNAME_AGENTE
,DOC_SUPERVIS
,COD_JEFE
,COD_JEFATURA
,FLAG_AGENTE_INDICADOR_VIGENCIA
,ZONA_JEFE AS ZONA_AGENCIA
,COD_ORIGEN_ZONA
,FECHA_CESE
,gls_correo_agente
,celular
FROM `interseguro-data.goldenrecord_data.ESTRUCTURA_COMERCIAL`
;

