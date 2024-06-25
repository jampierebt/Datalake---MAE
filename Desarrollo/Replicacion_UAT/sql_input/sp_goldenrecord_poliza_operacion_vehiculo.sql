CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_goldenrecord_poliza_operacion_vehiculo()
OPTIONS(
  strict_mode=true)
BEGIN
-- *********************************************************************
-- * Proyecto       : Carga RAW
-- * Fecha          : 18/11/2020
-- * Autor          : Ramirez Hurtado, Tito J. 
--                  : Jayo Escalante, Geraldine 
-- * Tabla Destinos : - 
-- *                : - 
-- * Tablas Fuentes : - 
-- * Descripción    :  
-- *********************************************************************
-- *                       MODIFICACIONES POSTERIORES                  *
-- *===================================================================*
-- *   Fecha   | Persona |           Modificación Realizada            *
-- *===================================================================*
-- *           |         |                                            
-- *********************************************************************

-- ----------------------------------------------------------------------
-- Paso 0: 
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_POLIZA_VEHICULO_SALV
AS
(
SELECT 
NUMERO_POLIZA
,VALOR_COMERCIAL
,FECHA_INSPECCION
,VERSION
,NUMERO_PLACA 
,REQUIERE_GPS
,CANAL_VENTA
FROM 
(
        SELECT 
         CAST(PO.policy_number AS STRING)        AS NUMERO_POLIZA
        ,PO.commercial_value     AS VALOR_COMERCIAL
        ,PO.inspection_expiration_date AS FECHA_INSPECCION
        ,CAST(VE.version AS STRING)    AS VERSION
        ,VE.plate_number        AS NUMERO_PLACA
        ,PO.gps                 AS REQUIERE_GPS
				,TRIM(UPPER(PO.business)) AS CANAL_VENTA
        ,ROW_NUMBER()OVER(PARTITION BY PO.POLICY_NUMBER ORDER BY PO.last_modified_date DESC,PO.created_date DESC ) AS CORRELATIVO
FROM `iter-data-storage-pv-uat.salvadb_data.policy_raw` PO
INNER JOIN `iter-data-storage-pv-uat.salvadb_data.vehicle_raw` VE 
        ON VE.id = PO.vehicle_id
WHERE PO.ID IS NOT NULL
  AND PO.policy_number IS NOT NULL
)
WHERE CORRELATIVO = 1 
);

-- ----------------------------------------------------------------------
-- Paso 14 : Campo FLAG - EMITIDO Acsel-e
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_POLIZA_VEHICULO_PAGO
AS
(    SELECT  LPAD(AD.CODIGOPOLIZA,10,'0') AS NUMERO_POLIZA 
            ,UPPER(MAX(me.nombre))  AS TIPO_PAGO
						,MAX(TRIM(USR.usuario)) AS USUARIO_VENTA
						,MAX(UPPER(TRIM(CAN.NOMBRE))) AS CANAL_VENTA
FROM `iter-data-storage-pv-uat.soat_data.ma_poliza_raw` AD
INNER JOIN `iter-data-storage-pv-uat.soat_data.ma_venta_raw` G 
       ON AD.id_poliza=g.id_poliza
LEFT JOIN `iter-data-storage-pv-uat.soat_data.ma_mediopago_raw` ME
       ON ME.idtipomediopago = G.tipo_pagado
LEFT JOIN `iter-data-storage-pv-uat.soat_data.ma_venta_transaccion_raw` TRA
       ON TRA.id_venta = G.id_venta
LEFT JOIN `iter-data-storage-pv-uat.soat_data.ma_usuario_raw` USR
       ON USR.iduser = TRA.idusuario
 LEFT JOIN `iter-data-storage-pv-uat.soat_data.ma_canal_raw` CAN
       ON G.idcanal = CAN.idcanal 
     WHERE AD.CODIGOPOLIZA <> '' 
       AND G.ESTADO = 2 
       -- AND G.IDCANAL NOT IN (3,4,6,9)
     GROUP BY LPAD(AD.CODIGOPOLIZA,10,'0')
);

