CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_bi_cobranza_dv_rechazos_vida()
BEGIN

/********************************************************************
* Proyecto		    : GOLDEN RECORD
* Fecha			    : 11 / 04 / 2022
* Autor			    : Tito Ramirez
*                   : Geraldidne Jayo                               
* Descripción   : Cargar los motivos de rechazos de bancos.                  
*********************************************************************
*                       MODIFICACIONES POSTERIORES                  *
*===================================================================*
*=  Fecha   | Persona |           Modificación Realizada           =*
*===================================================================*
* 
*********************************************************************/

CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.bi_cobranza.DV_RECHAZOS_VIDA`
AS
SELECT
B.BANCO_RECHAZO,
UPPER(TRIM(B.MOTIVO_RECHAZO))   AS MOTIVO_RECHAZO,
COALESCE(T.MENSAJE_HOMOLOGADO,'<SIN DEFINIR>') AS MENSAJE_HOMOLOGADO,
TRIM(B.NUMERO_POLIZA)           AS NUMERO_POLIZA, 
TRIM(B.NUMERO_TARJETA)          AS NUMERO_TARJETA,
COALESCE(B.FECHA_TRANSACCION,B.FECHA_ARCHIVO,B.FECHA_PROCESO) AS FECHA_TRANSACCION,
B.NOMBRE_ARCHIVO,
CURRENT_DATE("America/Lima") AS FECHA_PROCESO
FROM 
(
---------------------------------------------------
---                 BANCO AMEX                  ---
---------------------------------------------------
SELECT BANCO_RECHAZO  
,LPAD(DESCRIPCION_RET,400,' ') AS MOTIVO_RECHAZO
,CLIENTE AS NUMERO_POLIZA 
,SUBSTR(TARJETA, 2) AS NUMERO_TARJETA
,NOMBRE_ARCHIVO
,CAST(NULL AS DATE) AS FECHA_TRANSACCION
,DATE(CAST(FECHA_PROCESO AS TIMESTAMP),'America/Lima') AS FECHA_PROCESO
,SAFE.PARSE_DATE("%d%m%Y",SPLIT(NOMBRE_ARCHIVO,'_')[SAFE_ORDINAL(1)]) AS FECHA_ARCHIVO
 FROM `iter-data-storage-pv-uat.salomon_data.RECHAZOS_BANCO_AMEX` 
UNION ALL 
---------------------------------------------------
---                 BANCO BBVA                  ---
---------------------------------------------------
SELECT  BANCO_RECHAZO
,MSJ_DEVOLUCION AS MOTIVO_RECHAZO
--,SUBSTRING(NOMBRE_CLI,7,11) AS   NUMERO_POLIZA
,CASE WHEN LENGTH(trim(substr(SUBSTRING(NOMBRE_CLI,7,11), instr(SUBSTRING(NOMBRE_CLI,7,11),' '))) )=11 THEN trim(substr(SUBSTRING(NOMBRE_CLI,8,10), instr(SUBSTRING(NOMBRE_CLI,8,10),' '))) 
ELSE trim(substr(SUBSTRING(NOMBRE_CLI,7,11), instr(SUBSTRING(NOMBRE_CLI,7,11),' ')))  END NUMERO_POLIZA
,'' AS NUMERO_TARJETA
,NOMBRE_ARCHIVO
,CAST(NULL AS DATE) AS FECHA_TRANSACCION
,DATE(CAST(FECHA_PROCESO AS TIMESTAMP),'America/Lima') AS FECHA_PROCESO
,CAST(NULL AS DATE) AS FECHA_ARCHIVO
 FROM `iter-data-storage-pv-uat.salomon_data.RECHAZOS_BANCO_BBVA`
UNION ALL
---------------------------------------------------
---                 BANCO BCP                   ---
---------------------------------------------------
SELECT  BANCO_RECHAZO
,DESRET AS MOTIVO_RECHAZO
,CODUSU AS NUMERO_POLIZA
,CUENTA --HAY OTRA CUENTA DE ABONO
,NOMBRE_ARCHIVO
,SAFE.PARSE_DATE("%Y%m%d",FECPRO) AS FECHA_TRANSACCION
,DATE(CAST(FECHA_PROCESO AS TIMESTAMP),'America/Lima') AS FECHA_PROCESO
,CAST(NULL AS DATE) AS FECHA_ARCHIVO
 FROM `iter-data-storage-pv-uat.salomon_data.RECHAZOS_BANCO_BCP`
WHERE SUCOPE='000'
UNION ALL 
---------------------------------------------------
---                 BANCO IBK                   ---
---------------------------------------------------
SELECT  BANCO_RECHAZO
,DETALLE_ESTADO
,COD_USUARIO_CLI AS NUMERO_POLIZA 
,'' AS NUMERO_TARJETA
,NOMBRE_ARCHIVO
,SAFE.PARSE_DATE("%Y%m%d",FECHA_PROCESO_IBK) AS FECHA_TRANSACCION
,DATE(CAST(FECHA_PROCESO AS TIMESTAMP),'America/Lima') AS FECHA_PROCESO
,SAFE.PARSE_DATE("%Y%m%d",SPLIT(NOMBRE_ARCHIVO,'_')[SAFE_ORDINAL(2)]) AS FECHA_ARCHIVO 
 FROM `iter-data-storage-pv-uat.salomon_data.RECHAZOS_BANCO_IBK`
 WHERE TIPO_REGISTRO='02'
UNION ALL 
---------------------------------------------------
---               BANCO MASTERCARD              ---
---------------------------------------------------
SELECT  BANCO_RECHAZO
,MSJ_RESPUESTA
,COD_USUARIO AS NUMERO_POLIZA
,NRO_TARJETA
,NOMBRE_ARCHIVO
,SAFE.PARSE_DATE("%Y%m%d",FEC_PROCESO_PAGO) AS FECHA_TRANSACCION
,DATE(CAST(FECHA_PROCESO AS TIMESTAMP),'America/Lima') AS FECHA_PROCESO
,SAFE.PARSE_DATE("%Y%m%d",SUBSTRING(SPLIT(NOMBRE_ARCHIVO,'_')[SAFE_ORDINAL(3)],1,8)) AS FECHA_ARCHIVO 
 FROM `iter-data-storage-pv-uat.salomon_data.RECHAZOS_BANCO_MASTERCARD`
 WHERE IDENTIFICADOR='D'
UNION ALL 
---------------------------------------------------
---             BANCO SCOTIABANK                ---
---------------------------------------------------
SELECT  BANCO_RECHAZO
,MOTIVO_RECHAZO
,COD_EXTERNO AS NUMERO_POLIZA 
,CTA_ABONO
,NOMBRE_ARCHIVO
,SAFE.PARSE_DATE("%Y%m%d",FECHA_PAGO) AS FECHA_TRANSACCION
,DATE(CAST(FECHA_PROCESO AS TIMESTAMP),'America/Lima') AS FECHA_PROCESO
,SAFE.PARSE_DATE("%d%m%Y",SPLIT(SPLIT(NOMBRE_ARCHIVO,'_')[SAFE_ORDINAL(2)],'.')[SAFE_ORDINAL(1)]) AS FECHA_ARCHIVO 
 FROM `iter-data-storage-pv-uat.salomon_data.RECHAZOS_BANCO_SCOTIABANK`
UNION ALL 
---------------------------------------------------
---                 BANCO VISA                  ---
---------------------------------------------------
SELECT BANCO_RECHAZO
,MSJ_TERMINAL
,COD_CLIENTE AS NUMERO_POLIZA
,NRO_TARJETA
,NOMBRE_ARCHIVO
,SAFE.PARSE_DATE("%y%m%d",FEC_TRANSACCION) AS FECHA_TRANSACCION
,DATE(CAST(FECHA_PROCESO AS TIMESTAMP),'America/Lima') AS FECHA_PROCESO
,SAFE.PARSE_DATE("%Y%m%d",SPLIT(SPLIT(NOMBRE_ARCHIVO,'_')[SAFE_ORDINAL(2)],'.')[SAFE_ORDINAL(1)])  AS FECHA_ARCHIVO
 FROM `iter-data-storage-pv-uat.salomon_data.RECHAZOS_BANCO_VISA`
 WHERE TIPO_REGISTRO='D'
 ) 
 B LEFT JOIN `iter-data-storage-pv-uat.inputfiles.MOTIVO_RECHAZO_HOMOLOGADO` T
          ON UPPER(TRIM(B.BANCO_RECHAZO))=UPPER(TRIM(T.VIA_COBRO)) 
         AND UPPER(TRIM(T.MENSAJE_TERMINAL))=UPPER(TRIM(B.MOTIVO_RECHAZO))
--WHERE NULLIF(TRIM(T.MENSAJE_HOMOLOGADO),'') IS NOT NULL
WHERE IFNULL(UPPER(TRIM(B.MOTIVO_RECHAZO)),'')!=''
QUALIFY(ROW_NUMBER()OVER(PARTITION BY TRIM(B.NUMERO_POLIZA),B.BANCO_RECHAZO, COALESCE(B.FECHA_TRANSACCION,B.FECHA_ARCHIVO,B.FECHA_PROCESO) ORDER BY COALESCE(B.FECHA_TRANSACCION,B.FECHA_ARCHIVO,B.FECHA_PROCESO) DESC ))=1
;

END;