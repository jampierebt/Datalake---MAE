

-- ------------------------------------------------------------------------------------
-- Paso 1:Crear tabla temporal
-- ------------------------------------------------------------------------------------
CREATE OR REPLACE TABLE `interseguro-data.temp.POLIZA_SOAT`
AS
SELECT DISTINCT 
PS.NUMERO_POLIZA,
RPRIMASOATINPUT AS PRIMA_BRUTA,
PS.FECHA_VENTA,
cast(PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S',PS.AUDITDATE_SYSTEM_DATE) as date)  AS FECHA_REGISTRO,
POL.FECHA_CANCELACION,
CODIGO_CANAL,
CODAGENTIENOFIINPUT CODIGO_AGENCIA,
CODIGO_CLASE,
CODIGO_USO ,
pol.estado,
C.ID_PLANILLA
fROM `interseguro-data.acsele_data.TD_OPERACION_SOAT_raw` ps
inner join `interseguro-data.goldenrecord_data.POLIZA` POL on PS.NUMERO_POLIZA = POL.NUMERO_POLIZA
LEFT join`interseguro-data.samp_data.COMPROBANTE_raw` C on C.NUM_POLIZA = CAST(replace(REPLACE(POL.NUMERO_POLIZA,'R',''),'_','') AS NUMERIC)
LEFT join `interseguro-data.samp_data.PLANILLA_raw`  PAL on C.ID_PLANILLA=PAL.ID_PLANILLA
where cast(RPRIMASOATINPUT as float64) > 0
AND NOMBRE_GRUPO_PRODUCTO='SOAT'
AND PS.STATUS_OPERATION='Applied operation'
and c.COD_RAMO='6'
AND C.COD_TIPO_COMPROBANTE IN ('FAC','B/V')
AND C.COD_ESTADO        <>'3'
and cast(PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S',PS.AUDITDATE_SYSTEM_DATE) as date) >='2020-01-01'
--and POL.NUMERO_POLIZA='0592679525'
AND  PAL.origen_recaudacion = 32 
;

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/POLIZA_SOAT/POLIZA_SOAT-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
 select DISTINCT
 NUMERO_POLIZA,
PRIMA_BRUTA,
FECHA_VENTA,
FECHA_REGISTRO,
FECHA_CANCELACION,
CODIGO_CANAL,
CODIGO_AGENCIA,
CODIGO_CLASE,
CODIGO_USO,
estado,
ID_PLANILLA
  From `interseguro-data.temp.POLIZA_SOAT`;
