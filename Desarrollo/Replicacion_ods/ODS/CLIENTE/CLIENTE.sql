

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/CLIENTE/CLIENTE-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 

SELECT
idcliente,
ap_paterno,
ap_materno,
nombre,
nombre_2,
nombre_3,
razon_social,
idtipo_documento,
documento,
cod_regimen,
cumulo,
cod_producto,
cod_canal_distribucion,
cod_moneda,
cod_profesion,
cod_act_economica,
cod_tipo_persona,
cod_sujeto_obligado,
cod_persona_juridica,
cod_nacionalidad,
cod_residencia,
vol_transsaccional,
calificado,
activo,
usuario_creacion,
fecha_creacion,
usuario_modificacion,
fecha_modificacion,
pep,
fecha_nacimiento,
nacionalidad
FROM `interseguro-data.plaft_data.CLIENTE_raw`;
