SELECT SUM(CASE WHEN TRIM(UPPER(PROD.DESCRIPTION)) IS NULL AND TRIM(UPPER(UAT.DESCRIPTION))="" THEN 1 ELSE 0 END) AS DIFF_DESCRIPTION
,SUM(CASE WHEN TRIM(UPPER(PROD.EVENT)) IS NULL AND TRIM(UPPER(UAT.EVENT))="" THEN 1 ELSE 0 END) AS DIFF_EVENT
FROM iter-data-storage-pv-uat.acsele_data.INSURANCEOBJECTDCO_raw UAT 
INNER JOIN interseguro-data.acsele_data.INSURANCEOBJECTDCO_raw PROD 
ON UAT.AGREGATEDOBJECTID = PROD.AGREGATEDOBJECTID 
AND UAT.OPERATIONPK = PROD.OPERATIONPK