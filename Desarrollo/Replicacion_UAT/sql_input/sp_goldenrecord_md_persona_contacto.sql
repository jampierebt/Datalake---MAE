CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_goldenrecord_md_persona_contacto()
BEGIN 

-- *********************************************************************
-- * Fecha          : 28/10/2021
-- * Autor          : Jayo Escalante, Geraldine Indira; Tito Ramirez H.
-- * Tabla Destinos : - 
-- *                : - 
-- * Tablas Fuentes : - 
-- * Descripción    : 
-- *********************************************************************
-- *                       MODIFICACIONES POSTERIORES                  *
-- *===================================================================*
--NIVEL DE PRIORIDAD
--ACSEL-E	        1 
--RENTA PARTICULAR	2
--RENTA VITALICIA	3
--VIAJES	        4
--VEHICULAR	        5
--WEB SOAT	        6
--VIDACASH	        7

-- ----------------------------------------------------------------------
-- Paso A0: Universo de personas(CONTRATANTE-ASEGURADO-BENEFICIARIO) de Acsel_e con una poliza vigente
-- ----------------------------------------------------------------------

CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_PERSONA_ACSELE_POLIZA_VIGENTE`
AS
(
SELECT DISTINCT HASH_ID
FROM (
  -- CONTRATANTE
      SELECT DISTINCT CON.HASH_ID
        FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA` POL
  INNER JOIN `iter-data-storage-pv-uat.goldenrecord_data.CONTRATANTE` CON
          ON CON.ID_PERSONA = POL.ID_PERSONA
          WHERE POL.ID_FUENTE='01'
            AND POL.ESTADO   ='VIGENTE'
            AND CON.HASH_ID IS NOT NULL
UNION ALL
  -- CONTRATANTE
      SELECT DISTINCT ASE.HASH_ID
        FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA` POL
  INNER JOIN `iter-data-storage-pv-uat.goldenrecord_data.ASEGURADO` ASE
          ON ASE.NUMERO_POLIZA = POL.NUMERO_POLIZA
          WHERE POL.ID_FUENTE  ='01'
            AND POL.ESTADO     ='VIGENTE'
            AND ASE.HASH_ID IS NOT NULL
  -- ASEGURADO
  -- BENEFICIARIO
)
)
;

-- ----------------------------------------------------------------------
-- Paso A10: PERSONA - NUMERO DOCUMENTOS - Una persona en acsele, puede tener varios documentos.
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DOCUMENTOS_CONTACTO`
AS
WITH TMP_DOCUMENT AS 
(

SELECT 
	STATIC
	,[STRUCT(PNAT.DOCUMENTOIDENTIDADINPUT  AS NUMERO_DOCUMENTO   , '01' AS TIPO_DOCUMENTO , PNAT.TIPO_PERSONA,1 AS PRIORIDAD_DOCUMENTO)
  ,STRUCT(PNAT.CARNETEXTRANJERIAINPUT     ,'02', PNAT.TIPO_PERSONA,2 AS PRIORIDAD_DOCUMENTO)
  ,STRUCT(PNAT.RUCNATURALINPUT     , '03', PNAT.TIPO_PERSONA,3 AS PRIORIDAD_DOCUMENTO)
	,STRUCT(PNAT.PASAPORTEINPUT     , '04', PNAT.TIPO_PERSONA,4 AS PRIORIDAD_DOCUMENTO)
	,STRUCT(PNAT.CARNETDIPLOMATICOINPUT     , '05', PNAT.TIPO_PERSONA,5 AS PRIORIDAD_DOCUMENTO)
	,STRUCT(PNAT.CARNETFUERZASARMADASINPUT      ,'06', PNAT.TIPO_PERSONA,6 AS PRIORIDAD_DOCUMENTO)
	,STRUCT(PNAT.CARNETIDENPOLICIAINPUT     ,'07', PNAT.TIPO_PERSONA,7 AS PRIORIDAD_DOCUMENTO)
	,STRUCT(PNAT.CARNETMINISTRABINPUT     ,'08', PNAT.TIPO_PERSONA,8 AS PRIORIDAD_DOCUMENTO)
	,STRUCT(PNAT.PARTIDANACIMIENTOINPUT     ,'09', PNAT.TIPO_PERSONA,9 AS PRIORIDAD_DOCUMENTO)
	,STRUCT(PNAT.LIBRETAMILITARINPUT     ,'10', PNAT.TIPO_PERSONA,10 AS PRIORIDAD_DOCUMENTO)] AS DOCUMENTO_PERSONA
FROM (
SELECT DISTINCT
STATIC
,DOCUMENTOIDENTIDADINPUT
,RUCNATURALINPUT
,PASAPORTEINPUT
,CARNETDIPLOMATICOINPUT
,CARNETEXTRANJERIAINPUT
,CARNETFUERZASARMADASINPUT
,CARNETIDENPOLICIAINPUT
,CARNETMINISTRABINPUT
,PARTIDANACIMIENTOINPUT
,LIBRETAMILITARINPUT
,'NATURAL' AS TIPO_PERSONA
FROM `iter-data-storage-pv-uat.acsele_data.PERSONANATURAL_raw`
) PNAT
UNION ALL
SELECT 
 STATIC
,[STRUCT(PJUR.RUCINPUT  AS NUMERO_DOCUMENTO   , '03' AS TIPO_DOCUMENTO,PJUR.TIPO_PERSONA,1 AS PRIORIDAD_DOCUMENTO)] AS DOCUMENTO_PERSONA
FROM (
SELECT DISTINCT STATIC, 
RUCINPUT, 
'JURIDICA' AS TIPO_PERSONA,
FROM `iter-data-storage-pv-uat.acsele_data.PERSONAJURIDICA_raw`
) PJUR
)
SELECT DISTINCT 
 DOC.STATIC
,'ACSELE' AS FUENTE_ORIGEN
,PER.NUMERO_DOCUMENTO
,PER.TIPO_DOCUMENTO 
,PER.TIPO_PERSONA
,PER.PRIORIDAD_DOCUMENTO
,upper(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.NUMERO_DOCUMENTO,15,'0'))))) AS HASH_ID
FROM TMP_DOCUMENT DOC
,UNNEST(DOCUMENTO_PERSONA) PER
LEFT JOIN `iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL` EG1 
       ON EG1.VALOR_ORIGEN = PER.TIPO_DOCUMENTO 
      AND EG1.ID_FUENTE    ='01' 
WHERE PER.NUMERO_DOCUMENTO IS NOT NULL
;

-- DUPLICADOS : [ERROR]
-- SELECT COUNT(1),HASH_ID FROM `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DOCUMENTOS_CONTACTO` GROUP BY HASH_ID HAVING COUNT(1)>1;

-- =================================================================================================
--                                         CORREO
-- =================================================================================================

CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_CORREO`
AS
-- ------------------------------------------------------------------------------------------------ 
-- ***                                         ACSELE                                           *** 
-- ------------------------------------------------------------------------------------------------ 
WITH TMP_CORREO AS 
(
  SELECT 
     COR.static
    ,[STRUCT(COR.EMAILUNOINPUT AS CORREO_PERSONA ,COR.TABLA_FUENTE, 1 AS PRIORIDAD_CORREO)
    ,STRUCT(COR.EMAILDOSINPUT  ,COR.TABLA_FUENTE,  2 AS PRIORIDAD_CORREO)
    ,STRUCT(COR.EMAILTRESINPUT  ,COR.TABLA_FUENTE,  3 AS PRIORIDAD_CORREO)
    ,STRUCT(COR.EMAILINPUT , COR.TABLA_FUENTE, 4 AS PRIORIDAD_CORREO)] AS CORREO
    FROM( 
    SELECT DISTINCT 
    PTP.STATIC
    ,PTP.IDORIGENTERCEROINPUT
    ,DIR.EMAILINPUT
    ,PTP.EMAILUNOINPUT
    ,PTP.EMAILDOSINPUT
    ,PTP.EMAILTRESINPUT
    ,CASE WHEN DIR.EMAILINPUT IS NULL THEN 'PRETHIRDPARTY' ELSE 'DIRECCION' END AS TABLA_FUENTE
         FROM `iter-data-storage-pv-uat.acsele_data.PRETHIRDPARTY_raw` PTP
    LEFT JOIN `iter-data-storage-pv-uat.acsele_data.STTE_THIRDPARTYADDRESSBOOK_raw` TAB ON CAST(TAB.Tpt_Id AS STRING) = PTP.static 
    LEFT JOIN `iter-data-storage-pv-uat.acsele_data.DIRECCION_raw` DIR ON DIR.PK = CAST(TAB.IDDCO AS STRING) 
    ) COR
) 
SELECT DISTINCT
 COR.STATIC
,CLI.HASH_ID
,TRIM(REPLACE(REPLACE(CORP.CORREO_PERSONA,'\r',' '),'\n',' ')) AS CORREO
,CORP.TABLA_FUENTE
,CORP.PRIORIDAD_CORREO
,IF( TPAPV.HASH_ID IS NOT NULL,1,91 ) AS PRIORIDAD_FUENTE
,'01' AS ID_FUENTE
,'PERSONA' AS ROL
FROM TMP_CORREO COR
,UNNEST(CORREO) CORP
INNER JOIN `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DOCUMENTOS_CONTACTO` CLI
        ON CLI.STATIC = COR.STATIC
LEFT JOIN `iter-data-storage-pv-uat.temp.TMP_PERSONA_ACSELE_POLIZA_VIGENTE` TPAPV 
        ON CLI.HASH_ID=TPAPV.HASH_ID
     WHERE CORP.CORREO_PERSONA IS NOT NULL


-- ------------------------------------------------------------------------------------------------ 
-- ***                                         RENTA PARTICULAR                                 *** 
-- ------------------------------------------------------------------------------------------------
UNION ALL 
SELECT
 DISTINCT
  '' AS STATIC
,upper(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.gls_nro_identificacion,15,'0'))))) HASH_ID
,REPLACE(REPLACE(TRIM(BEN.gls_correo_electronico),'\n',''),'\r','') AS CORREO
,'' AS TABLA_FUENTE
,1 AS PRIORIDAD_CORREO
,2 AS PRIORIDAD_FUENTE
,'03'                  AS ID_FUENTE
--,EG1.CODIGO_GLOBAL     AS ID_TIPO_DOCUMENTO
--,EG1.NOMBRE_GLOBAL     AS TIPO_DOCUMENTO
--,PER.gls_nro_identificacion AS NUMERO_DOCUMENTO
,(CASE WHEN BEN.cod_parentesco = '80' THEN 'CONTRATANTE' ELSE 'BENEFICIARIO' END ) AS ROL
FROM iter-data-storage-pv-uat.admwr_data.persona_raw PER
INNER JOIN iter-data-storage-pv-uat.admwr_data.poliza_raw POL 
        ON POL.cod_persona = PER.cod_persona
INNER JOIN iter-data-storage-pv-uat.admwr_data.beneficiario_raw BEN 
        ON BEN.cod_persona = PER.cod_persona 
       AND BEN.cod_poliza  = POL.cod_poliza
INNER JOIN iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL EG1 
        ON PER.cod_tipo_identificacion = EG1.VALOR_ORIGEN 
       AND EG1.ID_FUENTE   = '03' 
       AND EG1.CODIGO_TIPO = 'TIPODOC'
INNER JOIN iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO AP 
        ON POL.cod_tipo_producto = AP.ID_PRODUCTO 
       AND AP.ID_FUENTE = '03'
     WHERE POL.cod_tipo_producto IN ('RPP','IFP') 
       --AND BEN.cod_parentesco = '80'
       AND NULLIF(TRIM(BEN.gls_correo_electronico),'')  IS NOT NULL



-- ------------------------------------------------------------------------------------------------ 
-- ***                                         RENTA VITALICIA                                  *** 
-- ------------------------------------------------------------------------------------------------ 

UNION ALL 

  SELECT
 DISTINCT
  '' AS STATIC
,UPPER(TO_HEX(SHA256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(CAST(PER.NUM_IDENTIFICACION AS STRING),15,'0'))))) HASH_ID
,REPLACE(REPLACE(TRIM(BE.GLS_MAIL),'\n',''),'\r','') AS CORREO
,'' AS TABLA_FUENTE
,1 AS PRIORIDAD_CORREO
,2 AS PRIORIDAD_FUENTE
,'02'                  AS ID_FUENTE
,(CASE WHEN BE.COD_PARENTEZCO = '80' THEN 'CONTRATANTE' ELSE 'BENEFICIARIO' END ) AS ROL
   FROM `iter-data-storage-pv-uat.rviadmin_data.personas_raw` PER
  INNER JOIN `iter-data-storage-pv-uat.rviadmin_data.ben_poliza_raw` BE 
        ON PER.cod_tipo_identificacion = BE.COD_TIPO_IDENTIFICACION
        AND PER.num_identificacion = BE.NUM_IDENTIFICACION 
  INNER JOIN `iter-data-storage-pv-uat.rviadmin_data.poliza_raw` POL 
        ON BE.COD_CARTERA = POL.COD_CARTERA 
        AND BE.NUM_POLIZA = POL.NUM_POLIZA
  INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL` EG1 
        ON PER.COD_TIPO_IDENTIFICACION = EG1.VALOR_ORIGEN 
        AND EG1.ID_FUENTE = '02' 
        AND EG1.CODIGO_TIPO = 'TIPODOC'
  INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO` AP 
        ON POL.COD_CARTERA = AP.ID_PRODUCTO 
        AND AP.ID_FUENTE = '02'
  
  WHERE POL.COD_CARTERA IN ('RVI','PRV', 'SCTR')
AND NULLIF(TRIM(BE.GLS_MAIL),'')  IS NOT NULL

-- ------------------------------------------------------------------------------------------------ 
-- ***                                            VIAJES                                        *** 
-- ------------------------------------------------------------------------------------------------ 


UNION ALL 
-- TAMBIEN HAY DUPLICADOS PERONAS QUE TIENEN DOS CORREOS ASOCIADOS
SELECT DISTINCT
'' AS STATIC
--,CORREO
,UPPER(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.numero_documento,15,'0'))))) HASH_ID
,REPLACE(REPLACE(TRIM(PER.correo),'\n',''),'\r','') AS CORREO
--,PER.documento
,'' TABLA_FUENTE
,1 AS PRIORIDAD_CORREO
,4 AS PRIORIDAD_FUENTE
,'07'  ID_FUENTE
,(CASE WHEN PER.flag_titular = '1' THEN 'CONTRATANTE' ELSE 'ASEGURADO' END ) AS ROL -- PREGUNTAR A TITO COMO ES EL PRODUCTO VIAJES
FROM  iter-data-storage-pv-uat.traveldb_data.cliente_venta_raw PER
  INNER JOIN iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL EG1 
          ON CAST(PER.tipo_documento AS STRING) = EG1.VALOR_ORIGEN
         AND EG1.ID_FUENTE = '07' AND EG1.CODIGO_TIPO = 'TIPODOC'
  INNER JOIN iter-data-storage-pv-uat.traveldb_data.venta_raw POL ON PER.id_venta = POL._id 
WHERE PER.flag_titular in ('0','1') 
         AND  POL.estado_venta_estado = '2'   --1-->CONTRATANTE   0 -->ASEGURADO
         AND NULLIF(TRIM(PER.correo),'')  IS NOT NULL
         AND NULLIF(TRIM(PER.numero_documento),'')  IS NOT NULL

-- ------------------------------------------------------------------------------------------------ 
-- ***                                           VEHICULAR                                      *** 
-- ------------------------------------------------------------------------------------------------ 

-- validar esto
UNION ALL
-- NO HAY DUPLICADOS A NIVEL DE HASH_ID
-- REVISAR HAY TABLA QUE DICE PROSPECTO TAMBIEN LO INCLUYO?
SELECT DISTINCT
'' AS STATIC
--,CORREO
,UPPER(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.document_number,15,'0'))))) HASH_ID
,REPLACE(REPLACE(TRIM(LOWER(CM2.electronic_address)),'\n',''),'\r','') AS CORREO
--,PER.documento
,'' TABLA_FUENTE
,1 AS PRIORIDAD_CORREO
,5 AS PRIORIDAD_FUENTE
,'08'  ID_FUENTE
,'CONTRATANTE' AS ROL -- PREGUNTAR A TITO COMO ES EL PRODUCTO VIAJES
FROM iter-data-storage-pv-uat.salvadb_data.client_raw PER
  INNER JOIN iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL EG1 
          ON CAST(PER.document_type_id AS STRING) = EG1.VALOR_ORIGEN 
         AND EG1.ID_FUENTE = '08' 
         AND EG1.CODIGO_TIPO = 'TIPODOC'
  INNER JOIN iter-data-storage-pv-uat.salvadb_data.account_raw AC 
          ON PER.id = AC.client_id
  INNER JOIN iter-data-storage-pv-uat.salvadb_data.policy_raw POL 
          ON AC.id = POL.account_id
  --LEFT JOIN salvadb_data.contact_mechanism_raw CM1 ON CM1.id = PER.phone_number_id AND CM1.contact_type_id = 'PHONE'
  LEFT JOIN  iter-data-storage-pv-uat.salvadb_data.contact_mechanism_raw CM2 ON CM2.id = PER.electronic_address_id AND CM2.contact_type_id = 'EMAIL'
  WHERE POL.status_id IN (2, 3, 4, 5, 6, 7)

-- ------------------------------------------------------------------------------------------------ 
-- ***                                            WEB SOAT                                      *** 
-- ------------------------------------------------------------------------------------------------ 

UNION ALL
-- EXISTEN DUPLICADOS -- UNA PERSONA CON MAS DE UN CORREO
SELECT DISTINCT
'' AS STATIC
--,CORREO
,UPPER(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.documento,15,'0'))))) HASH_ID
,REPLACE(REPLACE(TRIM(PER.email),'\n',''),'\r','') AS CORREO
--,PER.documento
,'' TABLA_FUENTE
,1 AS PRIORIDAD_CORREO
,6 AS PRIORIDAD_FUENTE
,'06'  ID_FUENTE
,'CONTRATANTE' AS ROL -- PREGUNTAR A TITO COMO ES EL PRODUCTO WEB SOAT
FROM  iter-data-storage-pv-uat.soat_data.ma_cliente_raw PER 
INNER JOIN iter-data-storage-pv-uat.soat_data.ma_venta_raw POL 
        ON PER.idcliente = POL.idcliente 
INNER JOIN iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL EG1 
        ON CAST(PER.idtipo_documento AS STRING) = EG1.VALOR_ORIGEN 
        AND EG1.ID_FUENTE = '06' 
        AND EG1.CODIGO_TIPO = 'TIPODOC'
WHERE   NULLIF(TRIM(PER.email),'')  IS NOT NULL
        AND NULLIF(TRIM(PER.DOCUMENTO),'')  IS NOT NULL
        AND POL.estado = 2 


-- ------------------------------------------------------------------------------------------------ 
-- ***                                         VIDACASH                                  *** 
-- ------------------------------------------------------------------------------------------------ 
UNION ALL
SELECT
 DISTINCT
  '' AS STATIC
,upper(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(CLI.NUMERO_DOCUMENTO,15,'0'))))) HASH_ID
,REPLACE(REPLACE(TRIM(CLI.EMAIL),'\n',''),'\r','') AS CORREO
,'' AS TABLA_FUENTE
,1 AS PRIORIDAD_CORREO
,7 AS PRIORIDAD_FUENTE
,'10' AS ID_FUENTE
,'CONTRATANTE' AS ROL 
FROM `iter-data-storage-pv-uat.vidacash_data.CLIENTE_raw` CLI
INNER JOIN `iter-data-storage-pv-uat.vidacash_data.POLIZA_raw` POL
      ON POL.ID_CLIENTE=CLI.ID_CLIENTE
INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL` EG1
      ON CAST (CLI.ID_TIPO_DOCUMENTO AS STRING) = EG1.VALOR_ORIGEN 
      AND EG1.ID_FUENTE = '10'  
      AND EG1.CODIGO_TIPO = 'TIPODOC'
