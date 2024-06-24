-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/EXT_FLEX_FONDOS_INI/EXT_FLEX_FONDOS_INI-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT IDPOLIZA
, IDOPERACION
, IDOBJETOASEGURADO
, PERIODO
, TIPOFONDOCAV
, TIPOFONDOCP
, CAV_PRIMAEXCESOPAGADA
, CAV_COSTOADMINISTRATIVO
, CAV_RESCATE
, CAV_TRASPASO
, CAV_INTERES
, CAV_COMPRAUNIDADES
, CAV_VENTAUNIDADES
, CAV_CUENTA
, CP_PRIMAMINIMAPAGADA
, CP_COSTOSEGURO
, CP_COSTOADMINISTRATIVO
, CP_RESCATE
, CP_TRASPASO
, CP_INTERES
, CP_COMPRAUNIDADES
, CP_VENTAUNIDADES
, CP_CUENTA
, DATEOPERATION
, CP_CARGORESCATE
, APORTENOREG
, INTPRESFONDOS
FROM interseguro-data.acsele_data.EXT_FLEX_FONDOS_INI_raw
;
