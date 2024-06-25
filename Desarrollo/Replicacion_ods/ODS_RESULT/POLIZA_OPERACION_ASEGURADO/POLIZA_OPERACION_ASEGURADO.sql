

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/POLIZA_OPERACION_ASEGURADO/POLIZA_OPERACION_ASEGURADO-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 

with poliza_operacion as (
SELECT
  NUMERO_POLIZA,
  NOMBRE_PRODUCTO,
  ESTADO_POLIZA,
  FECHA_OPERACION,
  NOMBRE_GRUPO_PRODUCTO
FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION` A
WHERE
  ESTADO_OPERACION='Applied operation'
QUALIFY(ROW_NUMBER()OVER(PARTITION BY NUMERO_POLIZA ORDER BY A.FECHA_OPERACION DESC , NUMERO_OPERACION DESC ))=1
)
SELECT p.numero_poliza,
    p.nombre_producto,
    p.estado_poliza,
    CAST(p.fecha_operacion AS date) as fecha_operacion,
    a.numero_documento AS asegurado_documento
   FROM poliza_operacion p
     LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.ASEGURADO` a ON p.numero_poliza = a.numero_poliza
  WHERE lower(p.nombre_grupo_producto) = 'vida' 
  and lower(p.estado_poliza) in ('anulada','caducada','cancelada','prorrogado','saldada','suspendida') 
  AND ((extract(year from current_date()) - extract(year from p.fecha_operacion)) * 12 + (extract(month from current_date()) - extract(month from p.fecha_operacion))) < 12;
