SELECT SUM(CASE WHEN TRIM(UPPER(PROD.description)) IS NULL AND TRIM(UPPER(UAT.description))="" THEN 1 ELSE 0 END) AS DIFF_description
FROM iter-data-storage-pv-uat.acsele_data.STATE_raw UAT 
INNER JOIN interseguro-data.acsele_data.STATE_raw PROD 
ON UAT.STATEID = PROD.STATEID