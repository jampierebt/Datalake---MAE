SELECT SUM(CASE WHEN PROD.auditdate!=UAT.auditdate THEN 1 ELSE 0 END) AS DIFF_auditdate
,SUM(CASE WHEN PROD.pk!=UAT.pk THEN 1 ELSE 0 END) AS DIFF_pk
,SUM(CASE WHEN TRIM(UPPER(PROD.static))!=TRIM(UPPER(UAT.static)) THEN 1 ELSE 0 END) AS DIFF_static
,SUM(CASE WHEN PROD.status!=UAT.status THEN 1 ELSE 0 END) AS DIFF_status
,SUM(CASE WHEN TRIM(UPPER(PROD.tipoclienteinput))!=TRIM(UPPER(UAT.tipoclienteinput)) THEN 1 ELSE 0 END) AS DIFF_tipoclienteinput
,SUM(CASE WHEN TRIM(UPPER(PROD.tipoclientevalue))!=TRIM(UPPER(UAT.tipoclientevalue)) THEN 1 ELSE 0 END) AS DIFF_tipoclientevalue