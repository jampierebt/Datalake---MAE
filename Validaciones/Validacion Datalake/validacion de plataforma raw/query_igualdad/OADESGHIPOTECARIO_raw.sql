SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN PROD.PK!=UAT.PK THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN PROD.STATIC!=UAT.STATIC THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN PROD.STATUS!=UAT.STATUS THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADINPUT))!=TRIM(UPPER(UAT.EDADINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADVALUE))!=TRIM(UPPER(UAT.EDADVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OARECSOBREPRIMAINPUT))!=TRIM(UPPER(UAT.OARECSOBREPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_OARECSOBREPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OARECSOBREPRIMAVALUE))!=TRIM(UPPER(UAT.OARECSOBREPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_OARECSOBREPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OAMOTIVOSOBREPRIMAVALUE))!=TRIM(UPPER(UAT.OAMOTIVOSOBREPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_OAMOTIVOSOBREPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OARECEXTRAPRIMAINPUT))!=TRIM(UPPER(UAT.OARECEXTRAPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_OARECEXTRAPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OARECEXTRAPRIMAVALUE))!=TRIM(UPPER(UAT.OARECEXTRAPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_OARECEXTRAPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OAMOTIVOEXTRAPRIMAVALUE))!=TRIM(UPPER(UAT.OAMOTIVOEXTRAPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_OAMOTIVOEXTRAPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OARECSOBREPRIMACONYINPUT))!=TRIM(UPPER(UAT.OARECSOBREPRIMACONYINPUT)) THEN 1 ELSE 0 END) AS DIFF_OARECSOBREPRIMACONYINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OARECSOBREPRIMACONYVALUE))!=TRIM(UPPER(UAT.OARECSOBREPRIMACONYVALUE)) THEN 1 ELSE 0 END) AS DIFF_OARECSOBREPRIMACONYVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OAMOTIVOSOBREPRIMACONVALUE))!=TRIM(UPPER(UAT.OAMOTIVOSOBREPRIMACONVALUE)) THEN 1 ELSE 0 END) AS DIFF_OAMOTIVOSOBREPRIMACONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OARECEXTRAPRIMACONYINPUT))!=TRIM(UPPER(UAT.OARECEXTRAPRIMACONYINPUT)) THEN 1 ELSE 0 END) AS DIFF_OARECEXTRAPRIMACONYINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OARECEXTRAPRIMACONYVALUE))!=TRIM(UPPER(UAT.OARECEXTRAPRIMACONYVALUE)) THEN 1 ELSE 0 END) AS DIFF_OARECEXTRAPRIMACONYVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OAMOTIVOEXTRAPRIMACONVALUE))!=TRIM(UPPER(UAT.OAMOTIVOEXTRAPRIMACONVALUE)) THEN 1 ELSE 0 END) AS DIFF_OAMOTIVOEXTRAPRIMACONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OAMOTIVOEXTRAPRIMACONINPUT))!=TRIM(UPPER(UAT.OAMOTIVOEXTRAPRIMACONINPUT)) THEN 1 ELSE 0 END) AS DIFF_OAMOTIVOEXTRAPRIMACONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OAMOTIVOSOBREPRIMACONINPUT))!=TRIM(UPPER(UAT.OAMOTIVOSOBREPRIMACONINPUT)) THEN 1 ELSE 0 END) AS DIFF_OAMOTIVOSOBREPRIMACONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OAMOTIVOEXTRAPRIMAINPUT))!=TRIM(UPPER(UAT.OAMOTIVOEXTRAPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_OAMOTIVOEXTRAPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OAMOTIVOSOBREPRIMAINPUT))!=TRIM(UPPER(UAT.OAMOTIVOSOBREPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_OAMOTIVOSOBREPRIMAINPUT
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.OADESGHIPOTECARIO_raw UAT 
INNER JOIN interseguro-data.acsele_data.OADESGHIPOTECARIO_raw PROD 
ON UAT.PK = PROD.PK