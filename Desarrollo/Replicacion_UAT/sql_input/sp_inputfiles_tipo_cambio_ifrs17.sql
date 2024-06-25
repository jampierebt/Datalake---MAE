CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_inputfiles_tipo_cambio_ifrs17()
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

CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.inputfiles.TIPO_CAMBIO_IFRS17_landing`
(
PERIODO	                   STRING
,MONTO_TIPO_CAMBIO	       STRING
)OPTIONS(
    format=CSV,
    URIS=["gs://uat-interseguro-normativo-ifrs17-actuals/TIPO_CAMBIO/*.csv"],
    field_delimiter=';',
    skip_leading_rows=1,
    max_bad_records = 1
);
-- ----------------------------------------------------------------------
-- Paso A10:
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.inputfiles.TMP_TIPO_CAMBIO_IFRS17`
AS
SELECT 
CAST(PERIODO AS INT64) AS PERIODO
,CAST(MONTO_TIPO_CAMBIO AS FLOAT64) AS MONTO_TIPO_CAMBIO
FROM `iter-data-storage-pv-uat.inputfiles.TIPO_CAMBIO_IFRS17_landing`
WHERE PERIODO IS NOT NULL
;
-- ----------------------------------------------------------------------
-- Insert
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.inputfiles.TIPO_CAMBIO_IFRS17`
(
PERIODO
,MONTO_TIPO_CAMBIO
)
SELECT 
PERIODO
,MONTO_TIPO_CAMBIO
FROM `iter-data-storage-pv-uat.inputfiles.TMP_TIPO_CAMBIO_IFRS17` A 
WHERE NOT EXISTS ( SELECT PERIODO FROM `iter-data-storage-pv-uat.inputfiles.TIPO_CAMBIO_IFRS17` B
                   WHERE A.PERIODO = B.PERIODO);


-- ----------------------------------------------------------------------
-- Paso A10: Eliminar la Temporal
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TIPO_CAMBIO_IFRS17_landing`;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TMP_TIPO_CAMBIO_IFRS17`;

END;