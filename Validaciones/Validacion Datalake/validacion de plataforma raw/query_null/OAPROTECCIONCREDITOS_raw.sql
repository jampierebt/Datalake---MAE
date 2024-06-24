SELECT SUM(CASE WHEN TRIM(UPPER(PROD.EDADINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADVALUE
FROM iter-data-storage-pv-uat.acsele_data.OAPROTECCIONCREDITOS_raw UAT 
INNER JOIN interseguro-data.acsele_data.OAPROTECCIONCREDITOS_raw PROD 
ON UAT.PK = PROD.PK