WHERE NULLIF(TRIM(CLI.NUMERO_DOCUMENTO),'')  IS NOT NULL
      AND NULLIF(TRIM(POL.NUMERO_POLIZA),'') IS NOT NULL
      AND NULLIF(TRIM(CLI.EMAIL),'') IS NOT NULL
;

-- =================================================================================================
--                                         TELEFONO
-- =================================================================================================
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_TELEFONO`
AS
-- ------------------------------------------------------------------------------------------------ 
-- ***                                         ACSELE                                           *** 
-- ------------------------------------------------------------------------------------------------ 
WITH TMP_TELEFONOS AS 
(
SELECT  
 PNAT.static
    ,[STRUCT(PNAT.TELEFONO_1 AS TELEFONO_PERSONA,PNAT.TABLA_FUENTE_PNAT AS TABLA_FUENTE, 1 AS PRIORIDAD_TELEFONO)
    ,STRUCT(PNAT.TELEFONO_2,PNAT.TABLA_FUENTE_PNAT, 2 AS PRIORIDAD_TELEFONO)
    ,STRUCT(PNAT.TELEFONO_3 ,PNAT.TABLA_FUENTE_PNAT, 3 AS PRIORIDAD_TELEFONO)
    ,STRUCT(PNAT.DIR_CELULAR,PNAT.TABLA_FUENTE_DIR, 4 AS PRIORIDAD_TELEFONO)
    ,STRUCT(PNAT.DIR_TELEFONO,PNAT.TABLA_FUENTE_DIR, 5 AS PRIORIDAD_TELEFONO)] AS TELEFONO
FROM (
SELECT DISTINCT
PNAT.STATIC
,TRIM(REPLACE(PNAT.TELEFONOCELULARUNOINPUT,'\n',' '))  TELEFONO_1
,TRIM(REPLACE(PNAT.TELEFONOCELULARDOSINPUT,'\n',' ')) TELEFONO_2
,TRIM(REPLACE(PNAT.TELEFONOCELULARTRESINPUT,'\n',' ')) TELEFONO_3
,TRIM(REPLACE(DIR.TELEFONOINPUT,'\n',' ')) DIR_TELEFONO
,TRIM(REPLACE(DIR.TELEFONOCELULARINPUT,'\n',' ')) DIR_CELULAR
,'PERSONANATURAL' AS TABLA_FUENTE_PNAT
,'DIRECCION' AS TABLA_FUENTE_DIR
FROM `iter-data-storage-pv-uat.acsele_data.PERSONANATURAL_raw` PNAT
INNER JOIN iter-data-storage-pv-uat.acsele_data.STTE_THIRDPARTYADDRESSBOOK_raw TAB ON CAST(TAB.Tpt_Id AS STRING) = PNAT.static
INNER JOIN iter-data-storage-pv-uat.acsele_data.DIRECCION_raw DIR ON DIR.PK = CAST(TAB.IDDCO AS STRING)  
) PNAT
UNION ALL
SELECT  
 PJUR.static
    ,[STRUCT(PJUR.TELEFONO_1 AS TELEFONO_PERSONA,PJUR.TABLA_FUENTE_PJUR AS TABLA_FUENTE, 1 AS PRIORIDAD_TELEFONO)
    ,STRUCT(PJUR.TELEFONO_2,PJUR.TABLA_FUENTE_PJUR, 2 AS PRIORIDAD_TELEFONO)
    ,STRUCT(PJUR.TELEFONO_3 ,PJUR.TABLA_FUENTE_PJUR, 3 AS PRIORIDAD_TELEFONO)
    ,STRUCT(PJUR.DIR_CELULAR ,PJUR.TABLA_FUENTE_DIR, 4 AS PRIORIDAD_TELEFONO)
    ,STRUCT(PJUR.DIR_TELEFONO,PJUR.TABLA_FUENTE_DIR, 5 AS PRIORIDAD_TELEFONO)] AS TELEFONO
FROM (
  SELECT DISTINCT
  PJUR.STATIC
  ,CAST(NULL AS STRING) TELEFONO_1
  ,CAST(NULL AS STRING) TELEFONO_2
  ,CAST(NULL AS STRING) TELEFONO_3
  ,TRIM(REPLACE(DIR.TELEFONOINPUT,'\n',' ')) DIR_TELEFONO
  ,TRIM(REPLACE(DIR.TELEFONOCELULARINPUT,'\n',' ')) DIR_CELULAR
  ,'PERSONAJURIDICA' AS TABLA_FUENTE_PJUR
  ,'DIRECCION' AS TABLA_FUENTE_DIR
        FROM `iter-data-storage-pv-uat.acsele_data.PERSONAJURIDICA_raw` PJUR
  INNER JOIN `iter-data-storage-pv-uat.acsele_data.STTE_THIRDPARTYADDRESSBOOK_raw` TAB 
          ON CAST(TAB.Tpt_Id AS STRING) = PJUR.static
  INNER JOIN `iter-data-storage-pv-uat.acsele_data.DIRECCION_raw` DIR 
          ON DIR.PK = CAST(TAB.IDDCO AS STRING)  
  ) PJUR
)
SELECT
 DISTINCT
 TEL.STATIC
,CLI.HASH_ID
,REPLACE(REPLACE(TELEF.TELEFONO_PERSONA,'\n',''),'\r','') AS TELEFONO
,(CASE WHEN REGEXP_CONTAINS(TRIM(REPLACE(REPLACE(TELEF.TELEFONO_PERSONA,'\n',''),'\r','')),'(^9[0-9]{8})|(^(?:0519|519|\\+0519)[0-9]{8})')=True THEN True ELSE False END) AS FLAG_CELULAR
,TELEF.TABLA_FUENTE
,TELEF.PRIORIDAD_TELEFONO
,'PERSONA' AS ROL
,IF( TPAPV.HASH_ID IS NOT NULL,1,91 ) AS PRIORIDAD_FUENTE
,'01' AS ID_FUENTE
   FROM TMP_TELEFONOS TEL
,UNNEST(TELEFONO) TELEF
INNER JOIN `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DOCUMENTOS_CONTACTO` CLI
        ON TEL.STATIC = CLI.STATIC
  --WHERE TELEF.TELEFONO_PERSONA IS NOT NULL
 LEFT JOIN `iter-data-storage-pv-uat.temp.TMP_PERSONA_ACSELE_POLIZA_VIGENTE` TPAPV 
        ON CLI.HASH_ID=TPAPV.HASH_ID 
  WHERE  
  --TELEFONO
      REGEXP_CONTAINS(TRIM(TELEF.TELEFONO_PERSONA),'(^(?:01|001|1)-(?:(?:[0-9]{7}))$)')=True 
   OR REGEXP_CONTAINS(TRIM(TELEF.TELEFONO_PERSONA),'(^(?:01|001|1)(?:(?:[0-9]{7}))$)')=True 
   OR REGEXP_CONTAINS(TRIM(TELEF.TELEFONO_PERSONA),'(^(?:41|43|83|54|66|76|84|67|62|56|64|44|74|65|82|53|63|73|51|42|52|72|61)-(?:[0-9]{6})$)')=True 
   OR REGEXP_CONTAINS(TRIM(TELEF.TELEFONO_PERSONA),'(^(?:41|43|83|54|66|76|84|67|62|56|64|44|74|65|82|53|63|73|51|42|52|72|61)(?:[0-9]{6})$)')=True 
   OR REGEXP_CONTAINS(TRIM(TELEF.TELEFONO_PERSONA),'(^(?:041|043|083|054|066|076|084|067|062|056|064|044|074|065|082|053|063|073|051|042|052|072|061)-(?:[0-9]{6})$)')=True 
   OR REGEXP_CONTAINS(TRIM(TELEF.TELEFONO_PERSONA),'(^(?:041|043|083|054|066|076|084|067|062|056|064|044|074|065|082|053|063|073|051|042|052|072|061)(?:[0-9]{6})$)')=True
   --CELULAR
   OR REGEXP_CONTAINS(TRIM(TELEF.TELEFONO_PERSONA),'(^9[0-9]{8})|(^(?:0519|519|\\+0519)[0-9]{8})')=True
UNION ALL
-- ------------------------------------------------------------------------------------------------ 
-- ***                                         RENTA PARTICULAR                                 *** 
-- ------------------------------------------------------------------------------------------------ 
SELECT
DISTINCT 
 '' AS STATIC
,TAB.HASH_ID
,REPLACE(REPLACE(TEL.TELEFONO,'\n',''),'\r','') AS TELEFONO
,(CASE WHEN REGEXP_CONTAINS(TRIM(REPLACE(REPLACE(TEL.TELEFONO,'\n',''),'\r','')),'(^9[0-9]{8})|(^(?:0519|519|\\+0519)[0-9]{8})')=True THEN True ELSE False END) AS FLAG_CELULAR
,'' AS TABLA_FUENTE
,TEL.PRIORIDAD_TELEFONO
,TAB.ROL
,TAB.PRIORIDAD_FUENTE
,TAB.ID_FUENTE
FROM ( 
SELECT
-- DISTINCT
 upper(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.gls_nro_identificacion,15,'0'))))) HASH_ID
,'03'                   AS ID_FUENTE
,[STRUCT(NULLIF(NULLIF(TRIM(REPLACE(REPLACE(BEN.gls_telefono,'\r',''),'\n','')),'0'),'') AS TELEFONO,1 AS PRIORIDAD_TELEFONO) -- AS TELEFONO_1
,STRUCT(NULLIF(NULLIF(TRIM(REPLACE(REPLACE(BEN.gls_celular,'\n',''),'\r','')),'0'),''),2 )]  AS TELEFONOS
,(CASE WHEN BEN.cod_parentesco = '80' THEN 'CONTRATANTE' ELSE 'BENEFICIARIO' END ) AS ROL
,2 AS PRIORIDAD_FUENTE
FROM iter-data-storage-pv-uat.admwr_data.persona_raw PER
INNER JOIN iter-data-storage-pv-uat.admwr_data.poliza_raw POL 
        ON POL.cod_persona = PER.cod_persona
INNER JOIN iter-data-storage-pv-uat.admwr_data.beneficiario_raw BEN 
        ON BEN.cod_persona = PER.cod_persona 
       AND BEN.cod_poliza = POL.cod_poliza
INNER JOIN iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL EG1 
        ON PER.cod_tipo_identificacion = EG1.VALOR_ORIGEN 
       AND EG1.ID_FUENTE = '03' 
       AND EG1.CODIGO_TIPO = 'TIPODOC'
INNER JOIN iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO AP 
        ON POL.cod_tipo_producto = AP.ID_PRODUCTO 
       AND AP.ID_FUENTE = '03'
     WHERE POL.cod_tipo_producto IN ('RPP','IFP')
  --AND BEN.cod_parentesco = '80' 
       AND (NULLIF(TRIM(BEN.gls_telefono),'')  IS NOT NULL
        OR NULLIF(TRIM(BEN.gls_celular),'')  IS NOT NULL )
)TAB , UNNEST(TELEFONOS) TEL
WHERE TEL.TELEFONO IS NOT NULL

-- ------------------------------------------------------------------------------------------------ 
-- ***                                         RENTA VITALICIA                                  *** 
-- ------------------------------------------------------------------------------------------------ 
UNION ALL
SELECT
DISTINCT 
 '' AS STATIC
,TAB.HASH_ID
,REPLACE(REPLACE(TEL.TELEFONO,'\n',''),'\r','') AS TELEFONO
,(CASE WHEN REGEXP_CONTAINS(TRIM(REPLACE(REPLACE(TEL.TELEFONO,'\n',''),'\r','')),'(^9[0-9]{8})|(^(?:0519|519|\\+0519)[0-9]{8})')=True THEN True ELSE False END) AS FLAG_CELULAR
,'' AS TABLA_FUENTE
,TAB.PRIORIDAD_TELEFONO
,TAB.ROL
,TAB.PRIORIDAD_FUENTE
,TAB.ID_FUENTE
FROM ( 
  SELECT
   '' AS STATIC
 ,UPPER(TO_HEX(SHA256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(CAST(PER.NUM_IDENTIFICACION AS STRING),15,'0'))))) HASH_ID
,[STRUCT(NULLIF(NULLIF(TRIM(REPLACE(REPLACE(DIR.NUM_TELEFONO,'\r',''),'\n','')),'0'),'') AS TELEFONO) -- AS TELEFONO_1
]  AS TELEFONO
,(CASE WHEN BE.COD_PARENTEZCO = '80' THEN 'CONTRATANTE' ELSE 'BENEFICIARIO' END ) AS ROL
,2 AS PRIORIDAD_FUENTE
, 1 PRIORIDAD_TELEFONO
 ,'02'                   AS ID_FUENTE
  FROM `iter-data-storage-pv-uat.rviadmin_data.personas_raw` PER
  INNER JOIN `iter-data-storage-pv-uat.rviadmin_data.ben_poliza_raw` BE 
        ON PER.cod_tipo_identificacion = BE.COD_TIPO_IDENTIFICACION
        AND PER.num_identificacion = BE.NUM_IDENTIFICACION 
  INNER JOIN `iter-data-storage-pv-uat.rviadmin_data.poliza_raw` POL 
        ON BE.COD_CARTERA = POL.COD_CARTERA 
        AND BE.NUM_POLIZA = POL.NUM_POLIZA
  INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL` EG1 
        ON PER.COD_TIPO_IDENTIFICACION = EG1.VALOR_ORIGEN 
        AND EG1.ID_FUENTE = '02' 
        AND EG1.CODIGO_TIPO = 'TIPODOC'
  INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO` AP 
        ON POL.COD_CARTERA = AP.ID_PRODUCTO 
        AND AP.ID_FUENTE = '02'
   LEFT JOIN `iter-data-storage-pv-uat.rviadmin_data.direcciones_raw` DIR 
        ON DIR.COD_TIPO_IDENTIFICACION = PER.COD_TIPO_IDENTIFICACION 
        AND DIR.NUM_IDENTIFICACION = PER.NUM_IDENTIFICACION
  WHERE POL.COD_CARTERA IN ('RVI','PRV', 'SCTR')
  AND (NULLIF(TRIM(DIR.NUM_TELEFONO),'')  IS NOT NULL)
)
TAB , UNNEST(TELEFONO) TEL
WHERE TEL.TELEFONO IS NOT NULL

-- ------------------------------------------------------------------------------------------------ 
-- ***                                            VIAJES                                        *** 
-- ------------------------------------------------------------------------------------------------ 
UNION ALL
-- REVISAR ESTA PARTE DUPLICADOS Y DEMAS 
SELECT DISTINCT
'' AS STATIC
,UPPER(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.numero_documento,15,'0'))))) AS HASH_ID
,NULLIF(NULLIF(TRIM(REPLACE(REPLACE(PER.TELEFONO,'\n',''),'\r','')),'0'),'')  AS TELEFONO
,(CASE WHEN REGEXP_CONTAINS(TRIM(REPLACE(REPLACE(PER.TELEFONO,'\n',''),'\r','')),'(^9[0-9]{8})|(^(?:0519|519|\\+0519)[0-9]{8})')=True THEN True ELSE False END) AS FLAG_CELULAR
--,PER.documento
,'' TABLA_FUENTE
,1 PRIORIDAD_TELEFONO
,(CASE WHEN PER.flag_titular = '1' THEN 'CONTRATANTE' ELSE 'ASEGURADO' END ) AS ROL
,4 AS PRIORIDAD_FUENTE
,'07'  ID_FUENTE
FROM  iter-data-storage-pv-uat.traveldb_data.cliente_venta_raw PER
  INNER JOIN  iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL EG1 
          ON CAST(PER.tipo_documento AS STRING) = EG1.VALOR_ORIGEN
         AND EG1.ID_FUENTE = '07' AND EG1.CODIGO_TIPO = 'TIPODOC'
  INNER JOIN  iter-data-storage-pv-uat.traveldb_data.venta_raw POL ON PER.id_venta = POL._id 
WHERE PER.flag_titular in ('0','1') 
         AND  POL.estado_venta_estado = '2'   --1-->CONTRATANTE   0 -->ASEGURADO
         AND NULLIF(TRIM(PER.numero_documento),'')  IS NOT NULL

-- ------------------------------------------------------------------------------------------------ 
-- ***                                           VEHICULAR                                      *** 
-- ------------------------------------------------------------------------------------------------ 

UNION ALL

SELECT DISTINCT
'' AS STATIC
--,CORREO
,UPPER(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.document_number,15,'0'))))) HASH_ID
,NULLIF(NULLIF(TRIM(REPLACE(REPLACE(CM1.phone_number,'\n',''),'\r','')),'0'),'')  AS TELEFONO
--,PER.documento
,(CASE WHEN REGEXP_CONTAINS(TRIM(REPLACE(REPLACE(CM1.phone_number,'\n',''),'\r','')),'(^9[0-9]{8})|(^(?:0519|519|\\+0519)[0-9]{8})')=True THEN True ELSE False END) AS FLAG_CELULAR
,'' TABLA_FUENTE
,1 PRIORIDAD_TELEFONO
,'CONTRATANTE' AS ROL 
,5 AS PRIORIDAD_FUENTE
,'08'  ID_FUENTE
FROM  iter-data-storage-pv-uat.salvadb_data.client_raw PER
  INNER JOIN  iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL EG1 
          ON CAST(PER.document_type_id AS STRING) = EG1.VALOR_ORIGEN 
         AND EG1.ID_FUENTE = '08' 
         AND EG1.CODIGO_TIPO = 'TIPODOC'
  INNER JOIN  iter-data-storage-pv-uat.salvadb_data.account_raw AC 
          ON PER.id = AC.client_id
  INNER JOIN  iter-data-storage-pv-uat.salvadb_data.policy_raw POL 
          ON AC.id = POL.account_id
  LEFT JOIN  iter-data-storage-pv-uat.salvadb_data.contact_mechanism_raw CM1 ON CM1.id = PER.phone_number_id AND CM1.contact_type_id = 'PHONE'
  --LEFT JOIN salvadb_data.contact_mechanism_raw CM2 ON CM2.id = PER.electronic_address_id AND CM2.contact_type_id = 'EMAIL'
  WHERE POL.status_id IN (2, 3, 4, 5, 6, 7)
        AND NULLIF(TRIM(PER.document_number),'')  IS NOT NULL

-- ------------------------------------------------------------------------------------------------ 
-- ***                                            WEB SOAT                                      *** 
-- ------------------------------------------------------------------------------------------------ 
UNION ALL 

SELECT 
DISTINCT
 '' AS STATIC
,TAB.HASH_ID
,REPLACE(REPLACE(TEL.TELEFONO,'\n',''),'\r','') AS TELEFONO
,(CASE WHEN REGEXP_CONTAINS(TRIM(REPLACE(REPLACE(TEL.TELEFONO,'\n',''),'\r','')),'(^9[0-9]{8})|(^(?:0519|519|\\+0519)[0-9]{8})')=True THEN True ELSE False END) AS FLAG_CELULAR
,'' AS TABLA_FUENTE
,TEL.PRIORIDAD_TELEFONO
,TAB.ROL
,TAB.PRIORIDAD_FUENTE
,TAB.ID_FUENTE
FROM (
  SELECT
-- DISTINCT
 upper(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.documento,15,'0'))))) HASH_ID
,'06'                   AS ID_FUENTE
,[STRUCT(NULLIF(NULLIF(TRIM(REPLACE(REPLACE(POL.telefonofijo,'\r',''),'\n','')),'0'),'') AS TELEFONO,1 AS PRIORIDAD_TELEFONO) -- AS TELEFONO_1
,STRUCT(NULLIF(NULLIF(TRIM(REPLACE(REPLACE(POL.celular,'\n',''),'\r','')),'0'),''),2 )]  AS TELEFONOS
, 'CONTRATANTE' ROL
,6 AS PRIORIDAD_FUENTE
FROM iter-data-storage-pv-uat.soat_data.ma_cliente_raw PER 
INNER JOIN iter-data-storage-pv-uat.soat_data.ma_venta_raw POL 
        ON PER.idcliente = POL.idcliente 
INNER JOIN iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL EG1 
        ON CAST(PER.idtipo_documento AS STRING) = EG1.VALOR_ORIGEN 
        AND EG1.ID_FUENTE = '06' 
        AND EG1.CODIGO_TIPO = 'TIPODOC'
WHERE   NULLIF(TRIM(PER.email),'')  IS NOT NULL
        AND NULLIF(TRIM(PER.documento),'')  IS NOT NULL
        AND POL.estado = 2 
       AND (NULLIF(TRIM(POL.telefonofijo),'')  IS NOT NULL
        OR NULLIF(TRIM(POL.celular),'')  IS NOT NULL )
)TAB , UNNEST(TELEFONOS) TEL



-- ------------------------------------------------------------------------------------------------ 
-- ***                                         VIDACASH                                  *** 
-- ------------------------------------------------------------------------------------------------ 
UNION ALL

SELECT
 DISTINCT
  '' AS STATIC
,upper(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(CLI.NUMERO_DOCUMENTO,15,'0'))))) HASH_ID
,NULLIF(NULLIF(TRIM(REPLACE(REPLACE(CLI.NUMERO_TELEFONO,'\n',''),'\r','')),'0'),'')  AS TELEFONO
,(CASE WHEN REGEXP_CONTAINS(TRIM(REPLACE(REPLACE(CLI.NUMERO_TELEFONO,'\n',''),'\r','')),'(^9[0-9]{8})|(^(?:0519|519|\\+0519)[0-9]{8})')=True THEN True ELSE False END) AS FLAG_CELULAR
,'' AS TABLA_FUENTE
,1 AS PRIORIDAD_TELEFONO
,'CONTRATANTE' AS ROL 
,7 AS PRIORIDAD_FUENTE
,'10' AS ID_FUENTE
FROM `iter-data-storage-pv-uat.vidacash_data.CLIENTE_raw` CLI
INNER JOIN `iter-data-storage-pv-uat.vidacash_data.POLIZA_raw` POL
      ON POL.ID_CLIENTE=CLI.ID_CLIENTE
INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL` EG1
      ON CAST (CLI.ID_TIPO_DOCUMENTO AS STRING) = EG1.VALOR_ORIGEN 
      AND EG1.ID_FUENTE = '10'  
      AND EG1.CODIGO_TIPO = 'TIPODOC'
