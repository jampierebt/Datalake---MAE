CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_inputfiles_siniestro_proveedor()
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

CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.inputfiles.SINIESTRO_PROVEEDOR_landing`
(
PERIODO                   STRING
,NOMBRE_PROVEEDOR         STRING
,RUC                      STRING
,DEBITO_LOCAL             STRING
,CREDITO_LOCAL            STRING
,MONTO                    STRING
,TIPO_DOCUMENTO           STRING
,NUMERO_FACTURA           STRING
,MEMO                     STRING
,NUMERO_POLIZA            STRING
,NUMERO_SINIESTRO         STRING
,CLASE                    STRING
,TIPO                     STRING
,CANAL                    STRING
,AGENCIA                  STRING

)OPTIONS(
    format=CSV,
    URIS=["gs://uat-interseguro-normativo-ifrs17-actuals/SINIESTROS/PROVEEDOR/*.csv"],
    field_delimiter=';',
    skip_leading_rows=1,
    max_bad_records = 1
);
-- ----------------------------------------------------------------------
-- Paso A10:
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.inputfiles.TMP_SINIESTRO_PROVEEDOR`
AS
SELECT 
PERIODO
,NOMBRE_PROVEEDOR
,RUC
,SAFE_CAST(DEBITO_LOCAL AS FLOAT64) AS DEBITO_LOCAL
,SAFE_CAST(CREDITO_LOCAL AS FLOAT64) AS CREDITO_LOCAL
,SAFE_CAST(REPLACE(MONTO,',','') AS FLOAT64) AS MONTO
,TIPO_DOCUMENTO
,NUMERO_FACTURA
,MEMO
,NUMERO_POLIZA
,NUMERO_SINIESTRO
,CLASE
,TIPO
,CANAL
,AGENCIA
,CURRENT_DATETIME("America/Lima") AS FECHA_PROCESO
FROM `iter-data-storage-pv-uat.inputfiles.SINIESTRO_PROVEEDOR_landing`
WHERE PERIODO IS NOT NULL
;
-- ----------------------------------------------------------------------
-- Insert
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.inputfiles.SINIESTRO_PROVEEDOR`
(
PERIODO                   
,NOMBRE_PROVEEDOR         
,RUC                      
,DEBITO_LOCAL             
,CREDITO_LOCAL            
,MONTO                    
,TIPO_DOCUMENTO           
,NUMERO_FACTURA           
,MEMO                     
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
,NOMBRE_PROVEEDOR         
,RUC                      
,DEBITO_LOCAL             
,CREDITO_LOCAL            
,MONTO                    
,TIPO_DOCUMENTO           
,NUMERO_FACTURA           
,MEMO                     
,NUMERO_POLIZA            
,NUMERO_SINIESTRO         
,CLASE                    
,TIPO                     
,CANAL                    
,AGENCIA                            
,FECHA_PROCESO
FROM `iter-data-storage-pv-uat.inputfiles.TMP_SINIESTRO_PROVEEDOR` A 
WHERE NOT EXISTS ( SELECT PERIODO FROM `iter-data-storage-pv-uat.inputfiles.SINIESTRO_PROVEEDOR` B
                   WHERE A.PERIODO = B.PERIODO);


-- ----------------------------------------------------------------------
-- Paso A10: Eliminar la Temporal
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TMP_SINIESTRO_PROVEEDOR`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.SINIESTRO_PROVEEDOR_landing`;

END;