CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.carga_dv_recaudo_samp()
OPTIONS(
  strict_mode=true)
BEGIN
/********************************************************************
* Proyecto		  : iter-data-storage-pv-uat 
* Fecha			    : 23 / 12 / 2020
* Autor			    : Bluetab - Edson Huerta G.                               
* Descripción   : Tabla DV_RECAUDO_SAMP, que contiene toda la recaudacion a partir de la tabla de poliza_pagos
*********************************************************************
*                       MODIFICACIONES POSTERIORES                  *
*===================================================================*
*=  Fecha   | Persona |           Modificación Realizada           =*
*===================================================================*                                    
* 2021/01/14|T.Ramirez| Actualización de query 
*********************************************************************/

-- ----------------------------------------------------------------
-- Paso A10:  
-- ----------------------------------------------------------------
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.bi_finanzas.DV_RECAUDO_SAMP` 
AS
/*****  DATAENTRY: PROMEDIO DE LOS ULTIMOS 3 ULTIMOS MESES PARA DESGRAVAMEN Y OTROS ********/
WITH TMP_PROYECCION_LINEAL 
AS
(
    SELECT * 
    FROM `iter-data-storage-pv-uat.external_data.DE_PPTO_RPTO_RECAUDO` 
    WHERE TIPO='PROYECCION LINEAL'
)
SELECT 
    --EMI.VISTA_PRODUCTO,
    ( CASE WHEN PP.NOMBRE_GRUPO_PRODUCTO ='DESGRAVAMEN' 
           THEN PP.NOMBRE_GRUPO_PRODUCTO
           WHEN PP.NOMBRE_PRODUCTO ='CLONACIONOFRAUDE' 
           THEN 'CLONACION'
          ELSE EMI.VISTA_PRODUCTO
       END ) AS VISTA_PRODUCTO,
    (CASE WHEN PP.NOMBRE_GRUPO_PRODUCTO='DESGRAVAMEN' 
          THEN PP.NOMBRE_GRUPO_PRODUCTO
          WHEN PP.NOMBRE_PRODUCTO ='CLONACIONOFRAUDE' 
          THEN 'CLONACION'
          ELSE EMI.VISTA_PRODUCTO_HOMOLOGADO 
     END) AS VISTA_PRODUCTO_HOMOLOGADO,
    (CASE WHEN PP.NOMBRE_GRUPO_PRODUCTO='DESGRAVAMEN' 
          THEN PP.NOMBRE_GRUPO_PRODUCTO
          WHEN PP.NOMBRE_PRODUCTO ='CLONACIONOFRAUDE' 
          THEN 'CLONACION'
          WHEN PP.ID_PRODUCTO='28037' 
          THEN 'OTROS-MASIVOS'
          ELSE EMI.NOMBRE_GRUPO_PRODUCTO_HOMOLOGADO 
     END) AS NOMBRE_GRUPO_PRODUCTO_HOMOLOGADO, 
    PPTO.MONTO PRESUPUESTO_RECAUDO,
    RPPTO.MONTO REPRESUPUESTO_RECAUDO,
    TIM.day_number DIA_CALENDARIO, 
    TIM.month_total_days DIAS_CALENDARIO_TOTAL,
    TIM.working_day_acum_date DIA_HABIL,
    TIM.working_day_acum_month DIAS_HABILES_TOTAL,
    CAST(PP.FECHA_APLICACION_PAGO AS DATE) AS FECHA_PAGO,
    PYL.MONTO MONTO_PROM_3_ULTIMOS_MESES,
    PP.NUMERO_POLIZA, 
    PP.PERIODO_COBRANZA, 
    PP.PERIODO_PAGO, 
    PP.ID_CARGO, 
    PP.OPEN_ITEM_ID, 
    PP.ID_ABONO, 
    PP.ID_GRUPO_PRODUCTO, 
    PP.NOMBRE_GRUPO_PRODUCTO,
    PP.ID_PRODUCTO, 
    PP.NOMBRE_PRODUCTO,
    PP.ID_CANAL_PAGO,
    PP.CANAL_PAGO,
    PP.PARTY_ID,
    PP.TIPO_DOCUMENTO, 
    PP.NOMBRE, 
    PP.RAZON_SOCIAL,
    PP.ESTADO_PAGO,
    PP.NUMERO_COMPROBANTE_PAGO,
    PP.METODO_PAGO,
    PP.NUMERO_ABONO, 
    PP.COD_CONCEPTO_ABONO,
    PP.CONCEPTO_DESCRIPCION,
    PP.TIPO_PAGO, 
    PP.TIPO_DOCUMENTO_PAGO, 
    PP.DOCUMENTO_PAGO,
    PP.MONTO_ORIGEN_MONEDA,
    PP.VALOR_MONEDA_ORIGEN, 
    PP.MONTO_ORIGEN_CANTIDAD,
    PP.VALOR_SALDO_ORIGEN,
    PP.VALOR_SOLES_ABONO, 
    EMI.PRIMERA_PRIMA,
    PP.ID_TIPO_INGRESO_ABONO,
    PP.TIPO_INGRESO_ABONO,
    PP.ID_BANCO, 
    PP.BANCO, 
    PP.MONTO_RECEPCION_MONEDA, 
    PP.MONTO_RECEPCION_CANTIDAD, 
    PP.DIAS_ATRASO, 
    PP.TIPO_MORA, 
    PP.MONTO_MORA_ORIGEN, 
    PP.ULTIMA_VIA_PAGO, 
    PP.FECHA_REGISTRO_CAJA, 
    PP.FECHA_REGISTRO_ABONO,
    PP.FECHA_APLICACION_PAGO,
    PP.ID_EMPLEADO, EMPLEADO, 
    PP.FLG_MORA, 
    PP.FLG_PAGO_FISICO, 
    PP.SISTEMA_ORIGEN, 
    PP.FECHA_CREACION, 
    PP.USUARIO_CREACION, 
    PP.FECHA_MODIFICACION, 
    PP.USUARIO_MODIFICACION
FROM `iter-data-storage-pv-uat.master_transaction.POLIZA_PAGO` PP 
  LEFT JOIN `iter-data-storage-pv-uat.bi_finanzas.DV_EMISION` EMI 
         ON PP.NUMERO_POLIZA=EMI.NUMERO_POLIZA
        AND PP.NOMBRE_PRODUCTO =EMI.NOMBRE_PRODUCTO
  LEFT JOIN `iter-data-storage-pv-uat.external_data.DE_PPTO_RPTO_RECAUDO` PPTO 
         ON COALESCE(EMI.VISTA_PRODUCTO,PP.NOMBRE_GRUPO_PRODUCTO) = PPTO.PRODUCTO 
        AND FORMAT_DATE('%Y%m',CAST(PP.FECHA_APLICACION_PAGO AS DATE)) = PPTO.MES 
        AND PPTO.TIPO = 'PRESUPUESTO'
  LEFT JOIN `iter-data-storage-pv-uat.external_data.DE_PPTO_RPTO_RECAUDO` RPPTO 
         ON COALESCE(EMI.VISTA_PRODUCTO,PP.NOMBRE_GRUPO_PRODUCTO) = RPPTO.PRODUCTO 
        AND FORMAT_DATE('%Y%m',CAST(PP.FECHA_APLICACION_PAGO AS DATE)) = RPPTO.MES 
        AND RPPTO.TIPO = 'REPRESUPUESTO' 
  LEFT JOIN `iter-data-storage-pv-uat.bi_finanzas.DIM_TIEMPO` TIM 
         ON  CAST(PP.FECHA_APLICACION_PAGO AS DATE)=TIM.DATE
  LEFT JOIN TMP_PROYECCION_LINEAL PYL 
         ON FORMAT_DATE('%Y%m',CAST(PP.FECHA_APLICACION_PAGO AS DATE)) = PYL.MES 
        AND COALESCE(EMI.VISTA_PRODUCTO,PP.NOMBRE_GRUPO_PRODUCTO) = PYL.PRODUCTO ;

SELECT 'OK' ESTADO_EJECUCION;

END;