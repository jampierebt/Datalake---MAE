SELECT SUM(CASE WHEN PROD.pk!=UAT.pk THEN 1 ELSE 0 END) AS DIFF_pk
,SUM(CASE WHEN PROD.static!=UAT.static THEN 1 ELSE 0 END) AS DIFF_static
,SUM(CASE WHEN PROD.status!=UAT.status THEN 1 ELSE 0 END) AS DIFF_status
,SUM(CASE WHEN TRIM(UPPER(PROD.rucinput))!=TRIM(UPPER(UAT.rucinput)) THEN 1 ELSE 0 END) AS DIFF_rucinput
,SUM(CASE WHEN TRIM(UPPER(PROD.rucvalue))!=TRIM(UPPER(UAT.rucvalue)) THEN 1 ELSE 0 END) AS DIFF_rucvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.nombrecompempvalue))!=TRIM(UPPER(UAT.nombrecompempvalue)) THEN 1 ELSE 0 END) AS DIFF_nombrecompempvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechaconstitucioninput))!=TRIM(UPPER(UAT.fechaconstitucioninput)) THEN 1 ELSE 0 END) AS DIFF_fechaconstitucioninput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechaconstitucionvalue))!=TRIM(UPPER(UAT.fechaconstitucionvalue)) THEN 1 ELSE 0 END) AS DIFF_fechaconstitucionvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.paginawebinput))!=TRIM(UPPER(UAT.paginawebinput)) THEN 1 ELSE 0 END) AS DIFF_paginawebinput
,SUM(CASE WHEN TRIM(UPPER(PROD.paginawebvalue))!=TRIM(UPPER(UAT.paginawebvalue)) THEN 1 ELSE 0 END) AS DIFF_paginawebvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.nombrecompempinput))!=TRIM(UPPER(UAT.nombrecompempinput)) THEN 1 ELSE 0 END) AS DIFF_nombrecompempinput
FROM iter-data-storage-pv-uat.acsele_data.PERSONAJURIDICA_raw UAT 
INNER JOIN interseguro-data.acsele_data.PERSONAJURIDICA_raw PROD 
ON UAT.PK = PROD.PK