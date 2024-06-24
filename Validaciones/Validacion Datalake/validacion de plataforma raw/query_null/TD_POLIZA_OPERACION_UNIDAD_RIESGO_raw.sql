SELECT SUM(CASE WHEN TRIM(UPPER(PROD.NUMERO_POLIZA)) IS NULL AND TRIM(UPPER(UAT.NUMERO_POLIZA))="" THEN 1 ELSE 0 END) AS DIFF_NUMERO_POLIZA
,SUM(CASE WHEN TRIM(UPPER(PROD.AUDITDATE_SYSTEM_DATE)) IS NULL AND TRIM(UPPER(UAT.AUDITDATE_SYSTEM_DATE))="" THEN 1 ELSE 0 END) AS DIFF_AUDITDATE_SYSTEM_DATE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHA_OPERACION)) IS NULL AND TRIM(UPPER(UAT.FECHA_OPERACION))="" THEN 1 ELSE 0 END) AS DIFF_FECHA_OPERACION
,SUM(CASE WHEN TRIM(UPPER(PROD.STATUS_OPERATION)) IS NULL AND TRIM(UPPER(UAT.STATUS_OPERATION))="" THEN 1 ELSE 0 END) AS DIFF_STATUS_OPERATION
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOPAGOPRIMAINPUT)) IS NULL AND TRIM(UPPER(UAT.PERIODOPAGOPRIMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PERIODOPAGOPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGURADOINPUT)) IS NULL AND TRIM(UPPER(UAT.CAPITALASEGURADOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOPAGOBENEFINPUT)) IS NULL AND TRIM(UPPER(UAT.PERIODOPAGOBENEFINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PERIODOPAGOBENEFINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGANTSURAINPUT)) IS NULL AND TRIM(UPPER(UAT.CAPITALASEGANTSURAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGANTSURAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGCRECANTSURAINPUT)) IS NULL AND TRIM(UPPER(UAT.CAPITALASEGCRECANTSURAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGCRECANTSURAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGCRECSURAINPUT)) IS NULL AND TRIM(UPPER(UAT.CAPITALASEGCRECSURAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGCRECSURAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FACTORCRECSURAINPUT)) IS NULL AND TRIM(UPPER(UAT.FACTORCRECSURAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FACTORCRECSURAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROANUALIDADESSURAINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMEROANUALIDADESSURAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROANUALIDADESSURAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOCOBERTURASURAINPUT)) IS NULL AND TRIM(UPPER(UAT.PERIODOCOBERTURASURAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PERIODOCOBERTURASURAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOPAGOPRIMASURAINPUT)) IS NULL AND TRIM(UPPER(UAT.PERIODOPAGOPRIMASURAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PERIODOPAGOPRIMASURAINPUT
FROM iter-data-storage-pv-uat.acsele_data.TD_POLIZA_OPERACION_UNIDAD_RIESGO_raw UAT 
INNER JOIN interseguro-data.acsele_data.TD_POLIZA_OPERACION_UNIDAD_RIESGO_raw PROD 
ON UAT.NUMERO_OPERACION = PROD.NUMERO_OPERACION 
AND UAT.NUMERO_POLIZA = PROD.NUMERO_POLIZA