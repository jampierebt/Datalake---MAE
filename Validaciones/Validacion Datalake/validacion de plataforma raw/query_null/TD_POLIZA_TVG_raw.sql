SELECT SUM(CASE WHEN TRIM(UPPER(PROD.numero_poliza)) IS NULL AND TRIM(UPPER(UAT.numero_poliza))="" THEN 1 ELSE 0 END) AS DIFF_numero_poliza
FROM iter-data-storage-pv-uat.acsele_data.TD_POLIZA_TVG_raw UAT 
INNER JOIN interseguro-data.acsele_data.TD_POLIZA_TVG_raw PROD 
ON UAT.ANIO = PROD.ANIO 
AND UAT.MES = PROD.MES 
AND UAT.NUMERO_OPERACION = PROD.NUMERO_OPERACION 
AND UAT.NUMERO_POLIZA = PROD.NUMERO_POLIZA