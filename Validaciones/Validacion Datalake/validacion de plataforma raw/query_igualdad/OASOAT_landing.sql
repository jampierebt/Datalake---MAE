SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN PROD.PK!=UAT.PK THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN PROD.STATIC!=UAT.STATIC THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN PROD.STATUS!=UAT.STATUS THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.PLACAOAINPUT))!=TRIM(UPPER(UAT.PLACAOAINPUT)) THEN 1 ELSE 0 END) AS DIFF_PLACAOAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLACAOAVALUE))!=TRIM(UPPER(UAT.PLACAOAVALUE)) THEN 1 ELSE 0 END) AS DIFF_PLACAOAVALUE