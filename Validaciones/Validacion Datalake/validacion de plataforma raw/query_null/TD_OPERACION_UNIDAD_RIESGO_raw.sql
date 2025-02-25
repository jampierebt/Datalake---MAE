SELECT SUM(CASE WHEN TRIM(UPPER(PROD.NUMERO_POLIZA)) IS NULL AND TRIM(UPPER(UAT.NUMERO_POLIZA))="" THEN 1 ELSE 0 END) AS DIFF_NUMERO_POLIZA
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRE_PRODUCTO)) IS NULL AND TRIM(UPPER(UAT.NOMBRE_PRODUCTO))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRE_PRODUCTO
,SUM(CASE WHEN TRIM(UPPER(PROD.STATUS_OPERATION)) IS NULL AND TRIM(UPPER(UAT.STATUS_OPERATION))="" THEN 1 ELSE 0 END) AS DIFF_STATUS_OPERATION
,SUM(CASE WHEN TRIM(UPPER(PROD.ESTADO_UND_RIESGO)) IS NULL AND TRIM(UPPER(UAT.ESTADO_UND_RIESGO))="" THEN 1 ELSE 0 END) AS DIFF_ESTADO_UND_RIESGO
,SUM(CASE WHEN TRIM(UPPER(PROD.TIME_STAMP)) IS NULL AND TRIM(UPPER(UAT.TIME_STAMP))="" THEN 1 ELSE 0 END) AS DIFF_TIME_STAMP
,SUM(CASE WHEN TRIM(UPPER(PROD.AUDITDATE)) IS NULL AND TRIM(UPPER(UAT.AUDITDATE))="" THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN TRIM(UPPER(PROD.TABLA_FUENTE)) IS NULL AND TRIM(UPPER(UAT.TABLA_FUENTE))="" THEN 1 ELSE 0 END) AS DIFF_TABLA_FUENTE
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOPAGOPRIMAINPUT)) IS NULL AND TRIM(UPPER(UAT.PERIODOPAGOPRIMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PERIODOPAGOPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGURADOINPUT)) IS NULL AND TRIM(UPPER(UAT.CAPITALASEGURADOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGANTVFINPUT)) IS NULL AND TRIM(UPPER(UAT.CAPITALASEGANTVFINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGANTVFINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SUMAASEGURADASEGTRAMOINPUT)) IS NULL AND TRIM(UPPER(UAT.SUMAASEGURADASEGTRAMOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SUMAASEGURADASEGTRAMOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.URPRIMAANUALINPUT)) IS NULL AND TRIM(UPPER(UAT.URPRIMAANUALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_URPRIMAANUALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.URPRIMAFPINPUT)) IS NULL AND TRIM(UPPER(UAT.URPRIMAFPINPUT))="" THEN 1 ELSE 0 END) AS DIFF_URPRIMAFPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PORCENTAJE_DEVOLUCION_PRIMA)) IS NULL AND TRIM(UPPER(UAT.PORCENTAJE_DEVOLUCION_PRIMA))="" THEN 1 ELSE 0 END) AS DIFF_PORCENTAJE_DEVOLUCION_PRIMA
FROM iter-data-storage-pv-uat.acsele_data.TD_OPERACION_UNIDAD_RIESGO_raw UAT 
INNER JOIN interseguro-data.acsele_data.TD_OPERACION_UNIDAD_RIESGO_raw PROD 
ON UAT.NUMERO_POLIZA = PROD.NUMERO_POLIZA 
AND UAT.NUMERO_OPERACION = PROD.NUMERO_OPERACION