SELECT SUM(CASE WHEN TRIM(UPPER(PROD.pk))!=TRIM(UPPER(UAT.pk)) THEN 1 ELSE 0 END) AS DIFF_pk
,SUM(CASE WHEN TRIM(UPPER(PROD.static))!=TRIM(UPPER(UAT.static)) THEN 1 ELSE 0 END) AS DIFF_static
,SUM(CASE WHEN TRIM(UPPER(PROD.status))!=TRIM(UPPER(UAT.status)) THEN 1 ELSE 0 END) AS DIFF_status
,SUM(CASE WHEN TRIM(UPPER(PROD.mescontabinput))!=TRIM(UPPER(UAT.mescontabinput)) THEN 1 ELSE 0 END) AS DIFF_mescontabinput
,SUM(CASE WHEN TRIM(UPPER(PROD.mescontabvalue))!=TRIM(UPPER(UAT.mescontabvalue)) THEN 1 ELSE 0 END) AS DIFF_mescontabvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechainput))!=TRIM(UPPER(UAT.fechainput)) THEN 1 ELSE 0 END) AS DIFF_fechainput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechavalue))!=TRIM(UPPER(UAT.fechavalue)) THEN 1 ELSE 0 END) AS DIFF_fechavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.dolasolinput))!=TRIM(UPPER(UAT.dolasolinput)) THEN 1 ELSE 0 END) AS DIFF_dolasolinput
,SUM(CASE WHEN TRIM(UPPER(PROD.dolasolvalue))!=TRIM(UPPER(UAT.dolasolvalue)) THEN 1 ELSE 0 END) AS DIFF_dolasolvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.soladolinput))!=TRIM(UPPER(UAT.soladolinput)) THEN 1 ELSE 0 END) AS DIFF_soladolinput
,SUM(CASE WHEN TRIM(UPPER(PROD.soladolvalue))!=TRIM(UPPER(UAT.soladolvalue)) THEN 1 ELSE 0 END) AS DIFF_soladolvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechacierremesinput))!=TRIM(UPPER(UAT.fechacierremesinput)) THEN 1 ELSE 0 END) AS DIFF_fechacierremesinput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechacierremesvalue))!=TRIM(UPPER(UAT.fechacierremesvalue)) THEN 1 ELSE 0 END) AS DIFF_fechacierremesvalue
FROM iter-data-storage-pv-uat.acsele_data.TDTASACAMBSBS_raw UAT 
INNER JOIN interseguro-data.acsele_data.TDTASACAMBSBS_raw PROD 
ON UAT.NUMERO_OPERACION = PROD.NUMERO_OPERACION 
AND UAT.NUMERO_POLIZA = PROD.NUMERO_POLIZA 
AND UAT.PK = PROD.PK