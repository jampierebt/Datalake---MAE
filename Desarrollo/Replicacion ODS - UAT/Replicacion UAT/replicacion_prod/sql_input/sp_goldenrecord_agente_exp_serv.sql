CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_goldenrecord_agente_exp_serv()
OPTIONS(
  strict_mode=true)
BEGIN
/********************************************************************
* Proyecto		    : GOLDEN RECORD
* Fecha			    : 03 / 05 / 2022
* Autor			    : Geraldidne Jayo                               
* Descripción       : Migración de pólizas  (agente)            
*********************************************************************
*                       MODIFICACIONES POSTERIORES                  *
*===================================================================*
*=  Fecha   | Persona |           Modificación Realizada           =*
*===================================================================*
* 
*********************************************************************/
-- ----------------------------------------------------------------------
-- Paso A10: TABLA AGENTE --> REVISAR
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.AGENTE_EXP_SERV` 
AS
SELECT 
    P.NUMERO_POLIZA,
    P.ID_PRODUCTO,
    TRIM(R.cod_oficina_inicial) AS COD_AGENCIA_INICIAL,	
    TRIM(CAST(R.num_vendedor_inicial AS STRING)) AS COD_AGENTE_INICIAL,
    CAST(NULL AS STRING) AS CORREO_AGENTE_INICIAL,
    '' AS NOMBRE_AGENTE_INICIAL,
    COALESCE(TRIM(EC.COD_AGENCIA),TRIM(CAST(R.cod_oficina_mantencion AS STRING))) 
    AS COD_AGENCIA_FINAL,
    COALESCE(TRIM(CAST(EC.COD_AGENTE AS STRING)),TRIM(CAST(R.num_vendedor_mantencion AS STRING))) AS COD_AGENTE_FINAL,
    EC.NOM_AGENTE AS NOMBRE_AGENTE_FINAL,
    EC.GLS_CORREO_AGENTE  AS CORREO_AGENTE_FINAL,
    CAST(NULL AS STRING)  AS CELULAR_AGENTE_FINAL,
    EC.CATEGORIA  AS CARGO_AGENTE_FINAL,
    EC.NOM_SUPERVIS  AS SUPERVISOR_AGENTE_FINAL,
    EC.NOM_JEFE  AS JEFE_AGENTE_FINAL,
    CAST(NULL AS STRING)  AS NOMBRE_AGENTE_DEFINITIVO,
    CAST(NULL AS STRING)  AS CORREO_AGENTE_DEFINITIVO,
    EC.CODIGO_SUPERVISOR AS COD_SUPERVISOR_AGENTE_FINAL,
    --CAST(CURRENT_DATE AS TIMESTAMP) AS FECHA_ACTUALIZACION,
    P.NOMBRE_PRODUCTO,
    EC.NOMBRE_AGENCIA 
    AS NOMBRE_AGENCIA_FINAL
FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA` P 
INNER JOIN `iter-data-storage-pv-uat.raw_vesta_exp_serv.POLIZA_raw` R ON TRIM(P.NUMERO_POLIZA)=TRIM(cast(R.num_poliza as string))
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.ESTRUCTURA_COMERCIAL_HST` EC ON CAST(EC.COD_AGENTE AS STRING)=TRIM(CAST(R.num_vendedor_mantencion AS STRING))
WHERE P.ID_FUENTE='80' 
AND EC.COD_AGENCIA IS NOT NULL
AND R.cod_causal_estado_poliza <>'26'
;

DELETE FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE` A
      WHERE EXISTS (
        SELECT 1 
         FROM `iter-data-storage-pv-uat.temp.AGENTE_EXP_SERV`  B 
         WHERE A.NUMERO_POLIZA   =B.NUMERO_POLIZA
);

INSERT INTO `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE`
(
    NUMERO_POLIZA	
    ,ID_PRODUCTO	
    ,COD_AGENCIA_INICIAL	
    ,COD_AGENTE_INICIAL	
    ,CORREO_AGENTE_INICIAL	
    ,NOMBRE_AGENTE_INICIAL	
    ,COD_AGENCIA_FINAL	
    ,COD_AGENTE_FINAL	
    ,NOMBRE_AGENTE_FINAL	
    ,CORREO_AGENTE_FINAL	
    ,CELULAR_AGENTE_FINAL	
    ,CARGO_AGENTE_FINAL	
    ,SUPERVISOR_AGENTE_FINAL	
    ,JEFE_AGENTE_FINAL	
    ,NOMBRE_AGENTE_DEFINITIVO	
    ,CORREO_AGENTE_DEFINITIVO	
    --,FECHA_ACTUALIZACION	
    ,COD_SUPERVISOR_AGENTE_FINAL
    ,NOMBRE_PRODUCTO	
    ,NOMBRE_AGENCIA_FINAL	
) SELECT 
    A2.NUMERO_POLIZA	
    ,A2.ID_PRODUCTO	
    ,A2.COD_AGENCIA_INICIAL	
    ,A2.COD_AGENTE_INICIAL	
    ,A2.CORREO_AGENTE_INICIAL	
    ,A2.NOMBRE_AGENTE_INICIAL	
    ,A2.COD_AGENCIA_FINAL	
    ,A2.COD_AGENTE_FINAL	
    ,A2.NOMBRE_AGENTE_FINAL	
    ,A2.CORREO_AGENTE_FINAL	
    ,A2.CELULAR_AGENTE_FINAL	
    ,A2.CARGO_AGENTE_FINAL	
    ,A2.SUPERVISOR_AGENTE_FINAL	
    ,A2.JEFE_AGENTE_FINAL	
    ,A2.NOMBRE_AGENTE_DEFINITIVO	
    ,A2.CORREO_AGENTE_DEFINITIVO	
    --,A2.FECHA_ACTUALIZACION	
    ,A2.COD_SUPERVISOR_AGENTE_FINAL
    ,A2.NOMBRE_PRODUCTO	
    ,A2.NOMBRE_AGENCIA_FINAL	
FROM `iter-data-storage-pv-uat.temp.AGENTE_EXP_SERV`  A2
;		
SELECT 'OK' AS EJECUCION;

END;