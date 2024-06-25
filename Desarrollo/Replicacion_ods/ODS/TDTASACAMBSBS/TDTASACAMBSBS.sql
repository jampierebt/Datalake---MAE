

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/TDTASACAMBSBS/TDTASACAMBSBS-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 

SELECT 
PK,
STATIC,
STATUS,
MESCONTABINPUT,
MESCONTABVALUE,
FECHAINPUT,
FECHAVALUE,
DOLASOLINPUT,
DOLASOLVALUE,
SOLADOLINPUT,
SOLADOLVALUE,
FECHACIERREMESINPUT,
FECHACIERREMESVALUE
FROM `interseguro-data.acsele_data.TDTASACAMBSBS_raw`;
