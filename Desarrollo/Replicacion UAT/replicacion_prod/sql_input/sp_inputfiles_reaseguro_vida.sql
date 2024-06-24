CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_inputfiles_reaseguro_vida()
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
CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.inputfiles.REASEGURO_VIDA_landing`
(
ID                                          STRING 
,FECHAREASEGURO                             STRING 
,ANIO                                       STRING 
,MES                                        STRING 
,NUMEROPOLIZA                               STRING 
,MONEDA                                     STRING 
,IDRAMO                                     STRING 
,IDSUBRAMO                                  STRING 
,RAMO                                       STRING 
,SUBRAMO                                    STRING 
,IDPRODUCTO                                 STRING 
,PRODUCTO                                   STRING 
,IDPLAN                                     STRING 
,PLAN                                       STRING 
,OPCION                                     STRING 
,IDCANALVENTA                               STRING 
,CANALVENTA                                 STRING 
,FECHAEMISION                               STRING 
,FECHACOTIZACION                            STRING 
,ESTADO                                     STRING 
,EVENTO                                     STRING 
,MESESVIGENCIA                              STRING 
,FRECUENCIAPAGO                             STRING 
,PERIODOCOBERTURA                           STRING 
,COBERTURA_CODIGO                           STRING 
,COBERTURA_TIPO                             STRING 
,COBERTURA                                  STRING 
,COBERTURA_PRIMANETA                        STRING 
,COBERTURA_CAPITALASEGURADO                 STRING 
,NUMORDENCOBERTURA                          STRING 
,ASEGURADO_TIPO                             STRING 
,ASEGURADO_DOCUMENTO                        STRING 
,ASEGURADO_SEXO                             STRING 
,ASEGURADO_FUMADOR                          STRING 
,ASEGURADO_FECHANACIMIENTO                  STRING 
,ASEGURADO_EDADACTUARIAL                    STRING 
,MONTORIESGO                                STRING 
,INDCUOTAPARTE                              STRING 
,INDCESIONFACULTATIVO                       STRING 
,INDCUMULO                                  STRING 
,CAPITALRETENIDO                            STRING 
,RETENCION                                  STRING 
,CAPITALCUOTAPARTE                          STRING 
,CAPITALPRIMEREXCEDENTE                     STRING 
,CAPITALFACULTATIVO                         STRING 
,TASAREASEGURO                              STRING 
,FACTORTASAREASEGURO                        STRING 
,TASADESCUENTO                              STRING 
,TASAEXTRAPRIMA100                          STRING 
,TASAEXTRAPRIMA1000                         STRING 
,TASASOBREPRIMA100                          STRING 
,TASASOBREPRIMA1000                         STRING 
,TASADESCUENTOSOBREPRIMA                    STRING 
,TASADESCUENTOEXTRAPRIMA                    STRING 
,PRIMACUOTAPARTE                            STRING 
,PRIMAPRIMEREXCEDENTE                       STRING 
,PRIMAFACULTATIVO                           STRING 
,CONTRATOREASEGURO                          STRING 
,REASEGURADORA                              STRING 
,FECHAINICIORECARGO                         STRING 
,SALDOCP                                    STRING 
,PAGADOHASTA                                STRING 
,RESERVAMATEMATICA                          STRING 
,INICIOOPENITEMPAGO                         STRING 
,FINOPENITEMPAGO                            STRING 
,IDPOLIZA                                   STRING 
,IDOPERACION                                STRING 
,IDCOBERTURAPOLIZA                          STRING 
,IDOPERACIONCOB                             STRING 
,FECHAPROCESO                               STRING 
,TIPOCAMBIO                                 STRING 
,CUOTAPARTE_REASEG                          STRING 
,PRIMEREXCEDENTE_REASEG                     STRING 
,FACULTATIVO_REASEG                         STRING 
)OPTIONS(
    format=CSV,
    URIS=["gs://interseguro-normativo-ifrs17-actuals/REASEGURO_VIDA/*.csv"],
    field_delimiter=';',
    skip_leading_rows=1,
    max_bad_records = 1
);

-- ----------------------------------------------------------------------
-- Paso A10:
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.inputfiles.TMP_REASEGURO_VIDA`
AS
SELECT 
CONCAT(ANIO,LPAD(MES,2,'0')) AS PERIODO
,NUMEROPOLIZA AS NUMERO_POLIZA
,REASEGURADORA
FROM `iter-data-storage-pv-uat.inputfiles.REASEGURO_VIDA_landing`
WHERE CONCAT(ANIO,MES)  IS NOT NULL;

-- ----------------------------------------------------------------------
-- Insert
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.inputfiles.REASEGURO_VIDA`
(
PERIODO
,NUMERO_POLIZA
,REASEGURADORA
)
SELECT 
PERIODO
,NUMERO_POLIZA
,REASEGURADORA
FROM `iter-data-storage-pv-uat.inputfiles.TMP_REASEGURO_VIDA` A 
WHERE NOT EXISTS ( SELECT PERIODO FROM `iter-data-storage-pv-uat.inputfiles.REASEGURO_VIDA` B
                   WHERE A.PERIODO = B.PERIODO);

-- ----------------------------------------------------------------------
-- Drop
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.REASEGURO_VIDA_landing`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TMP_REASEGURO_VIDA`;

END;