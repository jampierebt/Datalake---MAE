-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/EXT_FLEX_ASEGURADO/EXT_FLEX_ASEGURADO-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT 
 NUMEROPOLIZA
, FECHA_INI
, FECHA_FIN
, IDPOLIZA
, IDOPERACION
, DCOID
, STATIC
, AGREGATEDOBJECTID
, NUMEROOBJETOASEGINPUT
, TIPO_ASEGURADO
, TIPODOCUMENTOIDENTIDAD
, NUMDOCUMENTO
, NOMBRE
, SEGUNDONOMBRE
, APELLIDOPATERNO
, APELLIDOMATERNO
, NOMBREPREDETERMINADO
, SEXO
, IDSEXO
, FECHANACIMIENTO
, EDAD
, PROFESION
, ACTIVIDADECONOMICA
, FUMADOR
FROM interseguro-data.acsele_data.EXT_FLEX_ASEGURADO_raw 
;

