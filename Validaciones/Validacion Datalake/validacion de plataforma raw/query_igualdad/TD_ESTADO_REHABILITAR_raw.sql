SELECT SUM(CASE WHEN TRIM(UPPER(PROD.NUMERO_POLIZA))!=TRIM(UPPER(UAT.NUMERO_POLIZA)) THEN 1 ELSE 0 END) AS DIFF_NUMERO_POLIZA
,SUM(CASE WHEN PROD.NUMERO_OPERACION!=UAT.NUMERO_OPERACION THEN 1 ELSE 0 END) AS DIFF_NUMERO_OPERACION
,SUM(CASE WHEN TRIM(UPPER(PROD.ID_POLIZA))!=TRIM(UPPER(UAT.ID_POLIZA)) THEN 1 ELSE 0 END) AS DIFF_ID_POLIZA
,SUM(CASE WHEN PROD.PRODUCTID!=UAT.PRODUCTID THEN 1 ELSE 0 END) AS DIFF_PRODUCTID
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRE_PRODUCTO))!=TRIM(UPPER(UAT.NOMBRE_PRODUCTO)) THEN 1 ELSE 0 END) AS DIFF_NOMBRE_PRODUCTO
,SUM(CASE WHEN TRIM(UPPER(PROD.EVENT))!=TRIM(UPPER(UAT.EVENT)) THEN 1 ELSE 0 END) AS DIFF_EVENT
,SUM(CASE WHEN PROD.FECHA_SOLICITUD!=UAT.FECHA_SOLICITUD THEN 1 ELSE 0 END) AS DIFF_FECHA_SOLICITUD
,SUM(CASE WHEN PROD.FECHA_MOVIMIENTO!=UAT.FECHA_MOVIMIENTO THEN 1 ELSE 0 END) AS DIFF_FECHA_MOVIMIENTO
,SUM(CASE WHEN TRIM(UPPER(PROD.MOTIVO_MOVIMIENTO))!=TRIM(UPPER(UAT.MOTIVO_MOVIMIENTO)) THEN 1 ELSE 0 END) AS DIFF_MOTIVO_MOVIMIENTO
,SUM(CASE WHEN TRIM(UPPER(PROD.MOVIMIENTO))!=TRIM(UPPER(UAT.MOVIMIENTO)) THEN 1 ELSE 0 END) AS DIFF_MOVIMIENTO
,SUM(CASE WHEN PROD.FECHA_EFECTIVA!=UAT.FECHA_EFECTIVA THEN 1 ELSE 0 END) AS DIFF_FECHA_EFECTIVA
FROM iter-data-storage-pv-uat.acsele_data.TD_ESTADO_REHABILITAR_raw UAT 
INNER JOIN interseguro-data.acsele_data.TD_ESTADO_REHABILITAR_raw PROD 
ON UAT.NUMERO_OPERACION = PROD.NUMERO_OPERACION 
AND UAT.NUMERO_POLIZA = PROD.NUMERO_POLIZA