WHERE NULLIF(TRIM(CLI.NUMERO_DOCUMENTO),'')  IS NOT NULL
      AND NULLIF(TRIM(POL.NUMERO_POLIZA),'') IS NOT NULL
      AND NULLIF(TRIM(CLI.NUMERO_TELEFONO),'') IS NOT NULL
;

-- =================================================================================================
--                                         DIRECCION
-- =================================================================================================

-- ------------------------------------------------------------------------------------------------ 
-- ***                                         ACSELE                                           *** 
-- ------------------------------------------------------------------------------------------------ 

-- ----------------------------------------------------------------------
-- Paso A13: PERSONA - DIRECCIONES
-- ----------------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DIRECCION`
AS
SELECT
  DISTINCT
 CAST(TAB.Tpt_Id AS STRING) STATIC
,CLI.HASH_ID
,DIR.CODPAISINPUT               AS PAIS
,DIR.TIPODIRECCIONTERCEROINPUT  AS TIPO_DIRECCION
,NULLIF(TRIM(REPLACE(REPLACE(REPLACE(REPLACE(DIR.DESCRIPCIONDIRECCIONINPUT,'_',''),'-',''),'\n',' '),'\r',' ')),'')  AS DIRECCION
,DIR.CODDEPARTAMENTOINPUT       AS CODIGO_DEPARTAMENTO
,IFNULL(NULLIF(TRIM(DIR.DEPARTAMENTOINPUT),''),UBB.DEPARTAMENTO) AS DEPARTAMENTO
,DIR.CODPROVINCIAINPUT          AS CODIGO_PROVINCIA
,IFNULL(NULLIF(TRIM(DIR.PROVINCIAINPUT),''),UBB.PROVINCIA) AS PROVINCIA
,DIR.CODDISTRITOINPUT           AS CODIGO_DISTRITO
,IFNULL(NULLIF(TRIM(DIR.DISTRITOINPUT),''),UBB.DISTRITO) AS DISTRITO
,'DIRECCION' AS TABLA_FUENTE
, 1 AS PRIORIDAD_FUENTE
,'01' AS ID_FUENTE
,CASE  WHEN TAB.ISDEFAULTADDRESS =1 THEN True ELSE False END AS FLAG_PRINCIPAL
,CASE  WHEN TAB.TAB_STATUS =1 THEN 'ACTIVO' ELSE 'INACTIVO'  END AS ESTADO
,'PERSONA' AS ROL
FROM `iter-data-storage-pv-uat.acsele_data.STTE_THIRDPARTYADDRESSBOOK_raw` TAB 
INNER JOIN `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DOCUMENTOS_CONTACTO` CLI
        ON CLI.STATIC = CAST(TAB.Tpt_Id AS STRING)
 LEFT JOIN `iter-data-storage-pv-uat.acsele_data.DIRECCION_raw` DIR 
        ON DIR.PK = CAST(TAB.IDDCO AS STRING)
 LEFT JOIN `iter-data-storage-pv-uat.external_data.UBIGEO`  UBB
        ON UBB.COD_UBIGEO = TRIM(DIR.CODDISTRITOINPUT)
-- ------------------------------------------------------------------------------------------------ 
-- ***                                         RENTA PARTICULAR                                 *** 
-- ------------------------------------------------------------------------------------------------ 
UNION ALL

SELECT DISTINCT
'' AS STATIC
,upper(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.gls_nro_identificacion,15,'0'))))) HASH_ID
,'' AS PAIS
,'' AS TIPO_DIRECCION
,CONCAT(UPPER(DIR.gls_direccion), ' ', UPPER(IFNULL(DIR.cod_espacio_urbano, ''))) AS DIRECCION
,'' AS CODIGO_DEPARTAMENTO
,DIS.inter_departamentoName AS DEPARTAMENTO
,'' AS CODIGO_PROVINCIA
,DIS.inter_provinciaName    AS PROVINCIA
,'' AS CODIGO_DISTRITO
,DIS.inter_name             AS DISTRITO
,'DIRECCION' AS TABLA_FUENTE
,2 AS PRIORIDAD_FUENTE
,'03'        AS ID_FUENTE
,True AS FLAG_PRINCIPAL
,CASE WHEN CAST(DIR.ind_vigencia AS STRING) = 'true' THEN 'ACTIVO' ELSE 'INACTIVO' END ESTADO
--,1 AS PRIORIDAD_DIRECCION
,(CASE WHEN BEN.cod_parentesco = '80' THEN 'CONTRATANTE' ELSE 'BENEFICIARIO' END ) AS ROL
      FROM `iter-data-storage-pv-uat.admwr_data.persona_raw` PER
INNER JOIN `iter-data-storage-pv-uat.admwr_data.poliza_raw` POL 
        ON POL.cod_persona = PER.cod_persona
INNER JOIN `iter-data-storage-pv-uat.admwr_data.beneficiario_raw` BEN 
        ON BEN.cod_persona = PER.cod_persona 
       AND BEN.cod_poliza  = POL.cod_poliza
 LEFT JOIN `iter-data-storage-pv-uat.admwr_data.direccion_raw` DIR 
        ON DIR.cod_beneficiario = BEN.cod_beneficiario
INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL` EG1 
        ON PER.cod_tipo_identificacion = EG1.VALOR_ORIGEN 
       AND EG1.ID_FUENTE = '03' 
       AND EG1.CODIGO_TIPO = 'TIPODOC'
 LEFT JOIN `iter-data-storage-pv-uat.crm_data.inter_distrito_raw` DIS 
        ON DIS.inter_distritoId = UPPER(DIR.cod_distrito)
INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO` AP 
        ON POL.cod_tipo_producto = AP.ID_PRODUCTO 
       AND AP.ID_FUENTE = '03'
     WHERE POL.cod_tipo_producto IN ('RPP','IFP') 
       AND NULLIF(TRIM(CONCAT(UPPER(DIR.gls_direccion), ' ', UPPER(IFNULL(DIR.cod_espacio_urbano, '')))),'') IS NOT NULL
--AND BEN.cod_parentesco = '80'


-- ------------------------------------------------------------------------------------------------ 
-- ***                                         RENTA VITALICIA                                  *** 
-- ------------------------------------------------------------------------------------------------ 
 UNION ALL
  SELECT
DISTINCT
'' AS STATIC
,UPPER(TO_HEX(SHA256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(CAST(PER.NUM_IDENTIFICACION AS STRING),15,'0'))))) HASH_ID
,'' AS PAIS
,'' AS TIPO_DIRECCION
,  DIR.GLS_DIRECCION DIRECCION
,'' AS CODIGO_DEPARTAMENTO
,DIS.gls_larga AS DEPARTAMENTO
,'' AS CODIGO_PROVINCIA
,DIS.gls_larga    AS PROVINCIA
,'' AS CODIGO_DISTRITO
,DIS.gls_larga             AS DISTRITO
,'DIRECCION' AS TABLA_FUENTE
,2 AS PRIORIDAD_FUENTE
,'02'        AS ID_FUENTE
,TRUE AS FLAG_PRINCIPAL
,CASE WHEN CAST(DIR.IND_VIGENCIA AS STRING) = 'S' THEN 'ACTIVO' ELSE 'INACTIVO' END ESTADO
,(CASE WHEN BE.COD_PARENTEZCO = '80' THEN 'CONTRATANTE' ELSE 'BENEFICIARIO' END ) AS ROL
  FROM `iter-data-storage-pv-uat.rviadmin_data.personas_raw` PER
  INNER JOIN `iter-data-storage-pv-uat.rviadmin_data.ben_poliza_raw` BE 
        ON PER.cod_tipo_identificacion = BE.COD_TIPO_IDENTIFICACION
        AND PER.num_identificacion = BE.NUM_IDENTIFICACION 
  INNER JOIN `iter-data-storage-pv-uat.rviadmin_data.poliza_raw` POL 
        ON BE.COD_CARTERA = POL.COD_CARTERA 
        AND BE.NUM_POLIZA = POL.NUM_POLIZA
  INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL` EG1 
        ON PER.COD_TIPO_IDENTIFICACION = EG1.VALOR_ORIGEN 
        AND EG1.ID_FUENTE = '02' 
        AND EG1.CODIGO_TIPO = 'TIPODOC'
  INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO` AP 
        ON POL.COD_CARTERA = AP.ID_PRODUCTO 
        AND AP.ID_FUENTE = '02'
   LEFT JOIN `iter-data-storage-pv-uat.rviadmin_data.direcciones_raw` DIR 
        ON DIR.COD_TIPO_IDENTIFICACION = PER.COD_TIPO_IDENTIFICACION 
        AND DIR.NUM_IDENTIFICACION = PER.NUM_IDENTIFICACION
  LEFT JOIN `iter-data-storage-pv-uat.rviadmin_data.tab_codigo_raw` DIS 
        ON DIR.COD_COMUNA = DIS.COD_CODIGO 
        AND DIS.NOM_TABLA = 'COMUNA'
  LEFT JOIN `iter-data-storage-pv-uat.rviadmin_data.tab_codigo_raw` PRV 
        ON DIR.COD_CIUDAD = PRV.COD_CODIGO 
        AND PRV.NOM_TABLA = 'CIUDAD'
  LEFT JOIN `iter-data-storage-pv-uat.rviadmin_data.tab_codigo_raw` DPT 
        ON DIR.GLS_DEPARTAMENTO = DPT.COD_CODIGO 
        AND DPT.NOM_TABLA = 'DEPART'
    WHERE POL.COD_CARTERA IN ('RVI','PRV', 'SCTR')
     AND UPPER(IFNULL(DIR.gls_direccion, '')) IS NOT NULL
-- ------------------------------------------------------------------------------------------------ 
-- ***                                            VIAJES                                        *** 
-- ------------------------------------------------------------------------------------------------ 
--no hay direcciones xd
-- ------------------------------------------------------------------------------------------------ 
-- ***                                           VEHICULAR                                      *** 
-- ------------------------------------------------------------------------------------------------ 
UNION ALL 
SELECT DISTINCT
'' AS STATIC
--,CORREO
,UPPER(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.document_number,15,'0'))))) HASH_ID
,'' AS PAIS
,'' AS TIPO_DIRECCION
,UPPER(PER.address) AS DIRECCION
,'' AS CODIGO_DEPARTAMENTO
,'' AS DEPARTAMENTO
,'' AS CODIGO_PROVINCIA
,'' AS PROVINCIA
,'' AS CODIGO_DISTRITO
,'' AS DISTRITO
,'DIRECCION' AS TABLA_FUENTE
,5 AS PRIORIDAD_FUENTE
,'08'  ID_FUENTE
,True AS FLAG_PRINCIPAL
--,CASE WHEN CAST(DIR.ind_vigencia AS STRING) = 'true' THEN 'ACTIVO' ELSE 'INACTIVO' END ESTADO
,'' AS ESTADO
--,1 AS PRIORIDAD_DIRECCION
,'CONTRATANTE' AS ROL
FROM  iter-data-storage-pv-uat.salvadb_data.client_raw PER
  INNER JOIN  iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL EG1 
          ON CAST(PER.document_type_id AS STRING) = EG1.VALOR_ORIGEN 
         AND EG1.ID_FUENTE = '08' 
         AND EG1.CODIGO_TIPO = 'TIPODOC'
  INNER JOIN  iter-data-storage-pv-uat.salvadb_data.account_raw AC 
          ON PER.id = AC.client_id
  INNER JOIN  iter-data-storage-pv-uat.salvadb_data.policy_raw POL 
          ON AC.id = POL.account_id
  WHERE POL.status_id IN (2, 3, 4, 5, 6, 7)
        AND NULLIF(TRIM(PER.document_number),'')  IS NOT NULL

-- ------------------------------------------------------------------------------------------------ 
-- ***                                            WEB SOAT                                      *** 
-- ------------------------------------------------------------------------------------------------ 

UNION ALL 

-- SE CONSIDERO LAS DIRECCIONES PRINCIPALES Y NO LAS DE ENTREGA 
SELECT DISTINCT
'' AS STATIC
--,CORREO
,UPPER(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(PER.documento,15,'0'))))) HASH_ID
,'' AS PAIS
,'' AS TIPO_DIRECCION
,UPPER(PER.direccion) AS DIRECCION
,'' AS CODIGO_DEPARTAMENTO
,PER.departamento AS DEPARTAMENTO
,'' AS CODIGO_PROVINCIA
,PER.provincia    AS PROVINCIA
,'' AS CODIGO_DISTRITO
,PER.distrito             AS DISTRITO
,'DIRECCION' AS TABLA_FUENTE
,6 AS PRIORIDAD_FUENTE
,'06'  ID_FUENTE
,True AS FLAG_PRINCIPAL
--,CASE WHEN CAST(DIR.ind_vigencia AS STRING) = 'true' THEN 'ACTIVO' ELSE 'INACTIVO' END ESTADO
,'' AS ESTADO
--,1 AS PRIORIDAD_DIRECCION
,'CONTRATANTE' AS ROL
FROM  iter-data-storage-pv-uat.soat_data.ma_cliente_raw PER 
INNER JOIN iter-data-storage-pv-uat.soat_data.ma_venta_raw POL 
        ON PER.idcliente = POL.idcliente 
INNER JOIN iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL EG1 
        ON CAST(PER.idtipo_documento AS STRING) = EG1.VALOR_ORIGEN 
        AND EG1.ID_FUENTE = '06' 
        AND EG1.CODIGO_TIPO = 'TIPODOC'
  WHERE NULLIF(TRIM(PER.DOCUMENTO),'')  IS NOT NULL
        AND POL.estado = 2 
        AND NULLIF(TRIM(UPPER(PER.direccion)),'') IS NOT NULL


-- ------------------------------------------------------------------------------------------------ 
-- ***                                         VIDACASH                                  *** 
-- ------------------------------------------------------------------------------------------------ 
UNION ALL 
SELECT DISTINCT
'' AS STATIC
,UPPER(to_hex(sha256(CONCAT(EG1.CODIGO_CORPORATIVO,LPAD(CLI.NUMERO_DOCUMENTO,15,'0'))))) HASH_ID
,'' AS PAIS
,'' AS TIPO_DIRECCION
,UPPER(CLI.DIRECCION) AS DIRECCION
,'' AS CODIGO_DEPARTAMENTO
,'' AS DEPARTAMENTO
,'' AS CODIGO_PROVINCIA
,'' AS PROVINCIA
,'' AS CODIGO_DISTRITO
,'' AS DISTRITO
,'' AS TABLA_FUENTE
,7 AS PRIORIDAD_FUENTE
,'10' AS ID_FUENTE
,True AS FLAG_PRINCIPAL
,'' AS ESTADO
,'CONTRATANTE' AS ROL 
FROM `iter-data-storage-pv-uat.vidacash_data.CLIENTE_raw` CLI
INNER JOIN `iter-data-storage-pv-uat.vidacash_data.POLIZA_raw` POL
      ON POL.ID_CLIENTE=CLI.ID_CLIENTE
INNER JOIN `iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL` EG1
      ON CAST (CLI.ID_TIPO_DOCUMENTO AS STRING) = EG1.VALOR_ORIGEN 
      AND EG1.ID_FUENTE = '10'  
      AND EG1.CODIGO_TIPO = 'TIPODOC'
WHERE NULLIF(TRIM(CLI.NUMERO_DOCUMENTO),'')  IS NOT NULL
      AND NULLIF(TRIM(POL.NUMERO_POLIZA),'') IS NOT NULL
      AND NULLIF(TRIM(CLI.DIRECCION),'') IS NOT NULL
;

-- ================================================================================================ 
-- ***                [  TABLA FINAL ] - MD_PERSONA_CONTACTO                                    *** 
-- ================================================================================================ 
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.master_party.MD_PERSONA_CONTACTO`
AS
WITH  TMP_DIRECCIONES AS
(
SELECT HASH_ID,
ARRAY_AGG(STRUCT(
         PAIS
        ,TIPO_DIRECCION
        ,DIRECCION
        ,CODIGO_DEPARTAMENTO
        ,DEPARTAMENTO
        ,CODIGO_PROVINCIA
        ,PROVINCIA
        ,CODIGO_DISTRITO
        ,DISTRITO
        ,TABLA_FUENTE
        ,PRIORIDAD_FUENTE
        ,FLAG_PRINCIPAL
        ,ESTADO
        ,ID_FUENTE
)  ORDER BY PRIORIDAD_FUENTE ASC
    --     , PRIORIDAD_DIRECCION ASC
) AS DIRECCIONES
  FROM `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DIRECCION`
 -- WHERE DIRECCION IS NOT NULL
GROUP BY HASH_ID 
),
TMP_TELEFONOS AS (
SELECT HASH_ID,
ARRAY_AGG(STRUCT(
         TELEFONO
        ,FLAG_CELULAR
        ,PRIORIDAD_TELEFONO
        ,PRIORIDAD_FUENTE
        ,ID_FUENTE
)ORDER BY PRIORIDAD_FUENTE ASC
         , PRIORIDAD_TELEFONO ASC
) AS TELEFONOS
  FROM `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_TELEFONO`
  WHERE TELEFONO IS NOT NULL
GROUP BY HASH_ID

),
TMP_CORREOS AS (
SELECT HASH_ID,
ARRAY_AGG(STRUCT(
 CORREO
,PRIORIDAD_CORREO
,PRIORIDAD_FUENTE
,ID_FUENTE
) ORDER BY PRIORIDAD_FUENTE ASC
         , PRIORIDAD_CORREO ASC
) AS CORREOS
FROM `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_CORREO`
 WHERE CORREO IS NOT NULL
GROUP BY HASH_ID
)
SELECT 
 DOC.HASH_ID
