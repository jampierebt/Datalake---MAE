SELECT SUM(CASE WHEN TRIM(UPPER(PROD.rucinput)) IS NULL AND TRIM(UPPER(UAT.rucinput))="" THEN 1 ELSE 0 END) AS DIFF_rucinput
,SUM(CASE WHEN TRIM(UPPER(PROD.rucvalue)) IS NULL AND TRIM(UPPER(UAT.rucvalue))="" THEN 1 ELSE 0 END) AS DIFF_rucvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.nombrecompempvalue)) IS NULL AND TRIM(UPPER(UAT.nombrecompempvalue))="" THEN 1 ELSE 0 END) AS DIFF_nombrecompempvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechaconstitucioninput)) IS NULL AND TRIM(UPPER(UAT.fechaconstitucioninput))="" THEN 1 ELSE 0 END) AS DIFF_fechaconstitucioninput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechaconstitucionvalue)) IS NULL AND TRIM(UPPER(UAT.fechaconstitucionvalue))="" THEN 1 ELSE 0 END) AS DIFF_fechaconstitucionvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.paginawebinput)) IS NULL AND TRIM(UPPER(UAT.paginawebinput))="" THEN 1 ELSE 0 END) AS DIFF_paginawebinput
,SUM(CASE WHEN TRIM(UPPER(PROD.paginawebvalue)) IS NULL AND TRIM(UPPER(UAT.paginawebvalue))="" THEN 1 ELSE 0 END) AS DIFF_paginawebvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.nombrecompempinput)) IS NULL AND TRIM(UPPER(UAT.nombrecompempinput))="" THEN 1 ELSE 0 END) AS DIFF_nombrecompempinput
FROM iter-data-storage-pv-uat.acsele_data.PERSONAJURIDICA_raw UAT 
INNER JOIN interseguro-data.acsele_data.PERSONAJURIDICA_raw PROD 
ON UAT.PK = PROD.PK