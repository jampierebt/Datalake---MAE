-- ------------------------------------------------------------------------------------
-- Paso 1: CREA TABLA TEMPORAL CON LOS DATOS QUE NECESITAMOS
-- ------------------------------------------------------------------------------------
CREATE OR REPLACE TABLE `interseguro-data.temp.ASEGURADO`
AS
SELECT 
id_persona
,id_rol
,numero_poliza
,tipo_documento
,numero_documento
,apellido_paterno
,apellido_materno
,nombre
,razon_social
,fecha_nacimiento
,fecha_fallecimiento
,genero
,estado_civil
,profesion
,nacionalidad
,centro_trabajo
,condicion_fumador
,cuspp
,afp
,parentesco
,nombre_producto
,nombre_grupo_producto
FROM `interseguro-data.goldenrecord_data.ASEGURADO`
QUALIFY(ROW_NUMBER()OVER(PARTITION BY id_persona,numero_poliza,nombre_producto))=1;

-- ------------------------------------------------------------------------------------
-- Paso 2: Exportar una carga full
-- ------------------------------------------------------------------------------------

EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/ASEGURADO/ASEGURADO-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
select 
id_persona
,id_rol
,numero_poliza
,tipo_documento
,numero_documento
,apellido_paterno
,apellido_materno
,nombre
,razon_social
,fecha_nacimiento
,fecha_fallecimiento
,genero
,estado_civil
,profesion
,nacionalidad
,centro_trabajo
,condicion_fumador
,cuspp
,afp
,parentesco
,nombre_producto
,nombre_grupo_producto
 from `interseguro-data.temp.ASEGURADO`
;
-- ------------------------------------------------------------------------------------
-- Paso 3: DROP TABLE
-- ------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `interseguro-data.temp.ASEGURADO` ;

