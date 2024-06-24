
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/PERSONA_SINIESTRO_SEMAFORIZACION/PERSONA_SINIESTRO_SEMAFORIZACION-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
numero_documento 
,tipo_documento 
,categoria 
FROM `interseguro-data.temp.PERSONA_SINIESTRO_SEMAFORIZACION`;
