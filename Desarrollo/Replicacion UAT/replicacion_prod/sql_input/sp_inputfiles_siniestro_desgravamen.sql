CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_inputfiles_siniestro_desgravamen()
OPTIONS(
  strict_mode=true)
BEGIN

 /********************************************************************
* Proyecto      : IFRS17 - ACTUALS
* Fecha         : 15 / 12 / 2023
* Autor         : Jampiere Berrio         
* Descripción   :    
* Ejecuciòn     :  
*********************************************************************
*                       MODIFICACIONES POSTERIORES                  *
*===================================================================*
*=  Fecha   | Persona |           Modificación Realizada           =*
*===================================================================*/

-- ----------------------------------------------------------------------
-- Paso A10: Temporal con Universo
-- ----------------------------------------------------------------------

CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.inputfiles.SINIESTRO_DESGRAVAMEN_landing`
(
PERIODO                               STRING
--,TIPO_PAGO                            STRING
,NUMERO_SINIESTRO                     STRING
,MONEDA                               STRING
,MONTO                                STRING
,NOMBRE_PRODUCTO                      STRING
,NOMBRE_ASEGURADO                     STRING
,GLS_COBERTURA                        STRING
,NUMERO_CERTIFICADO                   STRING
,FECHA_OCURRENCIA_SINIESTRO           STRING
,ANIO                                 STRING
,NUMERO_POLIZA                        STRING
,FECHA_INICIO_VIGENCIA                STRING
,FECHA_REPORTE_CIA                    STRING
,CECO                                 STRING
,SCOR                                 STRING
,MUNICH                               STRING
,GEN_RE                               STRING
,HANNOVER                             STRING
,NAVIGATORS                           STRING
,RGA                                  STRING
,MONTO_TIPO_CAMBIO                    STRING

)OPTIONS(
    format=CSV,
    URIS=["gs://interseguro-normativo-ifrs17-actuals/SINIESTROS/DESGRAVAMEN/*.csv"],
    field_delimiter=';',
    skip_leading_rows=1,
    max_bad_records = 1
);
-- ----------------------------------------------------------------------
-- Paso A10:
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.inputfiles.TMP_SINIESTRO_DESGRAVAMEN`
AS
SELECT 
PERIODO
,CAST(NULL AS STRING) AS TIPO_PAGO
,NUMERO_SINIESTRO
,UPPER(MONEDA) AS MONEDA
,SAFE_CAST(REPLACE(MONTO,',','') AS FLOAT64) AS MONTO
,UPPER(NOMBRE_PRODUCTO) AS NOMBRE_PRODUCTO
,UPPER(NOMBRE_ASEGURADO) AS NOMBRE_ASEGURADO
,UPPER(GLS_COBERTURA) AS GLS_COBERTURA
,NUMERO_CERTIFICADO
,SAFE.PARSE_DATE("%d/%m/%Y",FECHA_OCURRENCIA_SINIESTRO) AS FECHA_OCURRENCIA_SINIESTRO
,ANIO
,NUMERO_POLIZA
,SAFE.PARSE_DATE("%d/%m/%Y",FECHA_INICIO_VIGENCIA) AS FECHA_INICIO_VIGENCIA
,SAFE.PARSE_DATE("%d/%m/%Y",FECHA_REPORTE_CIA) AS FECHA_REPORTE_CIA
,CECO
,SCOR
,MUNICH
,GEN_RE
,HANNOVER
,NAVIGATORS
,RGA
,MONTO_TIPO_CAMBIO
,CURRENT_DATETIME("America/Lima") AS FECHA_PROCESO
FROM `iter-data-storage-pv-uat.inputfiles.SINIESTRO_DESGRAVAMEN_landing`
WHERE PERIODO IS NOT NULL
;
-- ----------------------------------------------------------------------
-- Insert
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.inputfiles.SINIESTRO_DESGRAVAMEN`
(
PERIODO
,TIPO_PAGO
,NUMERO_SINIESTRO
,MONEDA
,MONTO
,NOMBRE_PRODUCTO
,NOMBRE_ASEGURADO
,GLS_COBERTURA
,NUMERO_CERTIFICADO
,FECHA_OCURRENCIA_SINIESTRO
,ANIO
,NUMERO_POLIZA
,FECHA_INICIO_VIGENCIA
,FECHA_REPORTE_CIA
,CECO
,SCOR
,MUNICH
,GEN_RE
,HANNOVER
,NAVIGATORS
,RGA
,MONTO_TIPO_CAMBIO
,FECHA_PROCESO
)
SELECT 
PERIODO
,TIPO_PAGO
,NUMERO_SINIESTRO
,MONEDA
,MONTO
,NOMBRE_PRODUCTO
,NOMBRE_ASEGURADO
,GLS_COBERTURA
,NUMERO_CERTIFICADO
,FECHA_OCURRENCIA_SINIESTRO
,ANIO
,NUMERO_POLIZA
,FECHA_INICIO_VIGENCIA
,FECHA_REPORTE_CIA
,CECO
,SCOR
,MUNICH
,GEN_RE
,HANNOVER
,NAVIGATORS
,RGA
,MONTO_TIPO_CAMBIO
,FECHA_PROCESO
FROM `iter-data-storage-pv-uat.inputfiles.TMP_SINIESTRO_DESGRAVAMEN` A 
WHERE NOT EXISTS ( SELECT PERIODO FROM `iter-data-storage-pv-uat.inputfiles.SINIESTRO_DESGRAVAMEN` B
                   WHERE A.PERIODO = B.PERIODO);


-- ----------------------------------------------------------------------
-- Paso A10: Eliminar la Temporal
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TMP_SINIESTRO_DESGRAVAMEN`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.SINIESTRO_DESGRAVAMEN_landing`;

END;