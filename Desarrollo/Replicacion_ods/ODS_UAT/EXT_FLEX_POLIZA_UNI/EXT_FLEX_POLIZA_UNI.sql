-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/EXT_FLEX_POLIZA_UNI/EXT_FLEX_POLIZA_UNI-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT FECHA_INI
, FECHA_FIN
, IDPOLIZA
, IDOPERACION
, NUMEROPOLIZA
, MONEDA
, FECHA_EMISION
, FRECUENCIAPAGO
, EMAILPOLIZA
, INICIOVIGENCIA
, IDPRODUCTO
, PRODUCTO
, TIME_STAMP
, DCOID
, PRIMAMINIMA
, INDENVPOLELECT
, PLANVIDA
, PERIODOPAGOPRIMA
, AGENTE
, FINISHDATE
FROM iter-data-storage-pv-uat.acsele_data.EXT_FLEX_POLIZA_UNI_raw 
;