-- ----------------------------------------------------------------------
-- Paso 1: UNIVERSO DE POLIZA-VEHICULO [TD_SOAT-TD_VEHICULAR]
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_POLIZA_VEHICULO_UNI
AS 
(
SELECT
	VE.NUMERO_POLIZA ,
	VE.ID_PRODUCTO ,
	VE.FECHA_VENTA ,
	VE.PLACA  AS NUMERO_PLACA,
	VE.USO_VENICULO  AS TIPO_USO,
	CAST(NULL AS STRING )  AS CLASE_VEHICULO,
	VE.MARCA_VEHICULO ,
	VE.MODELO_VEHICULO ,
	VE.ANIO_VEHICULO  AS ANIO_FABRICACION,
	EXTRACT(YEAR FROM CURRENT_DATE) - IFNULL(SAFE_CAST(VE.ANIO_VEHICULO AS NUMERIC),0) AS ANIOS_ANTIGUEDAD,
	VE.COLOR_VEHICULO ,
	VE.VIN_VEHICULO  AS NUMERO_MOTOR,
	CAST(NULL AS NUMERIC) AS NUMERO_ASIENTO ,
    TMPAGO.TIPO_PAGO ,
	TMPOL.FECHA_INSPECCION AS FECHA_INSPECCION,
	TMPOL.VERSION AS VERSION,
	TMPOL.REQUIERE_GPS AS REQUIERE_GPS,
	TMPOL.VALOR_COMERCIAL AS VALOR_COMERCIAL ,
	CAST(NULL AS DATE) AS FECHA_EMISION_SOAT ,
	VE.INDICADOR_RENOVACION ,
	CAST(NULL AS STRING) AS CODIGO_AGENCIA ,
	CAST(NULL AS STRING)  AS UBIGEO_VENTA,
	VE.CORREO AS CORREO_CONTACTO ,
	VE.TELEFONO_CELULAR  AS CELULAR_CONTACTO,
	VE.NUMERO_OPERACION ,
	VE.AUDITDATE_SYSTEM_DATE  AS FECHA_OPERACION,
  VE.STATUS_OPERATION AS ESTADO_OPERACION
	,TMPAGO.USUARIO_VENTA
	,VE.NUMERO_POLIZA_RENOVACION AS NUMERO_POLIZA_RENOVADA
	,COALESCE(TMPOL.CANAL_VENTA,TMPAGO.CANAL_VENTA) AS CANAL_VENTA
FROM `iter-data-storage-pv-uat.acsele_data.TD_OPERACION_VEHICULAR_raw` VE
LEFT JOIN TMP_POLIZA_VEHICULO_SALV TMPOL ON VE.NUMERO_POLIZA=TMPOL.NUMERO_POLIZA
LEFT JOIN TMP_POLIZA_VEHICULO_PAGO TMPAGO ON VE.NUMERO_POLIZA=TMPAGO.NUMERO_POLIZA
--WHERE CAST(VE.FECHA_PROCESO AS DATE)=CURRENT_DATE()
UNION ALL 
SELECT 
	SO.NUMERO_POLIZA ,
	SO.ID_PRODUCTO ,
	SO.FECHA_VENTA ,
	SO.PLACA  AS NUMERO_PLACA,
	SO.USO_VEHICULO AS TIPO_USO,
	SO.CLASE_VEHICULO,
	SO.MARCA_VEHICULO ,
	SO.MODELO_VEHICULO ,
	SO.FECHA_FABRICACION  AS ANIO_FABRICACION,
	EXTRACT(YEAR FROM CURRENT_DATE) - IFNULL(SAFE_CAST(SO.FECHA_FABRICACION AS NUMERIC),0) AS ANIOS_ANTIGUEDAD,
	SO.COLOR_VEHICULO ,
	SO.NUMERO_MOTOR,
	CAST(SO.NUMERO_ASIENTOS_VEHICULO AS NUMERIC) AS NUMERO_ASIENTO ,
	TMPAGO.TIPO_PAGO ,
	TMPOL.FECHA_INSPECCION AS FECHA_INSPECCION,
	TMPOL.VERSION AS VERSION,
	TMPOL.REQUIERE_GPS AS REQUIERE_GPS,
	TMPOL.VALOR_COMERCIAL AS VALOR_COMERCIAL ,
	CAST(SO.FECHA_EMISION_SOAT AS DATE) AS FECHA_EMISION_SOAT,
	CAST(NULL AS STRING) AS INDICADOR_RENOVACION ,
	SO.CODAGENTIENOFIINPUT AS CODIGO_AGENCIA ,
	SO.ZONA AS UBIGEO_VENTA,
	CAST(NULL AS STRING) AS CORREO_CONTACTO ,
	CAST(NULL AS STRING)  AS CELULAR_CONTACTO,
	SO.NUMERO_OPERACION ,
	SO.AUDITDATE_SYSTEM_DATE  AS FECHA_OPERACION,
  SO.STATUS_OPERATION       AS ESTADO_OPERACION
	,TMPAGO.USUARIO_VENTA
	,CAST(NULL AS STRING) AS NUMERO_POLIZA_RENOVADA
	,TMPAGO.CANAL_VENTA
FROM `iter-data-storage-pv-uat.acsele_data.TD_OPERACION_SOAT_raw` SO
LEFT JOIN TMP_POLIZA_VEHICULO_SALV TMPOL 
       ON SO.NUMERO_POLIZA=TMPOL.NUMERO_POLIZA
LEFT JOIN TMP_POLIZA_VEHICULO_PAGO TMPAGO 
       ON SO.NUMERO_POLIZA=TMPAGO.NUMERO_POLIZA
--WHERE CAST(SO.FECHA_PROCESO AS DATE)=CURRENT_DATE()
);

