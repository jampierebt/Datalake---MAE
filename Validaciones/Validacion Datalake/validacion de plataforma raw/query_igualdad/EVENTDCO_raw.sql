SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN PROD.EVENTTYPEID!=UAT.EVENTTYPEID THEN 1 ELSE 0 END) AS DIFF_EVENTTYPEID
,SUM(CASE WHEN PROD.OPERATIONPK!=UAT.OPERATIONPK THEN 1 ELSE 0 END) AS DIFF_OPERATIONPK
,SUM(CASE WHEN PROD.POLICYPK!=UAT.POLICYPK THEN 1 ELSE 0 END) AS DIFF_POLICYPK
,SUM(CASE WHEN PROD.IDDCOEVENT!=UAT.IDDCOEVENT THEN 1 ELSE 0 END) AS DIFF_IDDCOEVENT
,SUM(CASE WHEN PROD.TRF_ID!=UAT.TRF_ID THEN 1 ELSE 0 END) AS DIFF_TRF_ID
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.EVENTDCO_raw UAT 
INNER JOIN interseguro-data.acsele_data.EVENTDCO_raw PROD 
ON UAT.POLICYPK = PROD.POLICYPK 
AND UAT.EVENTTYPEID = PROD.EVENTTYPEID 
AND UAT.OPERATIONPK = PROD.OPERATIONPK