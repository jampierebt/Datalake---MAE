-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/API_VEHICULO/API_VEHICULO-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
 placa
,id_marca
,marca
,id_modelo
,modelo
,id_version
,version
,id_clase
,clase
,id_uso
,uso
,color
,numero_serie
,numero_motor
,anio_fabricacion
,numero_asiento
,anio_modelo
 FROM `interseguro-data.bot_data.API_VEHICULO`
;

