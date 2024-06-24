SELECT SUM(CASE WHEN TRIM(UPPER(PROD.EDADINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOCLIENTEINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPOCLIENTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPOCLIENTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOCLIENTEVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPOCLIENTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPOCLIENTEVALUE
FROM iter-data-storage-pv-uat.acsele_data.OAVIDAGRUPOCOMP_raw UAT 
INNER JOIN interseguro-data.acsele_data.OAVIDAGRUPOCOMP_raw PROD 
ON UAT.PK = PROD.PK