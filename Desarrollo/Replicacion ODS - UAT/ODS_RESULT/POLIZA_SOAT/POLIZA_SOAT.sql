CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.POLIZA_SOAT_TMP`
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
fROM `iter-data-storage-pv-uat.acsele_data.TD_OPERACION_SOAT_raw` ps
inner join `iter-data-storage-pv-uat.goldenrecord_data.POLIZA` POL on PS.NUMERO_POLIZA = POL.NUMERO_POLIZA
LEFT join`iter-data-storage-pv-uat.samp_data.COMPROBANTE_raw` C on C.NUM_POLIZA = CAST(replace(REPLACE(POL.NUMERO_POLIZA,'R',''),'_','') AS NUMERIC)
LEFT join `iter-data-storage-pv-uat.samp_data.PLANILLA_raw`  PAL on C.ID_PLANILLA=PAL.ID_PLANILLA
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



CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.POLIZA_SOAT`
AS
SELECT DISTINCT 
pd.NUMERO_POLIZA,
PRIMA_BRUTA,
FECHA_VENTA,
FECHA_REGISTRO,
FECHA_CANCELACION,
CODIGO_CANAL,
CODIGO_AGENCIA,
CODIGO_CLASE,
CODIGO_USO,
pf.ESTADO_POLIZA estado,
ID_PLANILLA
 from `iter-data-storage-pv-uat.temp.POLIZA_SOAT_TMP` pd
left join `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION` pf on pd.NUMERO_POLIZA=pf.NUMERO_POLIZA
---where pd.NUMERO_POLIZA IN (SELECT NUMERO_POLIZA FROM `iter-data-storage-pv-uat.campanias.SOAT_COMISION_CAMBIO`)
WHERE pf.ESTADO_OPERACION='Applied operation'
QUALIFY(ROW_NUMBER()OVER(PARTITION BY pf.NUMERO_POLIZA ORDER BY  pf.FECHA_HORA_OPERACION DESC,  pf.FECHA_OPERACION_REG_SISTEMA DESC )) = 1;


-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/DEV/ODS/POLIZA_SOAT/POLIZA_SOAT-*.csv.gz',
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
  From `iter-data-storage-pv-uat.temp.POLIZA_SOAT`;


 
