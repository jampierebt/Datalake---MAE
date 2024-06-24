SELECT SUM(CASE WHEN PROD.DCOID!=UAT.DCOID THEN 1 ELSE 0 END) AS DIFF_DCOID
,SUM(CASE WHEN PROD.OPERATIONPK!=UAT.OPERATIONPK THEN 1 ELSE 0 END) AS DIFF_OPERATIONPK
,SUM(CASE WHEN PROD.AGREGATEDOBJECTID!=UAT.AGREGATEDOBJECTID THEN 1 ELSE 0 END) AS DIFF_AGREGATEDOBJECTID
,SUM(CASE WHEN PROD.INITIALDATE!=UAT.INITIALDATE THEN 1 ELSE 0 END) AS DIFF_INITIALDATE
,SUM(CASE WHEN PROD.FINISHDATE!=UAT.FINISHDATE THEN 1 ELSE 0 END) AS DIFF_FINISHDATE
,SUM(CASE WHEN PROD.STATEID!=UAT.STATEID THEN 1 ELSE 0 END) AS DIFF_STATEID
,SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN PROD.ESTADO_CARGA!=UAT.ESTADO_CARGA THEN 1 ELSE 0 END) AS DIFF_ESTADO_CARGA
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.POLICYDCO_raw UAT 
INNER JOIN interseguro-data.acsele_data.POLICYDCO_raw PROD 
ON UAT.AGREGATEDOBJECTID = PROD.AGREGATEDOBJECTID 
AND UAT.OPERATIONPK = PROD.OPERATIONPK