-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/EXT_FLEX_CONTRATANTE/EXT_FLEX_CONTRATANTE-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT NUMEROPOLIZA
, FECHA_INI
, FECHA_FIN
, IDPOLIZA
, IDOPERACION
, DCOID
, ID_TERCERO
, NOMBRECOMPLETO
, PRIMER_NOMBRE
, SEGUN_NOMBRE
, APELLIDO
, APELLIDOMATERNO
, SEXO
, SEXOVALUE
, RAZON_SOCIAL
, DIRECCION
, TELEFONOINPUT
, MOVIL_DIRECCION
, UBIGEO_DISTRTITO
, UBIGEO_PROVINCIA
, UBIGEO_DEPARTAMENTO
, TIPODOCUMENTOIDENTIDAD
, NUMDOCUMENTO
, FECHANACIMIENTO
, PROFESION
, ACTIVIDAD_ECONOMICA
, FUMADOR_CONDICION
, MOVIL1
, MOVIL2
, MOVIL3
, DEPARTAMENTO
, PROVINCIA
, DISTRITO
, CORREO
FROM iter-data-storage-pv-uat.acsele_data.EXT_FLEX_CONTRATANTE_raw 
;
