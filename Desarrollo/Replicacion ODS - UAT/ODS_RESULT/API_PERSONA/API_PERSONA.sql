-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/API_PERSONA/API_PERSONA-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  DOCUMENT_NUMBER
,DOCUMENT_TYPE
,DOCUMENT_TYPE_ID
,PERSON_TYPE_ID
,PERSON_TYPE
,NAME
,PATERNAL_SURNAME
,MATERNAL_SURNAME
,BIRTHDATE
,GENDER_ID
,GENDER
,EMAIL
,PHONE_NUMBER
,ADDRESS
,DEPARTMENT
,PROVINCE
,DISTRICT
,FLAG_INDICADOR_CONSENTIMIENTO
,FLAG_INDICADOR_CLIENTE
FROM iter-data-storage-pv.views.V_API_PERSONA
;

