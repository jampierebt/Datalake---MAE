CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_POLIZA_UNIVERSO_GCP`
PARTITION BY DATE_TRUNC(FECHA_CREACION_REGISTRO,YEAR)
CLUSTER BY ID_PRODUCTO
AS
SELECT 
  NUMERO_POLIZA
 ,FECHA_EMISION
 ,ID_PRODUCTO
 ,ID_GRUPO_PRODUCTO
 ,FRECUENCIA_EMISION
 ,PRIMA_NETA_ANUAL_PEN
 ,ESTADO
 ,ID_PERSONA
 ,FECHA_CREACION_REGISTRO 
 FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA`
;


-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/POLIZA/POLIZA-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT 
 NUMERO_POLIZA
,FECHA_EMISION
,ID_PRODUCTO
,ID_GRUPO_PRODUCTO
,FRECUENCIA_EMISION
,PRIMA_NETA_ANUAL_PEN
,ESTADO
,ID_PERSONA
---FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA`
-- from `iter-data-storage-pv-uat.goldenrecord_data.POLIZA`
FROM `iter-data-storage-pv-uat.temp.TMP_POLIZA_UNIVERSO_GCP`
;


DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_POLIZA_UNIVERSO_GCP` ;
