CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_inputfiles_reaseguro_desgravamen()
OPTIONS(
  strict_mode=true)
BEGIN

 /********************************************************************
* Proyecto      : IFRS17 - ACTUALS
* Fecha         : 23 / 11 / 2023
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

CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.inputfiles.REASEGURO_DESGRAVAMEN_landing`
(
ID                                                                                 STRING 
,PERIODO                                                                           STRING 
,FECHAINICIOVIGENCIA                                                               STRING 
,IDOPERACION                                                                       STRING 
,MONEDAPOLIZA                                                                      STRING 
,RAMO                                                                              STRING 
,SUBRAMO                                                                           STRING 
,PRODUCTO                                                                          STRING 
,FEC_EMI_ACSELE                                                                    STRING 
,NUMEROPLAN                                                                        STRING 
,IDPRODUCTO                                                                        STRING 
,PRIMANETAPOLIZA                                                                   STRING 
,PRIMAPOLIZA                                                                       STRING 
,NUMEROPOLIZA                                                                      STRING 
,FRECUENCIAPAGO                                                                    STRING 
,CANAL                                                                             STRING 
,CODCANAL                                                                          STRING 
,PLAN                                                                              STRING 
,CODIGOCOBERTURA                                                                   STRING 
,NUMEROCONTRATO                                                                    STRING 
,ASEGURADO                                                                         STRING 
,FECHANACIMIENTO                                                                   STRING 
,PRIMAREASEGURO                                                                    STRING 
,ASEGENTRAMA                                                                       STRING 
,ACTIVIDAD                                                                         STRING 
,SUBACTIVIDAD                                                                      STRING 
,REMUNERACIONASEGURADA                                                             STRING 
,RETENCION                                                                         STRING 
,INICIOVIGENCIAOPM                                                                 STRING 
,FINVIGENCIAOPM                                                                    STRING 
,DESCUENTOREASEGURO                                                                STRING 
,IMPUESTOREASEGURO                                                                 STRING 
,ESTADOOPMREASEGURO                                                                STRING 
,CERTIFICADO                                                                       STRING 
,MONEDAOPENITEMREASEGURO                                                           STRING 
,EDADACTUARIAL                                                                     STRING 
,REASEGURADOR                                                                      STRING 
,SALDOINSOLUTO                                                                     STRING 
,MONTOPRESTAMO                                                                     STRING 
,PORC_CESION                                                                       STRING 
,TIPO_CAMBIO                                                                       STRING 
,TIPO_CAMBIO2                                                                      STRING 
,DTY_DESCRIPTION                                                                   STRING 
,SOBREPRIMA                                                                        STRING 
,EXTRAPRIMA_EX                                                                     STRING 
,TASARIESGO                                                                        STRING 
,TASAREASEGURO                                                                     STRING 
,TIPO_SEGURO                                                                       STRING 
,CAP_CEDIDO                                                                        STRING 
,TIME_STAMP                                                                        STRING 
,TIPO_CAMBIO3                                                                      STRING 
,OPENITEMID                                                                        STRING 
,PAGADOHASTA                                                                       STRING 
--,PRIMA_CEDIDA_TASA_REASEGURO                                                       STRING 
--,PRIMA_TOTAL_CEDIDA_US                                                             STRING 
--,PRIMA_CEDIDA_TASA_REASEGURADOR_US                                                 STRING 

)OPTIONS(
    format=CSV,
    URIS=["gs://interseguro-normativo-ifrs17-actuals/REASEGURO_DESGRAVAMEN/*.csv"],
    field_delimiter=';',
    skip_leading_rows=1,
    max_bad_records = 1
);
-- ----------------------------------------------------------------------
-- Paso A10:
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.inputfiles.TMP_REASEGURO_DESGRAVAMEN`
AS
SELECT 
PERIODO
,NUMEROPOLIZA AS NUMERO_POLIZA
,REASEGURADOR AS REASEGURADORA
FROM `iter-data-storage-pv-uat.inputfiles.REASEGURO_DESGRAVAMEN_landing`
WHERE PERIODO IS NOT NULL
;
-- ----------------------------------------------------------------------
-- Insert
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.inputfiles.REASEGURO_DESGRAVAMEN`
(
PERIODO
,NUMERO_POLIZA
,REASEGURADORA
)
SELECT 
PERIODO
,NUMERO_POLIZA
,REASEGURADORA
FROM `iter-data-storage-pv-uat.inputfiles.TMP_REASEGURO_DESGRAVAMEN` A 
WHERE NOT EXISTS ( SELECT PERIODO FROM `iter-data-storage-pv-uat.inputfiles.REASEGURO_DESGRAVAMEN` B
                   WHERE A.PERIODO = B.PERIODO);


-- ----------------------------------------------------------------------
-- Paso A10: Eliminar la Temporal
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.REASEGURO_DESGRAVAMEN_landing`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TMP_REASEGURO_DESGRAVAMEN`;

END;