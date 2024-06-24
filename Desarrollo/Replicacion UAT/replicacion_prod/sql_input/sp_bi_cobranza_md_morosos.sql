CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_bi_cobranza_md_morosos()
OPTIONS(
  strict_mode=true)
BEGIN
-- *********************************************************************
-- * Proyecto       : GOLDEN RECORD
-- * Fecha          : 09/08/2021
-- * Autor          : Ramirez Hurtado, Tito Jaime
-- * Tabla Destinos : - 
-- *                : - 
-- * Tablas Fuentes : - 
-- * Descripción    : 
-- *********************************************************************
-- *                       MODIFICACIONES POSTERIORES                  *
-- *===================================================================*
-- *===================================================================*
-- *   Fecha   | Persona |           Modificación Realizada            *
-- *           |         |                                            
-- ********************************************************************* 

-- ----------------------------------------------------------------------
-- Paso A10: Elimina todo los registros.
-- ----------------------------------------------------------------------
TRUNCATE TABLE  `iter-data-storage-pv-uat.bi_cobranza.MD_MOROSOS_VEHICULAR`;

-- ----------------------------------------------------------------------
-- Paso A11: MOROSOS, Solo considera del periodo CALENDARIO
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.bi_cobranza.MD_MOROSOS_VEHICULAR`
(
 NUMERO_POLIZA
,MODELO_VEHICULO
,NUMERO_DOCUMENTO
,TIPO_DOCUMENTO
,NOMBRE_CONTRATANTE
,CORREO
,CELULAR
,NUMERO_PLACA
,FECHA_INICIO_VIGENCIA_POLIZA
,FECHA_FIN_VIGENCIA_POLIZA
,MONTO_POR_COBRAR_USD
,MONTO_POR_COBRAR_PEN
,MONEDA
,DIAS_MOROSIDAD
,FRECUENCIA_PAGO
,FECHA_VENTA
,FECHA_VENCIMIENTO_CUOTA
,NUMERO_CUOTA
,RAZON_SOCIAL
,NOMBRE
,APELLIDO_PATERNO
,APELLIDO_MATERNO
,CORREO_VEHICULAR
,CELULAR_VEHICULAR
,CORREO_MIR
,CELULAR_MIR
,MOTIVO_RECHAZO
,ESTADO_POLIZA
)
SELECT 
 TAB.NUMERO_POLIZA
,TAB.MODELO_VEHICULO
,TAB.NUMERO_DOCUMENTO
,TAB.TIPO_DOCUMENTO
,TAB.NOMBRE_CONTRATANTE
,TAB.CORREO
,TAB.CELULAR
,TAB.NUMERO_PLACA
,TAB.FECHA_INICIO_VIGENCIA_POLIZA
,TAB.FECHA_FIN_VIGENCIA_POLIZA
,SUM(COALESCE(TAB.MONTO_POR_COBRAR_USD,0))OVER(PARTITION BY PERIODO,TIPO_PERIODO,NUMERO_POLIZA) AS MONTO_POR_COBRAR_USD
,SUM(COALESCE(TAB.MONTO_POR_COBRAR_PEN,0))OVER(PARTITION BY PERIODO,TIPO_PERIODO,NUMERO_POLIZA) AS MONTO_POR_COBRAR_PEN
,TAB.MONEDA
--,MAX(COALESCE(TAB.MORA,0))OVER(PARTITION BY PERIODO,TIPO_PERIODO,NUMERO_POLIZA)  AS DIAS_MOROSIDAD
,COALESCE(TAB.MORA,0) AS DIAS_MOROSIDAD
,TAB.FRECUENCIA_PAGO
,FECHA_VENTA
,FECHA_VENCIMIENTO_CUOTA
,NUMERO_CUOTA
,RAZON_SOCIAL
,NOMBRE
,APELLIDO_PATERNO
,APELLIDO_MATERNO
,CORREO_VEHICULAR
,CELULAR_VEHICULAR
,CORREO_CONTACTO
,CELULAR_CONTACTO
,MOTIVO_RECHAZO
,ESTADO_POLIZA
FROM `iter-data-storage-pv-uat.bi_cobranza.HM_POLIZA_CARGO_VEHICULAR` TAB
WHERE TIPO_PERIODO='CALENDARIO' 
  --AND MONTO_POR_COBRAR_USD>0
  AND COALESCE(TAB.MORA,0)>0
  AND  PERIODO = (SELECT MAX(PERIODO) FROM `iter-data-storage-pv-uat.bi_cobranza.HM_POLIZA_CARGO_VEHICULAR` WHERE TIPO_PERIODO='CALENDARIO' )
QUALIFY (ROW_NUMBER()OVER(PARTITION BY NUMERO_POLIZA ORDER BY FECHA_VENCIMIENTO_CUOTA ASC ))=1;

END;