CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_carga_golden_poliza_vehiculo()
BEGIN
-- *********************************************************************
-- * Proyecto       : Carga RAW
-- * Fecha          : 18/11/2020
-- * Autor          : Ramirez Hurtado, Tito J.
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
CREATE OR REPLACE TEMPORARY TABLE TMP_POLIZA_VEHICULO_SALVADB AS 
( 
SELECT  
 pol.policy_number AS NUMERO_POLIZA
/*,pol.business
,pol.plan_id
,pol.card_id
,pol.renew_number
,pol.color
,pol.address 
-- ,pol.status 
,veh.serial_number 
,veh.plate_number AS PLACA
,veh.model_year 
,veh.engine_number
,veh.version
,veh.use_type_id
,veh.category_id
*/
,MIN(FORMAT_DATE("%Y-%m-%d",sell_date))OVER(PARTITION BY policy_number ) AS FECHA_VENTA
,COALESCE(MIN(DATETIME(bn.created_date,'America/Lima')) OVER (PARTITION BY policy_number),DATETIME(FORMAT_DATE("%Y-%m-%d",sell_date))) AS FECHA_HORA_VENTA
,ris.risk AS RIESGO_POR_MARCA
 FROM `iter-data-storage-pv-uat.salvadb_data.policy_raw` pol
 INNER JOIN `iter-data-storage-pv-uat.salvadb_data.vehicle_raw` veh 
 ON POL.vehicle_id = veh.id
 LEFT JOIN `iter-data-storage-pv-uat.salvadb_data.risk_and_price_raw` ris -- DUPLICADOS 
        ON ris.model_id = veh.model_id
        and ris.antique=0
        and ris.risk!='NONE'
 LEFT JOIN `iter-data-storage-pv-uat.salvadb_data.batch_notification_raw` bn
        ON bn.reference = pol.id
        AND bn.type = "ENROLLMENT_NOTIFICATION"
WHERE policy_number IS NOT NULL
  AND status_id IN (2, 3, 4, 5, 6, 7)
QUALIFY(ROW_NUMBER()OVER(PARTITION BY pol.policy_number ORDER BY sell_date DESC))=1
);

