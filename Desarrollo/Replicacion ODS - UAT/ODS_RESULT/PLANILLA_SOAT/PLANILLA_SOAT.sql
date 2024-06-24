-- ------------------------------------------------------------------------------------
-- Paso 1:Crear tabla temporal
-- ------------------------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.PLANILLA_SOAT`
AS 
select DISTINCT p.id_planilla ,
 cast(FORMAT_DATETIME('%Y-%m-%d',p.fecha_planilla,'America/Lima') as DATE) as fecha_planilla, 
   p.estado_planilla, p.total_cantidad as total_pago, ifnull(sum(arc.monto_aplicado_cantidad),0) as monto_pagado,
CASE
WHEN ifnull(sum(arc.monto_aplicado_cantidad),0)<=0 THEN 'PENDIENTE'
WHEN p.total_cantidad<=sum(arc.monto_aplicado_cantidad) THEN 'APLICADO'
WHEN sum(arc.monto_aplicado_cantidad) BETWEEN 0 AND p.total_cantidad  THEN 'PARCIAL'
END AS estado_homologado
from   `iter-data-storage-pv-uat.samp_data.PLANILLA_raw` p
       left join `iter-data-storage-pv-uat.samp_data.APLICACION_RECIBO_CAJA_raw` arc on p.id_planilla = arc.id_planilla_aplicado
where  p.origen_recaudacion = 32
       group by p.id_planilla, p.fecha_planilla, p.estado_planilla, p.total_cantidad;

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/PLANILLA_SOAT/PLANILLA_SOAT-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT DISTINCT id_planilla,
fecha_planilla,
estado_planilla,
total_pago,
monto_pagado,
estado_homologado
FROM `iter-data-storage-pv-uat.temp.PLANILLA_SOAT`;
