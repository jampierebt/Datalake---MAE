CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_inputfiles_siniestro_beneficiario()
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

CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.inputfiles.SINIESTRO_BENEFICIARIO_landing`
(
PERIODO                       STRING
,NOMBRE_BENEFICIARIO          STRING
,MONTO                        STRING
,INCIDENTE_ULTIMUS            STRING
,CORRELATIVO                  STRING
,NUMERO_POLIZA                STRING
,NUMERO_SINIESTRO             STRING
,CLASE                        STRING
,TIPO                         STRING
,CANAL                        STRING
,AGENCIA                      STRING
)OPTIONS(
    format=CSV,
    URIS=["gs://interseguro-normativo-ifrs17-actuals/SINIESTROS/BENEFICIARIO/*.csv"],
    field_delimiter=';',
    skip_leading_rows=1,
    max_bad_records = 1
);
-- ----------------------------------------------------------------------
-- Paso A10:
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.inputfiles.TMP_SINIESTRO_BENEFICIARIO`
AS
SELECT 
PERIODO
,NOMBRE_BENEFICIARIO
,SAFE_CAST(REPLACE(MONTO,',','') AS FLOAT64) AS MONTO
,INCIDENTE_ULTIMUS
,CORRELATIVO
,NUMERO_POLIZA
,NUMERO_SINIESTRO
,CLASE
,TIPO
,CANAL
,AGENCIA
,CURRENT_DATETIME("America/Lima") AS FECHA_PROCESO
FROM `iter-data-storage-pv-uat.inputfiles.SINIESTRO_BENEFICIARIO_landing`
WHERE PERIODO IS NOT NULL
;
-- ----------------------------------------------------------------------
-- Insert
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.inputfiles.SINIESTRO_BENEFICIARIO`
(
PERIODO
,NOMBRE_BENEFICIARIO
,MONTO
,INCIDENTE_ULTIMUS
,CORRELATIVO
,NUMERO_POLIZA
,NUMERO_SINIESTRO
,CLASE
,TIPO
,CANAL
,AGENCIA                
,FECHA_PROCESO
)
SELECT 
PERIODO
,NOMBRE_BENEFICIARIO
,MONTO
,INCIDENTE_ULTIMUS
,CORRELATIVO
,NUMERO_POLIZA
,NUMERO_SINIESTRO
,CLASE
,TIPO
,CANAL
,AGENCIA              
,FECHA_PROCESO
FROM `iter-data-storage-pv-uat.inputfiles.TMP_SINIESTRO_BENEFICIARIO` A 
WHERE NOT EXISTS ( SELECT PERIODO FROM `iter-data-storage-pv-uat.inputfiles.SINIESTRO_BENEFICIARIO` B
                   WHERE A.PERIODO = B.PERIODO);


-- ----------------------------------------------------------------------
-- Paso A10: Eliminar la Temporal
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TMP_SINIESTRO_BENEFICIARIO`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.SINIESTRO_BENEFICIARIO_landing`;

END;