-- ----------------------------------------------------------------------
-- Paso 0: 
-- ----------------------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_POLIZA_VEHICULO_UNI
AS
WITH TMP_VEHICULO AS
(
SELECT 
 NUMERO_PLACA
,MAX(CLASE_VEHICULO) AS CLASE_VEHICULO
,MAX(COLOR_VEHICULO) AS COLOR_VEHICULO
,MAX(NUMERO_ASIENTO) AS NUMERO_ASIENTO
,MAX(VERSION) AS VERSION
FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION_VEHICULO`
GROUP BY NUMERO_PLACA
)
SELECT 
 OPE.NUMERO_POLIZA
,OPE.ID_PRODUCTO
,COALESCE(OPE.FECHA_VENTA, SAL.FECHA_VENTA) AS FECHA_VENTA
,OPE.NUMERO_PLACA
,UPPER(OPE.TIPO_USO) AS TIPO_USO
,UPPER(COALESCE(OPE.CLASE_VEHICULO,VEH.CLASE_VEHICULO)) AS CLASE_VEHICULO
,UPPER(OPE.MARCA_VEHICULO) AS MARCA_VEHICULO
,UPPER(OPE.MODELO_VEHICULO) AS MODELO_VEHICULO
,OPE.ANIO_FABRICACION
,OPE.ANIOS_ANTIGUEDAD
,UPPER(COALESCE(OPE.COLOR_VEHICULO,VEH.COLOR_VEHICULO)) AS COLOR_VEHICULO
,OPE.NUMERO_MOTOR
,COALESCE(OPE.NUMERO_ASIENTO,VEH.NUMERO_ASIENTO) AS NUMERO_ASIENTO
,UPPER(OPE.TIPO_PAGO) AS TIPO_PAGO
,OPE.FECHA_INSPECCION
,COALESCE(OPE.VERSION,VEH.VERSION) AS VERSION
,OPE.REQUIERE_GPS
,OPE.VALOR_COMERCIAL
,OPE.FECHA_PROCESO
,OPE.FECHA_EMISION_SOAT
,UPPER(OPE.INDICADOR_RENOVACION) AS INDICADOR_RENOVACION
,OPE.CODIGO_AGENCIA
,OPE.UBIGEO_VENTA
,OPE.CORREO_CONTACTO
,OPE.CELULAR_CONTACTO
,SAL.RIESGO_POR_MARCA
,TRIM(OPE.USUARIO_VENTA) AS USUARIO_VENTA
,OPE.CANAL_VENTA
,SAL.FECHA_HORA_VENTA
FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION_VEHICULO` OPE
LEFT JOIN TMP_VEHICULO VEH
       ON VEH.NUMERO_PLACA = OPE.NUMERO_PLACA
LEFT JOIN TMP_POLIZA_VEHICULO_SALVADB SAL 
       ON SAL.NUMERO_POLIZA = SAFE_CAST(OPE.NUMERO_POLIZA AS INT64)
WHERE OPE.ESTADO_OPERACION IN ("Applied operation")
  AND OPE.NUMERO_PLACA NOT IN ('3U008','CY487','HA583')
QUALIFY(ROW_NUMBER()OVER(PARTITION BY OPE.NUMERO_POLIZA,OPE.ID_PRODUCTO ORDER BY OPE.FECHA_OPERACION DESC )) = 1
;

-- ----------------------------------------------------------------------
-- Paso FINAL: CARGA DIFERENCIAL
-- ----------------------------------------------------------------------
MERGE `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_VEHICULO` A1 
  USING TMP_POLIZA_VEHICULO_UNI A2 
     ON A1.NUMERO_POLIZA      = A2.NUMERO_POLIZA 
    AND A1.ID_PRODUCTO        = A2.ID_PRODUCTO 
  WHEN MATCHED THEN 
  UPDATE SET
        FECHA_VENTA          =A2.FECHA_VENTA
        ,NUMERO_PLACA        =A2.NUMERO_PLACA
        ,TIPO_USO            =A2.TIPO_USO
        ,CLASE_VEHICULO      =A2.CLASE_VEHICULO
        ,MARCA_VEHICULO      =A2.MARCA_VEHICULO
        ,MODELO_VEHICULO     =A2.MODELO_VEHICULO
        ,ANIO_FABRICACION    =A2.ANIO_FABRICACION
        ,ANIOS_ANTIGUEDAD    =A2.ANIOS_ANTIGUEDAD
        ,COLOR_VEHICULO      =A2.COLOR_VEHICULO
        ,NUMERO_MOTOR        =A2.NUMERO_MOTOR
        ,NUMERO_ASIENTO      =A2.NUMERO_ASIENTO
        ,TIPO_PAGO           =A2.TIPO_PAGO
        ,FECHA_EMISION_SOAT  =A2.FECHA_EMISION_SOAT
        ,FECHA_ACTUALIZACION =CURRENT_TIMESTAMP()
        ,INDICADOR_RENOVACION=A2.INDICADOR_RENOVACION
        ,CODIGO_AGENCIA      =A2.CODIGO_AGENCIA
        ,UBIGEO_VENTA        =A2.UBIGEO_VENTA
        ,CORREO_CONTACTO     =A2.CORREO_CONTACTO
        ,CELULAR_CONTACTO    =A2.CELULAR_CONTACTO
        ---
        ,VALOR_COMERCIAL     =A2.VALOR_COMERCIAL
        ,FECHA_INSPECCION    =A2.FECHA_INSPECCION
        ,VERSION             =A2.VERSION
        ,REQUIERE_GPS        =A2.REQUIERE_GPS
        ,RIESGO_POR_MARCA    =A2.RIESGO_POR_MARCA
        ,USUARIO_VENTA       =A2.USUARIO_VENTA
        ,CANAL_VENTA         =A2.CANAL_VENTA
        ,FECHA_HORA_VENTA    =A2.FECHA_HORA_VENTA
  WHEN NOT MATCHED THEN
    INSERT (
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
                ,FECHA_ACTUALIZACION
                ,FECHA_EMISION_SOAT
                ,INDICADOR_RENOVACION
                ,CODIGO_AGENCIA
                ,UBIGEO_VENTA
                ,CORREO_CONTACTO
                ,CELULAR_CONTACTO
                -- >>>>
                ,VALOR_COMERCIAL
                ,FECHA_INSPECCION
                ,VERSION
                ,REQUIERE_GPS
                ,RIESGO_POR_MARCA
                ,USUARIO_VENTA
                ,CANAL_VENTA
                ,FECHA_HORA_VENTA
            )
 VALUES (
                 A2.NUMERO_POLIZA 
                ,A2.ID_PRODUCTO 
                ,A2.FECHA_VENTA 
                ,A2.NUMERO_PLACA 
                ,A2.TIPO_USO 
                ,A2.CLASE_VEHICULO 
                ,A2.MARCA_VEHICULO 
                ,A2.MODELO_VEHICULO 
                ,A2.ANIO_FABRICACION 
                ,A2.ANIOS_ANTIGUEDAD 
                ,A2.COLOR_VEHICULO
                ,A2.NUMERO_MOTOR
                ,A2.NUMERO_ASIENTO
                ,A2.TIPO_PAGO
                ,CURRENT_TIMESTAMP()
                ,A2.FECHA_EMISION_SOAT
                ,A2.INDICADOR_RENOVACION
                ,A2.CODIGO_AGENCIA
                ,A2.UBIGEO_VENTA
                ,A2.CORREO_CONTACTO
                ,A2.CELULAR_CONTACTO
                --
                ,A2.VALOR_COMERCIAL
                ,A2.FECHA_INSPECCION
                ,A2.VERSION
                ,A2.REQUIERE_GPS
                ,A2.RIESGO_POR_MARCA
                ,A2.USUARIO_VENTA
                ,A2.CANAL_VENTA
                ,A2.FECHA_HORA_VENTA
        )
;

SELECT 'OK' ESTADO_EJECUCION;


END;