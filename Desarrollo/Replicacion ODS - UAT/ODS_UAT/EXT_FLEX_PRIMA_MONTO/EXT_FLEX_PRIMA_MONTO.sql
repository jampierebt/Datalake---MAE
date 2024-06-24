-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/EXT_FLEX_PRIMA_MONTO/EXT_FLEX_PRIMA_MONTO-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT POLICYID
, OPERATIONPK
, PRIMANETA_VALOR
, IGV_VALOR
, DERECHOEMISIONDOC_VALOR
, PRIMATOTAL_VALOR
, PRIMANETAANUAL_VALOR
, IGVDOC_VALOR
, PRIMATOTALANUAL_VALOR
, DERECHOEMISION_VALOR
FROM iter-data-storage-pv-uat.acsele_data.EXT_FLEX_PRIMA_MONTO_raw 
;
