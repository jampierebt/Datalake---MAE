CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_carga_golden_poliza_agente()
OPTIONS(
  strict_mode=true)
BEGIN
-- *********************************************************************
-- * Proyecto       : GOLDEN RECORD
-- * Fecha          : 05/05/2020
-- * Autor          : Ramirez Hurtado, Tito Jaime
-- * Tabla Destinos : - 
-- *                : - 
-- * Tablas Fuentes : - 
-- * Descripción    : POLIZA - AGENTE - AGENCIA - SUPERVISOR - JEFE
-- *********************************************************************
-- *                       MODIFICACIONES POSTERIORES                  *
-- *===================================================================*
-- *   Fecha   | Persona |           Modificación Realizada            *
-- *===================================================================*
-- *           |         |                                            
-- *********************************************************************

-- ============================================================================================
--                                      ACSELE                                               --
-- ============================================================================================
-- ----------------------------------------------------------------------
-- -- Paso 1: CARGA DE LAS POLIZAS Y AGENCIA - AGENTES
-- -- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_POLIZA_AGENTE_FNT
AS
WITH TMP_POLIZA_AGENTE_TMP AS 
(
SELECT  
   OPE.NUMERO_POLIZA
  ,CAST(OPE.ID_PRODUCTO AS INT64) AS ID_PRODUCTO
  ,OPE.NOMBRE_PRODUCTO
  ,OPE.COD_AGENCIA_INICIAL
  ,OPE.COD_AGENTE_INICIAL
  ,OPE.CORREO_AGENTE_INICIAL
  ,OPE.NOMBRE_AGENTE_INICIAL
  ,OPE.COD_AGENCIA_FINAL
  ,OPE.COD_AGENTE_FINAL
  ,OPE.NOMBRE_AGENTE_FINAL
  ,OPE.CORREO_AGENTE_FINAL
  ,OPE.NOMBRE_AGENTE_DEFINITIVO
  ,OPE.CORREO_AGENTE_DEFINITIVO
  ,OPE.CANAL_VENTA_VIDA
  ,OPE.NUMERO_OPERACION
  ,OPE.MEDIO_COMUNICACION
  ,OPE.FECHA_RECEPCION_GDC
  FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION_AGENTE` OPE
  WHERE OPE.STATUS_OPERATION IN ("Applied operation")
  QUALIFY(ROW_NUMBER()OVER(PARTITION BY OPE.NUMERO_POLIZA ORDER BY TIMESTAMP(OPE.FECHA_OPERACION_MOVIMIENTO) DESC ))=1
)
SELECT 
   TMP.NUMERO_POLIZA
  ,CAST(TMP.ID_PRODUCTO AS STRING) AS ID_PRODUCTO
  ,TMP.NOMBRE_PRODUCTO
  ,TMP.COD_AGENCIA_INICIAL
  ,TMP.COD_AGENTE_INICIAL
  ,TMP.CORREO_AGENTE_INICIAL
  ,TMP.NOMBRE_AGENTE_INICIAL
  ,COALESCE(AGE.COD_AGENCIA,TMP.COD_AGENCIA_FINAL) AS COD_AGENCIA_FINAL
  ,TMP.COD_AGENTE_FINAL
  ,COALESCE(AGE.NOM_AGENTE,TMP.NOMBRE_AGENTE_FINAL) AS NOMBRE_AGENTE_FINAL
  ,TMP.CORREO_AGENTE_FINAL
  ,TMP.NOMBRE_AGENTE_DEFINITIVO
  ,TMP.CORREO_AGENTE_DEFINITIVO
  ,TMP.CANAL_VENTA_VIDA
  ,TMP.NUMERO_OPERACION
  -- DATOS DE AGENTE
  --,AGE.COD_AGENTE
  ,AGE.DOC_AGENTE
  ,AGE.CODIGO_GDH
  ,AGE.COD_USERNAME_AGENTE
  ,AGE.FECHA_CESE
  ,AGE.FLAG_AGENTE_INDICADOR_VIGENCIA
  ,AGE.CATEGORIA
  ,AGE.FECHA_FIN_VIGENCIA
  ,AGE.FECHA_INICIO_VIGENCIA
  ,AGE.GLS_CORREO_AGENTE
  ,AGE.CODIGO_CONTRATO
  -- DATOS DE AGENCIA
  --,AGE.COD_AGENCIA
  ,AGE.NOMBRE_AGENCIA AS NOMBRE_AGENCIA_FINAL
  -- DATOS DE SUPERVISOR
  ,AGE.CODIGO_SUPERVISOR AS COD_SUPERVISOR_AGENTE_FINAL
  ,AGE.NOM_SUPERVIS AS SUPERVISOR_AGENTE_FINAL  
  ,AGE.DOC_SUPERVIS
  ,AGE.COD_USERNAME_SUPERVIS
  -- DATOS DE JEFE
  ,AGE.COD_JEFE AS COD_JEFE_AGENTE_FINAL 
  ,AGE.DOC_JEFE
  ,AGE.NOM_JEFE AS JEFE_AGENTE_FINAL
  ,AGE.COD_USERNAME_JEFE
  ,AGE.GLS_CORREO_JEFE
  ,AGE.ZONA_JEFE
  ,TMP.MEDIO_COMUNICACION
  ,TMP.FECHA_RECEPCION_GDC
FROM TMP_POLIZA_AGENTE_TMP TMP
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.ESTRUCTURA_COMERCIAL_HST` AGE
    ON CAST(AGE.COD_AGENTE AS INT64) = CAST(TMP.COD_AGENTE_FINAL AS INT64)
;

-- ----------------------------------------------------------------------
-- Paso 2: Diferencial con los registros nuevos y Modificados(algun campo no llave)
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_POLIZA_OPERACION_AGENTE_DIFF`
AS
-- Universo de Registros NUEVOS o que se Modificados
WITH TMP_LANDING AS 
(
 SELECT DISTINCT
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
--,CELULAR_AGENTE_FINAL
--,CARGO_AGENTE_FINAL
,SUPERVISOR_AGENTE_FINAL
,JEFE_AGENTE_FINAL
,NOMBRE_AGENTE_DEFINITIVO
,CORREO_AGENTE_DEFINITIVO
,NOMBRE_PRODUCTO
,NOMBRE_AGENCIA_FINAL
,COD_JEFE_AGENTE_FINAL
,COD_SUPERVISOR_AGENTE_FINAL
,MEDIO_COMUNICACION
,FECHA_RECEPCION_GDC
,UPPER(TO_HEX(SHA256(CONCAT( 
 COALESCE(COD_AGENCIA_INICIAL,'')
,COALESCE(COD_AGENTE_INICIAL,'')
,COALESCE(CORREO_AGENTE_INICIAL,'')
,COALESCE(NOMBRE_AGENTE_INICIAL,'')
,COALESCE(COD_AGENCIA_FINAL,'')
,COALESCE(COD_AGENTE_FINAL,'')
,COALESCE(NOMBRE_AGENTE_FINAL,'')
,COALESCE(CORREO_AGENTE_FINAL,'')
,COALESCE(SUPERVISOR_AGENTE_FINAL,'')
,COALESCE(JEFE_AGENTE_FINAL,'')
,COALESCE(NOMBRE_AGENTE_DEFINITIVO,'')
,COALESCE(CORREO_AGENTE_DEFINITIVO,'')
,COALESCE(NOMBRE_PRODUCTO,'')
,COALESCE(NOMBRE_AGENCIA_FINAL,'')
,COALESCE(COD_JEFE_AGENTE_FINAL,'')
,COALESCE(COD_SUPERVISOR_AGENTE_FINAL,'')
,COALESCE(MEDIO_COMUNICACION,'')
,COALESCE(FECHA_RECEPCION_GDC,DATE(1990,01,01))
)))) AS HASH_DIFF
-- FROM iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE ;
FROM TMP_POLIZA_AGENTE_FNT
)
SELECT LAN.*
      ,COALESCE(DIFF.FECHA_CREACION_REGISTRO,CURRENT_DATE('America/Lima')) AS FECHA_CREACION_REGISTRO
      ,CURRENT_DATE('America/Lima')   AS FECHA_MODIFICACION_REGISTRO
     FROM TMP_LANDING LAN
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE` /*TMP_DIFF*/ DIFF -- Universo de Registros EXISTENTES en la tabla DESTINO
        ON LAN.NUMERO_POLIZA  = DIFF.NUMERO_POLIZA
       AND LAN.ID_PRODUCTO    = DIFF.ID_PRODUCTO
     WHERE LAN.HASH_DIFF  <> DIFF.HASH_DIFF -- Registros Modificados
        OR DIFF.HASH_DIFF IS NULL  -- Registros Nuevos
;

-- ----------------------------------------------------------------------
-- Paso 3: CARGA FINAL - [UPDATE - INSERT]
-- ----------------------------------------------------------------------
  MERGE `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE` A1 
  USING `iter-data-storage-pv-uat.temp.TMP_POLIZA_OPERACION_AGENTE_DIFF` A2
     ON A1.NUMERO_POLIZA      = A2.NUMERO_POLIZA 
    AND A1.ID_PRODUCTO        = A2.ID_PRODUCTO 
  WHEN MATCHED THEN 
  UPDATE SET
     COD_AGENCIA_INICIAL      = A2.COD_AGENCIA_INICIAL
    ,COD_AGENTE_INICIAL       = A2.COD_AGENTE_INICIAL
    ,CORREO_AGENTE_INICIAL    = A2.CORREO_AGENTE_INICIAL
    ,NOMBRE_AGENTE_INICIAL    = A2.NOMBRE_AGENTE_INICIAL
    ,COD_AGENCIA_FINAL        = A2.COD_AGENCIA_FINAL
    ,NOMBRE_AGENCIA_FINAL     = A2.NOMBRE_AGENCIA_FINAL
    ,COD_AGENTE_FINAL         = A2.COD_AGENTE_FINAL
    ,NOMBRE_AGENTE_FINAL      = A2.NOMBRE_AGENTE_FINAL
    ,CORREO_AGENTE_FINAL      = A2.CORREO_AGENTE_FINAL
    --,CELULAR_AGENTE_FINAL     = A2.CELULAR_AGENTE_FINAL
    --,CARGO_AGENTE_FINAL       = A2.CARGO_AGENTE_FINAL
    ,SUPERVISOR_AGENTE_FINAL  = A2.SUPERVISOR_AGENTE_FINAL
    ,JEFE_AGENTE_FINAL        = A2.JEFE_AGENTE_FINAL
    ,NOMBRE_AGENTE_DEFINITIVO = A2.NOMBRE_AGENTE_DEFINITIVO
    ,CORREO_AGENTE_DEFINITIVO = A2.CORREO_AGENTE_DEFINITIVO
    ,NOMBRE_PRODUCTO          = A2.NOMBRE_PRODUCTO
    ,COD_JEFE_AGENTE_FINAL    = A2.COD_JEFE_AGENTE_FINAL --COD_JEFE
    ,COD_SUPERVISOR_AGENTE_FINAL = A2.COD_SUPERVISOR_AGENTE_FINAL --CODIGO_SUPERVISOR
    ,FECHA_MODIFICACION_REGISTRO = CURRENT_DATE('America/Lima')
    ,MEDIO_COMUNICACION          = A2.MEDIO_COMUNICACION
    ,HASH_DIFF                   = A2.HASH_DIFF
    ,FECHA_RECEPCION_GDC         = A2.FECHA_RECEPCION_GDC
  WHEN NOT MATCHED THEN
    INSERT (
             NUMERO_POLIZA
            ,ID_PRODUCTO
            ,COD_AGENCIA_INICIAL
            ,COD_AGENTE_INICIAL
            ,CORREO_AGENTE_INICIAL
            ,NOMBRE_AGENTE_INICIAL
            ,COD_AGENCIA_FINAL
            ,NOMBRE_AGENCIA_FINAL
            ,COD_AGENTE_FINAL
            ,NOMBRE_AGENTE_FINAL
            ,CORREO_AGENTE_FINAL
           --,CELULAR_AGENTE_FINAL
            --,CARGO_AGENTE_FINAL
            ,SUPERVISOR_AGENTE_FINAL
            ,JEFE_AGENTE_FINAL
            ,NOMBRE_AGENTE_DEFINITIVO
            ,CORREO_AGENTE_DEFINITIVO
            ,NOMBRE_PRODUCTO
            ,COD_JEFE_AGENTE_FINAL
            ,COD_SUPERVISOR_AGENTE_FINAL
            ,FECHA_MODIFICACION_REGISTRO
            ,FECHA_CREACION_REGISTRO
            ,HASH_DIFF
            ,MEDIO_COMUNICACION
            ,FECHA_RECEPCION_GDC
            )
 VALUES(
             A2.NUMERO_POLIZA
            ,A2.ID_PRODUCTO
            ,A2.COD_AGENCIA_INICIAL
            ,A2.COD_AGENTE_INICIAL
            ,A2.CORREO_AGENTE_INICIAL
            ,A2.NOMBRE_AGENTE_INICIAL
            ,A2.COD_AGENCIA_FINAL
            ,A2.NOMBRE_AGENCIA_FINAL
            ,A2.COD_AGENTE_FINAL
            ,A2.NOMBRE_AGENTE_FINAL
            ,A2.CORREO_AGENTE_FINAL
           -- ,A2.CELULAR_AGENTE_FINAL
            --,A2.CARGO_AGENTE_FINAL
            ,A2.SUPERVISOR_AGENTE_FINAL
            ,A2.JEFE_AGENTE_FINAL
            ,A2.NOMBRE_AGENTE_DEFINITIVO
            ,A2.CORREO_AGENTE_DEFINITIVO
            --,CURRENT_TIMESTAMP()
            ,A2.NOMBRE_PRODUCTO
            ,A2.COD_JEFE_AGENTE_FINAL --COD_JEFE
            ,A2.COD_SUPERVISOR_AGENTE_FINAL -- CODIGO_SUPERVISOR
            ,A2.FECHA_MODIFICACION_REGISTRO
            ,A2.FECHA_CREACION_REGISTRO
            ,A2.HASH_DIFF
            ,A2.MEDIO_COMUNICACION
            ,A2.FECHA_RECEPCION_GDC
 );

-- ============================================================================================
--                                      RENTA                                               --
-- ============================================================================================
-- ----------------------------------------------------------------------
-- Paso 3: Universo de Polizas y sus agentes
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_RENTA_AGENTE_UNIVERSO`
AS
( 
 SELECT  POL.gls_poliza AS NUMERO_POLIZA
        ,CN1.ID_PRODUCTO
        ,CN1.NOMBRE_PRODUCTO
        ,CAST(AGE.NUMERO_AGENTE AS STRING)     AS COD_AGENTE_FINAL
        ,AGE.NOMBRE_AGENTE     AS NOMBRE_AGENTE_FINAL
        ,AGE.NUMERO_AGENCIA    AS COD_AGENCIA_FINAL
        ,AGE.NOMBRE_AGENCIA    AS NOMBRE_AGENCIA_FINAL
        ,AGE.NOMBRE_SUPERVISOR AS SUPERVISOR_AGENTE_FINAL
        ,AGE.NOMBRE_JEFE       AS JEFE_AGENTE_FINAL
        ,CAST(AGE.CODIGO_JEFE AS STRING) AS COD_JEFE_AGENTE_FINAL
        ,CAST(AGE.CODIGO_SUPERVISOR AS STRING) AS COD_SUPERVISOR_AGENTE_FINAL
        ,AGE.CORREO_AGENTE    AS CORREO_AGENTE_FINAL
        ,AGE.CARGO AS CARGO_AGENTE_FINAL
       FROM `iter-data-storage-pv-uat.admwr_data.poliza_raw` POL
 INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO` CN1 
         ON POL.cod_tipo_producto = CN1.ID_PRODUCTO 
        AND CN1.ID_FUENTE = '03'
 INNER JOIN `iter-data-storage-pv-uat.master_party.ESTRUCTURA_COMERCIAL_RENTA` AGE
         ON AGE.NUMERO_AGENTE = POL.NUM_VENDEDOR
QUALIFY(ROW_NUMBER()OVER(PARTITION BY POL.GLS_POLIZA ORDER BY POL.GLS_POLIZA))=1
UNION ALL 
 SELECT  CAST(POL.num_poliza AS STRING) NUMERO_POLIZA
        ,AP.ID_PRODUCTO
        ,AP.NOMBRE_PRODUCTO
        ,CAST(AGE.NUMERO_AGENTE AS STRING)     AS COD_AGENTE_FINAL
        ,AGE.NOMBRE_AGENTE     AS NOMBRE_AGENTE_FINAL
        ,AGE.NUMERO_AGENCIA    AS COD_AGENCIA_FINAL
        ,AGE.NOMBRE_AGENCIA    AS NOMBRE_AGENCIA_FINAL
        ,AGE.NOMBRE_SUPERVISOR AS SUPERVISOR_AGENTE_FINAL
        ,AGE.NOMBRE_JEFE       AS JEFE_AGENTE_FINAL
        ,CAST(AGE.CODIGO_JEFE AS STRING) AS COD_JEFE_AGENTE_FINAL
        ,CAST(AGE.CODIGO_SUPERVISOR AS STRING) AS COD_SUPERVISOR_AGENTE_FINAL
        ,AGE.CORREO_AGENTE    AS CORREO_AGENTE_FINAL
        ,AGE.CARGO AS CARGO_AGENTE_FINAL
       FROM `iter-data-storage-pv-uat.rviadmin_data.poliza_raw` POL
 INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO` AP 
         ON POL.cod_cartera = AP.ID_PRODUCTO 
        AND AP.ID_FUENTE = '02'
 INNER JOIN `iter-data-storage-pv-uat.master_party.ESTRUCTURA_COMERCIAL_RENTA` AGE
         ON AGE.NUMERO_AGENTE = POL.NUM_VENDEDOR
QUALIFY(ROW_NUMBER()OVER(PARTITION BY POL.num_poliza ORDER BY POL.num_poliza))=1
)
;
-- ----------------------------------------------------------------------
-- Paso 2: Diferencial con los registros nuevos y Modificados(algun campo no llave)
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_POLIZA_OPERACION_AGENTE_DIFF`
AS
-- Universo de Registros NUEVOS o que se Modificados
WITH TMP_LANDING AS 
(
SELECT 
 NUMERO_POLIZA
,ID_PRODUCTO
,NOMBRE_PRODUCTO
,COD_AGENTE_FINAL
,NOMBRE_AGENTE_FINAL
,COD_AGENCIA_FINAL
,NOMBRE_AGENCIA_FINAL
,SUPERVISOR_AGENTE_FINAL
,JEFE_AGENTE_FINAL
,COD_JEFE_AGENTE_FINAL
,COD_SUPERVISOR_AGENTE_FINAL
,CORREO_AGENTE_FINAL
,CARGO_AGENTE_FINAL
,UPPER(TO_HEX(SHA256(CONCAT(  
 COALESCE(NOMBRE_PRODUCTO,'')
,COALESCE(COD_AGENTE_FINAL,'')
,COALESCE(NOMBRE_AGENTE_FINAL,'')
,COALESCE(COD_AGENCIA_FINAL,'')
,COALESCE(NOMBRE_AGENCIA_FINAL,'')
,COALESCE(SUPERVISOR_AGENTE_FINAL,'')
,COALESCE(JEFE_AGENTE_FINAL,'')
,COALESCE(COD_JEFE_AGENTE_FINAL,'')
,COALESCE(COD_SUPERVISOR_AGENTE_FINAL,'')
,COALESCE(CORREO_AGENTE_FINAL,'')
,COALESCE(CARGO_AGENTE_FINAL,''))))) AS HASH_DIFF
FROM `iter-data-storage-pv-uat.temp.TMP_RENTA_AGENTE_UNIVERSO`
)
SELECT LAN.*
      ,COALESCE(DIFF.FECHA_CREACION_REGISTRO,CURRENT_DATE('America/Lima')) AS FECHA_CREACION_REGISTRO
      ,CURRENT_DATE('America/Lima')   AS FECHA_MODIFICACION_REGISTRO
     FROM TMP_LANDING LAN
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE` /*TMP_DIFF*/ DIFF -- Universo de Registros EXISTENTES en la tabla DESTINO
        ON LAN.NUMERO_POLIZA  = DIFF.NUMERO_POLIZA
       AND LAN.ID_PRODUCTO    = DIFF.ID_PRODUCTO
     WHERE LAN.HASH_DIFF  <> DIFF.HASH_DIFF -- Registros Modificados
        OR DIFF.HASH_DIFF IS NULL  -- Registros Nuevos
;


-- ----------------------------------------------------------------------
-- Paso 3: Eliminar la relacion poliza y agentes por producto y numero de poliza.
-- ----------------------------------------------------------------------
DELETE FROM  `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE` AGE
WHERE EXISTS (
  SELECT 1
  FROM `iter-data-storage-pv-uat.temp.TMP_POLIZA_OPERACION_AGENTE_DIFF`  FNT --`iter-data-storage-pv-uat.temp.TMP_RENTA_AGENTE_UNIVERSO` 
  WHERE FNT.NUMERO_POLIZA = AGE.NUMERO_POLIZA
    AND FNT.ID_PRODUCTO   = AGE.ID_PRODUCTO
)
;

-- ----------------------------------------------------------------------
-- Paso 3: Insertar los agentes
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE` 
(
 NUMERO_POLIZA
,ID_PRODUCTO
,NOMBRE_PRODUCTO
,COD_AGENTE_FINAL
,NOMBRE_AGENTE_FINAL
,COD_AGENCIA_FINAL
,NOMBRE_AGENCIA_FINAL
,SUPERVISOR_AGENTE_FINAL
,JEFE_AGENTE_FINAL
,COD_JEFE_AGENTE_FINAL
,COD_SUPERVISOR_AGENTE_FINAL
,CORREO_AGENTE_FINAL
,CARGO_AGENTE_FINAL
,FECHA_CREACION_REGISTRO
,FECHA_MODIFICACION_REGISTRO
,HASH_DIFF
)
SELECT 
 NUMERO_POLIZA
,ID_PRODUCTO
,NOMBRE_PRODUCTO
,COD_AGENTE_FINAL
,NOMBRE_AGENTE_FINAL
,COD_AGENCIA_FINAL
,NOMBRE_AGENCIA_FINAL
,SUPERVISOR_AGENTE_FINAL
,JEFE_AGENTE_FINAL
,COD_JEFE_AGENTE_FINAL
,COD_SUPERVISOR_AGENTE_FINAL
,CORREO_AGENTE_FINAL
,CARGO_AGENTE_FINAL
,FECHA_CREACION_REGISTRO
,FECHA_MODIFICACION_REGISTRO
,HASH_DIFF
FROM `iter-data-storage-pv-uat.temp.TMP_POLIZA_OPERACION_AGENTE_DIFF` 
;


-- ============================================================================================
--                                      VEHICULAR                                            --
-- ============================================================================================

-- ----------------------------------------------------------------------
-- Paso 2: 
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_POLIZA_OPERACION_AGENTE_DIFF`
AS
-- Universo de Registros NUEVOS o que se Modificados
WITH TMP_LANDING AS 
(
SELECT 
 NUMERO_POLIZA
,NOMBRE_PRODUCTO
,ID_PRODUCTO
,CODIGO_AGENTE 
,NOMBRE_AGENTE
,CODIGO_AGENTE_NUEVO AS COD_AGENTE_FINAL
,CODIGO_AGENTE_NUEVO AS COD_AGENTE_INICIAL
,NOMBRE_AGENTE_NUEVO AS NOMBRE_AGENTE_FINAL
,NOMBRE_AGENTE_NUEVO AS NOMBRE_AGENTE_INICIAL
,'906'             AS COD_AGENCIA_FINAL
,'Milagros Luna'   AS SUPERVISOR_AGENTE_FINAL
,'Sally Silvestre' AS JEFE_AGENTE_FINAL
,UPPER(TO_HEX(SHA256(CONCAT(
 COALESCE(CODIGO_AGENTE,'')
,COALESCE(NOMBRE_AGENTE,'')
,COALESCE(CODIGO_AGENTE_NUEVO,'')
,COALESCE(NOMBRE_AGENTE_NUEVO,''))))) AS HASH_DIFF
FROM `iter-data-storage-pv-uat.inputfiles.DE_POLIZA_AGENTE_VEHICULAR_raw`
WHERE NUMERO_POLIZA IS NOT NULL
)
SELECT LAN.*
      ,COALESCE(DIFF.FECHA_CREACION_REGISTRO,CURRENT_DATE('America/Lima')) AS FECHA_CREACION_REGISTRO
      ,CURRENT_DATE('America/Lima')   AS FECHA_MODIFICACION_REGISTRO
     FROM TMP_LANDING LAN
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE` /*TMP_DIFF*/ DIFF -- Universo de Registros EXISTENTES en la tabla DESTINO
        ON LAN.NUMERO_POLIZA  = DIFF.NUMERO_POLIZA
       AND LAN.ID_PRODUCTO    = DIFF.ID_PRODUCTO
     WHERE LAN.HASH_DIFF  <> DIFF.HASH_DIFF -- Registros Modificados
        OR DIFF.HASH_DIFF IS NULL  -- Registros Nuevos
;

-- ----------------------------------------------------------------------
-- Paso 3: Eliminar la relacion poliza y agentes por producto y numero de poliza.
-- ----------------------------------------------------------------------
DELETE FROM  `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE` AGE
WHERE EXISTS (
  SELECT 1
  FROM `iter-data-storage-pv-uat.temp.TMP_POLIZA_OPERACION_AGENTE_DIFF`  FNT
  WHERE FNT.NUMERO_POLIZA = AGE.NUMERO_POLIZA
    AND FNT.ID_PRODUCTO   = AGE.ID_PRODUCTO
)
;

-- ----------------------------------------------------------------------
-- Paso 3: Insertar los agentes
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_AGENTE` 
(
 NUMERO_POLIZA
,ID_PRODUCTO
,NOMBRE_PRODUCTO
,COD_AGENTE_FINAL
,NOMBRE_AGENTE_FINAL
,COD_AGENCIA_FINAL
--,NOMBRE_AGENCIA_FINAL
,SUPERVISOR_AGENTE_FINAL
,JEFE_AGENTE_FINAL
--,COD_JEFE_AGENTE_FINAL
--,COD_SUPERVISOR_AGENTE_FINAL
--,CORREO_AGENTE_FINAL
--,CARGO_AGENTE_FINAL
 -- Auditoria 
,FECHA_CREACION_REGISTRO
,FECHA_MODIFICACION_REGISTRO
,HASH_DIFF
)
SELECT 
 NUMERO_POLIZA
,ID_PRODUCTO
,NOMBRE_PRODUCTO
,COD_AGENTE_FINAL
,NOMBRE_AGENTE_FINAL
,COD_AGENCIA_FINAL
--,NOMBRE_AGENCIA_FINAL
,SUPERVISOR_AGENTE_FINAL
,JEFE_AGENTE_FINAL
--,COD_JEFE_AGENTE_FINAL
--,COD_SUPERVISOR_AGENTE_FINAL
--,CORREO_AGENTE_FINAL
--,CARGO_AGENTE_FINAL
-- 
,FECHA_CREACION_REGISTRO
,FECHA_MODIFICACION_REGISTRO
,HASH_DIFF
FROM `iter-data-storage-pv-uat.temp.TMP_POLIZA_OPERACION_AGENTE_DIFF` 
;

-- ----------------------------------------------------------------------
-- Paso 3: Limpiar Temporales
-- ----------------------------------------------------------------------
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_RENTA_AGENTE_UNIVERSO` ;
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_POLIZA_OPERACION_AGENTE_DIFF`;

SELECT 'OK' ESTADO_EJECUCION;

END;