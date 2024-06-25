-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/EXT_FLEX_RPT_FLEXDETALLE/EXT_FLEX_RPT_FLEXDETALLE-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT
  NUM_POLIZA
,FEC_PERIODO_MIN
,FEC_PERIODO_MAX
,VAL_CUENTA_CAM_FIN
,VAL_CUENTA_CAM
,VAL_CUENTA_CAV
,VAL_CUENTA_CAV_FIN
,VAL_COSTO_SEGURO_CAM
,VAL_COSTO_ADM_CAM
,VAL_COSTO_ADM_CAV
,VAL_CARGO_RETIRO_CAM
,VAL_CARGO_RETIRO_CAV
,VAL_TRASPASO_CAV_CAM
,VAL_TRASPASO_CAV_CAV
,VAL_PRIMA_MINIMA_PAGADA_CAM
,VAL_PRIMA_EXCESO_PAGADA_CAV
,VAL_RESCATES_CAM
,VAL_RESCATES_CAV
,VAL_INTERESES_CAM
,VAL_INTERESES_CAV
,FONDO_CAM
,FONDO_CAV
,VAL_COSTOS_CAV
,VAL_CARGOS_RESCATE_CPFF
,VAL_CARGOS_RESCATE_CAVFF
,CARGORESCATEDISP
,CP_INTPRES
,SALDOPRESTAMO
FROM iter-data-storage-pv-uat.acsele_data.EXT_FLEX_RPT_FLEXDETALLE_raw 
;

