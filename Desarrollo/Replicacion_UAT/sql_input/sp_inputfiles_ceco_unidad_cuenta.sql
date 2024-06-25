CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_inputfiles_ceco_unidad_cuenta()
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

CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.inputfiles.CECO_UNIDAD_CUENTA_landing`
(
DESCRIPCION_CENTRO_COSTO       STRING
,NOMBRE_PRODUCTO               STRING
,IND_ANIADA                    STRING
,DESCRIPCION_DISTRIBUCION      STRING
,IFRS_GRP                      STRING
,ANIADA                        STRING
,DESCRIPCION_UOA               STRING
,MONEDA                        STRING
,CLASIFICACION                 STRING
,ONEROSIDAD                    STRING
)OPTIONS(
    format=CSV,
    URIS=["gs://uat-interseguro-normativo-ifrs17-actuals/CECO_UNIDAD_CUENTA/CECO_UNIDAD_CUENTA_*.csv"],
    field_delimiter=';',
    skip_leading_rows=1,
    max_bad_records = 1
);
-- ----------------------------------------------------------------------
-- Paso A10:
-- ----------------------------------------------------------------------

CREATE OR REPLACE TABLE`iter-data-storage-pv-uat.inputfiles.TMP_CECO_UNIDAD_CUENTA` 
AS
SELECT
DESCRIPCION_CENTRO_COSTO   
,NOMBRE_PRODUCTO    
,IND_ANIADA                    
,DESCRIPCION_DISTRIBUCION      
,IFRS_GRP                      
,ANIADA                        
,DESCRIPCION_UOA    
,MONEDA           
,CLASIFICACION                 
,ONEROSIDAD    
,CURRENT_DATETIME("America/Lima") AS FECHA_PROCESO                      
FROM `iter-data-storage-pv-uat.inputfiles.CECO_UNIDAD_CUENTA_landing`
WHERE DESCRIPCION_CENTRO_COSTO IS NOT NULL
--WHERE CATEGORIA IS NOT NULL
;

-- ----------------------------------------------------------------------
-- Delete
-- ----------------------------------------------------------------------

TRUNCATE TABLE `iter-data-storage-pv-uat.inputfiles.CECO_UNIDAD_CUENTA`;

-- ----------------------------------------------------------------------
-- Insert
-- ----------------------------------------------------------------------

INSERT INTO `iter-data-storage-pv-uat.inputfiles.CECO_UNIDAD_CUENTA`
(
DESCRIPCION_CENTRO_COSTO       
,NOMBRE_PRODUCTO
,IND_ANIADA                    
,DESCRIPCION_DISTRIBUCION      
,IFRS_GRP                      
,ANIADA                        
,DESCRIPCION_UOA
,MONEDA               
,CLASIFICACION                 
,ONEROSIDAD                    
,FECHA_PROCESO     
)
SELECT
DESCRIPCION_CENTRO_COSTO     
,NOMBRE_PRODUCTO  
,IND_ANIADA                    
,DESCRIPCION_DISTRIBUCION      
,IFRS_GRP                      
,ANIADA                        
,DESCRIPCION_UOA   
,MONEDA            
,CLASIFICACION                 
,ONEROSIDAD                    
,FECHA_PROCESO
FROM  `iter-data-storage-pv-uat.inputfiles.TMP_CECO_UNIDAD_CUENTA`;

-- ----------------------------------------------------------------------
-- Drop
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TMP_PRODUCTO_UNIDAD_CUENTA` ;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.PRODUCTO_UNIDAD_CUENTA_landing`;

END;