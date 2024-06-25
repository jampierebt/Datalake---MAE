

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/POLIZA_OPERACION/POLIZA_OPERACION-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 

SELECT 
  NUMERO_POLIZA,
  NOMBRE_PRODUCTO,
  ESTADO_POLIZA,
  FECHA_OPERACION,
  NOMBRE_GRUPO_PRODUCTO
FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION` A 
WHERE  
  ESTADO_OPERACION='Applied operation' 
QUALIFY(ROW_NUMBER()OVER(PARTITION BY NUMERO_POLIZA ORDER BY A.FECHA_OPERACION DESC , NUMERO_OPERACION DESC ))=1;