-- ----------------------------------------------------------------------
-- Paso FINAL: CARGA DIFERENCIAL - ACTUALIZAMOS LOS DATOS
-- ----------------------------------------------------------------------

DELETE FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION_VEHICULO` A
WHERE EXISTS (
		SELECT 1 
        FROM TMP_POLIZA_VEHICULO_UNI B 
        WHERE A.NUMERO_OPERACION   =B.NUMERO_OPERACION 
);


INSERT INTO `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION_VEHICULO`
(
         NUMERO_POLIZA 
         ,ID_PRODUCTO 
         ,FECHA_VENTA 
         ,NUMERO_PLACA 
         ,TIPO_USO 
         ,CLASE_VEHICULO 
         ,MARCA_VEHICULO 
         ,MODELO_VEHICULO 
         ,ANIO_FABRICACION 
         ,ANIOS_ANTIGUEDAD 
         ,COLOR_VEHICULO
         ,NUMERO_MOTOR
         ,NUMERO_ASIENTO
		 ,TIPO_PAGO
		 ,FECHA_INSPECCION
		 ,VERSION
		 ,REQUIERE_GPS
		 ,VALOR_COMERCIAL
         ,FECHA_PROCESO
         ,FECHA_EMISION_SOAT
         ,INDICADOR_RENOVACION
         ,CODIGO_AGENCIA
         ,UBIGEO_VENTA
         ,CORREO_CONTACTO
         ,CELULAR_CONTACTO
		 ,NUMERO_OPERACION
		 ,FECHA_OPERACION
     ,ESTADO_OPERACION
		 ,USUARIO_VENTA
		 ,NUMERO_POLIZA_RENOVADA
		 ,CANAL_VENTA
)
SELECT 
         TAB.NUMERO_POLIZA 
         ,TAB.ID_PRODUCTO 
         ,TAB.FECHA_VENTA 
         ,TAB.NUMERO_PLACA 
         ,TAB.TIPO_USO 
         ,TAB.CLASE_VEHICULO 
         ,TAB.MARCA_VEHICULO 
         ,TAB.MODELO_VEHICULO 
         ,TAB.ANIO_FABRICACION 
         ,TAB.ANIOS_ANTIGUEDAD 
         ,TAB.COLOR_VEHICULO
         ,TAB.NUMERO_MOTOR
         ,TAB.NUMERO_ASIENTO
		 ,TAB.TIPO_PAGO
		 ,TAB.FECHA_INSPECCION
		 ,TAB.VERSION
		 ,TAB.REQUIERE_GPS
		 ,TAB.VALOR_COMERCIAL
         ,CURRENT_DATE('America/Lima')
         ,TAB.FECHA_EMISION_SOAT
         ,TAB.INDICADOR_RENOVACION
         ,TAB.CODIGO_AGENCIA
         ,TAB.UBIGEO_VENTA
         ,TAB.CORREO_CONTACTO
         ,TAB.CELULAR_CONTACTO
		 ,TAB.NUMERO_OPERACION
		 ,TAB.FECHA_OPERACION
     ,TAB.ESTADO_OPERACION
		 ,TAB.USUARIO_VENTA
		 ,TAB.NUMERO_POLIZA_RENOVADA
		 ,TAB.CANAL_VENTA
 FROM TMP_POLIZA_VEHICULO_UNI TAB
 WHERE NUMERO_POLIZA IS NOT NULL
 QUALIFY(ROW_NUMBER()OVER(PARTITION BY TAB.NUMERO_POLIZA, TAB.NUMERO_OPERACION, TAB.FECHA_OPERACION
				ORDER BY (TAB.ANIO_FABRICACION) DESC )) = 1
;

SELECT 'OK' AS EJECUCION;

END;