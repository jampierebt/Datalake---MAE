CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_bi_cobranza_hm_poliza_cobro_vida()
BEGIN 

DECLARE v_periodo INT64;

--SET v_periodo = 202207 ;
SET v_periodo = (SELECT MAX(PERIODO ) FROM  `iter-data-storage-pv-uat.goldenrecord_data.HM_POLIZA_CARGO_VIDA` );

-- -------------------------------------------------------
-- TEMPORAL CON EL UNIVERSO
-- -------------------------------------------------------
CREATE OR REPLACE TEMPORARY TABLE TMP_HM_POLIZA_COBRO_VIDA
AS 
(
SELECT
 PERIODO
,NUMERO_POLIZA
,MORA
,FRECUENCIA_PAGO
,NUMERO_DOCUMENTO_CONTRATANTE
,NOMBRES_CONTRATANTE
,FECHA_NACIMIENTO_CONTRATANTE
,FECHA_NACIMIENTO_ASEGURADO
,MONEDA_PRIMA_NETA
,NOMBRE_PRODUCTO
,VIA_COBRO
,FECHA_PAGADO_HASTA
,NOMBRES_ASEGURADO
,NUMERO_DOCUMENTO_ASEGURADO
,ANTIGUEDAD
,ESTADO_POLIZA
,NOMBRE_AGENTE_FINAL
,COD_AGENTE_FINAL
,COD_AGENCIA_FINAL
,NOMBRE_SUPERVISOR
,NOMBRE_JEFE
,CELULAR_CONTRATANTE
,CORREO_CONTRATANTE
,MOTIVO_RECHAZO
,PERFIL_FINANCIERO
,TIPO_MONEDA_TC_PERFIL
,PUNTAJE_SEGMENTO
,SEGMENTO
,SUM(MONTO_POR_COBRAR_PEN)OVER(PARTITION BY NUMERO_POLIZA,PERIODO) AS MONTO_POR_COBRAR_PEN
,SUM(MONTO_POR_COBRAR_USD)OVER(PARTITION BY NUMERO_POLIZA,PERIODO) AS MONTO_POR_COBRAR_USD
,SUM(MONTO_CANTIDAD_ABONO_PEN)OVER(PARTITION BY NUMERO_POLIZA,PERIODO) AS MONTO_CANTIDAD_ABONO_PEN
,SUM(MONTO_CANTIDAD_ABONO_USD)OVER(PARTITION BY NUMERO_POLIZA,PERIODO) AS MONTO_CANTIDAD_ABONO_USD
,SUB_SEGMENTO
,F
,M
,R
,SCORE_RFM
,RECENCY
,MONETARY_VALUE
,FREQUENCY
 FROM `iter-data-storage-pv-uat.goldenrecord_data.HM_POLIZA_CARGO_VIDA`
WHERE PERIODO=v_periodo
  AND ESTADO_CARGO NOT IN ('DESACTIVO','DIFERIDO','INHABILITADO')
QUALIFY(ROW_NUMBER()OVER(PARTITION BY NUMERO_POLIZA,PERIODO ORDER BY CARGO_FECHA_COBERTURA_INICIO DESC))=1
)
;

-- -------------------------------------------------------
-- Eliminar el periodo para reprocesar
-- -------------------------------------------------------
DELETE FROM `iter-data-storage-pv-uat.goldenrecord_data.HM_POLIZA_COBRO_VIDA`
       WHERE PERIODO = v_periodo;

-- -------------------------------------------------------
-- INSERT TABLA FINAL
-- -------------------------------------------------------
INSERT INTO  `iter-data-storage-pv-uat.goldenrecord_data.HM_POLIZA_COBRO_VIDA`
(
 PERIODO
,NUMERO_POLIZA
,MORA
,FRECUENCIA_PAGO
,NUMERO_DOCUMENTO_CONTRATANTE
,NOMBRES_CONTRATANTE
,FECHA_NACIMIENTO_CONTRATANTE
,FECHA_NACIMIENTO_ASEGURADO
,MONEDA_PRIMA_NETA
,NOMBRE_PRODUCTO
,VIA_COBRO
,FECHA_PAGADO_HASTA
,NOMBRES_ASEGURADO
,NUMERO_DOCUMENTO_ASEGURADO
,ANTIGUEDAD
,ESTADO_POLIZA
,NOMBRE_AGENTE_FINAL
,COD_AGENTE_FINAL
,COD_AGENCIA_FINAL
,NOMBRE_SUPERVISOR
,NOMBRE_JEFE
,CELULAR_CONTRATANTE
,CORREO_CONTRATANTE
,MOTIVO_RECHAZO
,PERFIL_FINANCIERO
,TIPO_MONEDA_TC_PERFIL
,PUNTAJE_SEGMENTO
,SEGMENTO
,MONTO_POR_COBRAR_PEN
,MONTO_POR_COBRAR_USD
,MONTO_CANTIDAD_ABONO_PEN
,MONTO_CANTIDAD_ABONO_USD
,SUB_SEGMENTO
,F
,M
,R
,SCORE_RFM
,RECENCY
,MONETARY_VALUE
,FREQUENCY
)
SELECT 
 PERIODO
,NUMERO_POLIZA
,MORA
,FRECUENCIA_PAGO
,NUMERO_DOCUMENTO_CONTRATANTE
,NOMBRES_CONTRATANTE
,FECHA_NACIMIENTO_CONTRATANTE
,FECHA_NACIMIENTO_ASEGURADO
,MONEDA_PRIMA_NETA
,NOMBRE_PRODUCTO
,VIA_COBRO
,FECHA_PAGADO_HASTA
,NOMBRES_ASEGURADO
,NUMERO_DOCUMENTO_ASEGURADO
,ANTIGUEDAD
,ESTADO_POLIZA
,NOMBRE_AGENTE_FINAL
,COD_AGENTE_FINAL
,COD_AGENCIA_FINAL
,NOMBRE_SUPERVISOR
,NOMBRE_JEFE
,CELULAR_CONTRATANTE
,CORREO_CONTRATANTE
,MOTIVO_RECHAZO
,PERFIL_FINANCIERO
,TIPO_MONEDA_TC_PERFIL
,PUNTAJE_SEGMENTO
,SEGMENTO
,MONTO_POR_COBRAR_PEN
,MONTO_POR_COBRAR_USD
,MONTO_CANTIDAD_ABONO_PEN
,MONTO_CANTIDAD_ABONO_USD
,SUB_SEGMENTO
,F
,M
,R
,SCORE_RFM
,RECENCY
,MONETARY_VALUE
,FREQUENCY
FROM TMP_HM_POLIZA_COBRO_VIDA
WHERE NUMERO_POLIZA IS NOT NULL 
;

END;