CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_inputfiles_producto_unidad_cuenta()
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

CREATE OR REPLACE EXTERNAL TABLE `iter-data-storage-pv-uat.inputfiles.PRODUCTO_UNIDAD_CUENTA_landing`
(
ID_PRODUCTO	            STRING
,NOMBRE_PRODUCTO        STRING
,GRUPO_PRODUCTO         STRING
,DETALLE_ADICIONAL      STRING
,IND_ANIADA             STRING
,IND_PEN                STRING
,IND_USD                STRING
,IFRS_GRP	            STRING
,ANIADA	                STRING
,DESCRIPCION_UOA	    STRING
,CLASIFICACION	        STRING
,ONEROSIDAD             STRING
,PORCENTAJE_DISTRIBUCION STRING
)OPTIONS(
    format=CSV,
    URIS=["gs://uat-interseguro-normativo-ifrs17-actuals/PRODUCTO_UNIDAD_CUENTA/PRODUCTO_UNIDAD_CUENTA_*.csv"],
    field_delimiter=';',
    skip_leading_rows=1,
    max_bad_records = 1
);
-- ----------------------------------------------------------------------
-- Paso A10:
-- ----------------------------------------------------------------------

CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.inputfiles.TMP_PRODUCTO_UNIDAD_CUENTA` 
AS
SELECT
ID_PRODUCTO	            
,REPLACE(NOMBRE_PRODUCTO,' ','') AS NOMBRE_PRODUCTO        
,GRUPO_PRODUCTO         
,DETALLE_ADICIONAL      
,IND_ANIADA             
,IF(IND_PEN = 'SI',TRUE,FALSE) AS IND_PEN                
,IF(IND_USD = 'SI',TRUE,FALSE) AS IND_USD                
,IFRS_GRP	            
,ANIADA	                
,DESCRIPCION_UOA	    
,CLASIFICACION	        
,ONEROSIDAD      
,CAST(PORCENTAJE_DISTRIBUCION AS FLOAT64) AS PORCENTAJE_DISTRIBUCION
,CURRENT_DATETIME('America/Lima') AS FECHA_PROCESO
FROM `iter-data-storage-pv-uat.inputfiles.PRODUCTO_UNIDAD_CUENTA_landing`
WHERE NOMBRE_PRODUCTO IS NOT NULL
--WHERE CATEGORIA IS NOT NULL
;

-- ----------------------------------------------------------------------
-- Delete
-- ----------------------------------------------------------------------

TRUNCATE TABLE `iter-data-storage-pv-uat.inputfiles.PRODUCTO_UNIDAD_CUENTA`;

-- ----------------------------------------------------------------------
-- Insert
-- ----------------------------------------------------------------------

INSERT INTO `iter-data-storage-pv-uat.inputfiles.PRODUCTO_UNIDAD_CUENTA`
(
ID_PRODUCTO	            
,NOMBRE_PRODUCTO        
,GRUPO_PRODUCTO         
,DETALLE_ADICIONAL      
,IND_ANIADA             
,IND_PEN                
,IND_USD                
,IFRS_GRP	            
,ANIADA	                
,DESCRIPCION_UOA	    
,CLASIFICACION	        
,ONEROSIDAD 
,PORCENTAJE_DISTRIBUCION  
,FECHA_PROCESO      
)
SELECT
ID_PRODUCTO	            
,NOMBRE_PRODUCTO        
,GRUPO_PRODUCTO         
,DETALLE_ADICIONAL      
,IND_ANIADA             
,IND_PEN                
,IND_USD                
,IFRS_GRP	            
,ANIADA	                
,DESCRIPCION_UOA	    
,CLASIFICACION	        
,ONEROSIDAD    
,PORCENTAJE_DISTRIBUCION  
,FECHA_PROCESO
FROM  `iter-data-storage-pv-uat.inputfiles.TMP_PRODUCTO_UNIDAD_CUENTA` ;

-- ----------------------------------------------------------------------
-- Drop
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.TMP_PRODUCTO_UNIDAD_CUENTA` ;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.inputfiles.PRODUCTO_UNIDAD_CUENTA_landing`;

END;