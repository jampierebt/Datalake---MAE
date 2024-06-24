-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/EXT_FLEX_RPT_POLIZAFLEXRANGO/EXT_FLEX_RPT_POLIZAFLEXRANGO-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  FECHA_INI
,FECHA_FIN
,IDPOLIZA
,IDOPERACION
,NUMEROPOLIZA
,FEC_INICIO_VIGENCIA
,GLS_PERSONA
,GLS_PERSONA_POLIZA
,GLS_PLAN
,NOM_VENDEDOR
,PRIMA_PROGRAMADA
,PERIODO_PAGO
,MOD_INVERSION_CP
,MOD_INVERSION_CAV
,SIM_MONEDA
,GLS_DIRECCION
,GLS_COMUNA
,GLS_CIUDAD
,VAL_CARGO_RETIRO_CP_ACTUAL
,VAL_CARGO_RETIRO_CAV_ACTUAL
,VAL_SALDO_CP_ACTUAL
,VAL_SALDO_CAV_ACTUAL
,FEC_PAGADO_HASTA
,CORREO
,FEC_FIN_VIGENCIA
,RENTABILIDAD_1
,RENTABILIDAD_3
,RENTABILIDAD_5
,RENTABILIDAD_10
,RENTABILIDAD_DETALLE
FROM iter-data-storage-pv-uat.acsele_data.EXT_FLEX_RPT_POLIZAFLEXRANGO_raw 
;

