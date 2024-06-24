SELECT SUM(CASE WHEN TRIM(UPPER(PROD.NUMERO_POLIZA)) IS NULL AND TRIM(UPPER(UAT.NUMERO_POLIZA))="" THEN 1 ELSE 0 END) AS DIFF_NUMERO_POLIZA
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRE_PRODUCTO)) IS NULL AND TRIM(UPPER(UAT.NOMBRE_PRODUCTO))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRE_PRODUCTO
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERO_SINIESTRO)) IS NULL AND TRIM(UPPER(UAT.NUMERO_SINIESTRO))="" THEN 1 ELSE 0 END) AS DIFF_NUMERO_SINIESTRO
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRE_BENEFICIARIO_SINIESTRADO)) IS NULL AND TRIM(UPPER(UAT.NOMBRE_BENEFICIARIO_SINIESTRADO))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRE_BENEFICIARIO_SINIESTRADO
,SUM(CASE WHEN TRIM(UPPER(PROD.COBERTURA)) IS NULL AND TRIM(UPPER(UAT.COBERTURA))="" THEN 1 ELSE 0 END) AS DIFF_COBERTURA
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHA_RECLAMO_RESERVA_NORMAL)) IS NULL AND TRIM(UPPER(UAT.FECHA_RECLAMO_RESERVA_NORMAL))="" THEN 1 ELSE 0 END) AS DIFF_FECHA_RECLAMO_RESERVA_NORMAL
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDA_PAGO)) IS NULL AND TRIM(UPPER(UAT.MONEDA_PAGO))="" THEN 1 ELSE 0 END) AS DIFF_MONEDA_PAGO
,SUM(CASE WHEN TRIM(UPPER(PROD.ESTADO_PAGO)) IS NULL AND TRIM(UPPER(UAT.ESTADO_PAGO))="" THEN 1 ELSE 0 END) AS DIFF_ESTADO_PAGO
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTO_PAGO)) IS NULL AND TRIM(UPPER(UAT.MONTO_PAGO))="" THEN 1 ELSE 0 END) AS DIFF_MONTO_PAGO
,SUM(CASE WHEN TRIM(UPPER(PROD.ESTADO_COBERTURA)) IS NULL AND TRIM(UPPER(UAT.ESTADO_COBERTURA))="" THEN 1 ELSE 0 END) AS DIFF_ESTADO_COBERTURA
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPO_DOCUMENTO)) IS NULL AND TRIM(UPPER(UAT.TIPO_DOCUMENTO))="" THEN 1 ELSE 0 END) AS DIFF_TIPO_DOCUMENTO
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERO_DOCUMENTO)) IS NULL AND TRIM(UPPER(UAT.NUMERO_DOCUMENTO))="" THEN 1 ELSE 0 END) AS DIFF_NUMERO_DOCUMENTO
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRE)) IS NULL AND TRIM(UPPER(UAT.NOMBRE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDO_PATERNO)) IS NULL AND TRIM(UPPER(UAT.APELLIDO_PATERNO))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDO_PATERNO
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDO_MATERNO)) IS NULL AND TRIM(UPPER(UAT.APELLIDO_MATERNO))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDO_MATERNO
,SUM(CASE WHEN TRIM(UPPER(PROD.PARTICIPACION)) IS NULL AND TRIM(UPPER(UAT.PARTICIPACION))="" THEN 1 ELSE 0 END) AS DIFF_PARTICIPACION
,SUM(CASE WHEN TRIM(UPPER(PROD.ORDEN_MONTO_PAGO)) IS NULL AND TRIM(UPPER(UAT.ORDEN_MONTO_PAGO))="" THEN 1 ELSE 0 END) AS DIFF_ORDEN_MONTO_PAGO
,SUM(CASE WHEN TRIM(UPPER(PROD.ORDEN_ESTADO_PAGO)) IS NULL AND TRIM(UPPER(UAT.ORDEN_ESTADO_PAGO))="" THEN 1 ELSE 0 END) AS DIFF_ORDEN_ESTADO_PAGO
,SUM(CASE WHEN TRIM(UPPER(PROD.ESTADO_SINIESTRO_GLOSA)) IS NULL AND TRIM(UPPER(UAT.ESTADO_SINIESTRO_GLOSA))="" THEN 1 ELSE 0 END) AS DIFF_ESTADO_SINIESTRO_GLOSA
FROM iter-data-storage-pv-uat.acsele_data.TD_POLIZA_SINIESTRO_raw UAT 
INNER JOIN interseguro-data.acsele_data.TD_POLIZA_SINIESTRO_raw PROD 
ON UAT.NUMERO_POLIZA = PROD.NUMERO_POLIZA 
AND UAT.NUMERO_OPERACION = PROD.NUMERO_OPERACION