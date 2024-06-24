SELECT SUM(CASE WHEN TRIM(UPPER(PROD.ROL_DESCRIPTION)) IS NULL AND TRIM(UPPER(UAT.ROL_DESCRIPTION))="" THEN 1 ELSE 0 END) AS DIFF_ROL_DESCRIPTION
FROM iter-data-storage-pv-uat.acsele_data.STTS_ROLE_raw UAT 
INNER JOIN interseguro-data.acsele_data.STTS_ROLE_raw PROD 
ON UAT.ROL_ID = PROD.ROL_ID