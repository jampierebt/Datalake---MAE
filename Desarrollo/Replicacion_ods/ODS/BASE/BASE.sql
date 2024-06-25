

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/BASE/BASE-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 

SELECT 
actividad_economica,
activo,
ap_materno,
ap_paterno,
cargo,
cuestionario,
delito,
detalle,
documento,
documento_pep,
experiencia_mercado,
fecha,
fecha_creacion,
fecha_fin_labores,
fecha_inicio_labores,
fecha_modificacion,
idbase,
idbase_categoria,
idtipo_documento,
idtipo_documento_pep,
n_oficio,
nivel_pep,
nombre,
nombre_2,
nombre_3,
pais_fiscal,
parentesco,
razon_social,
ruc,
usuario_creacion,
usuario_modificacion
FROM `interseguro-data.plaft_data.BASE_raw`;