,COR.CORREOS 
,TEL.TELEFONOS 
,DIR.DIRECCIONES
FROM (
SELECT DISTINCT TAB.HASH_ID 
FROM (
         SELECT HASH_ID
         FROM `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DOCUMENTOS_CONTACTO`
         UNION ALL 
         SELECT HASH_ID
         FROM `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DIRECCION`
         UNION ALL 
         SELECT HASH_ID
         FROM `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_CORREO`
         UNION ALL 
         SELECT HASH_ID
         FROM `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_TELEFONO`
)TAB
) DOC 
LEFT JOIN TMP_DIRECCIONES DIR 
        ON DOC.HASH_ID=DIR.HASH_ID
LEFT JOIN TMP_TELEFONOS TEL 
        ON DOC.HASH_ID=TEL.HASH_ID
LEFT JOIN TMP_CORREOS   COR 
        ON DOC.HASH_ID=COR.HASH_ID
;

-- ----------------------------------------------------------------------
-- Eliminar tablas Temporales
-- ----------------------------------------------------------------------
 DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_TELEFONO` ; 
 DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DIRECCION` ; 
 DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_CORREO` ; 
 DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_ACSELE_PERSONA_DOCUMENTOS_CONTACTO`;

SELECT 'OK' AS ESTADO;

END;