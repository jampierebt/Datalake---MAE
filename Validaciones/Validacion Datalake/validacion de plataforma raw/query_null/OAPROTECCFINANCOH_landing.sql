SELECT SUM(CASE WHEN TRIM(UPPER(PROD.EDADINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIINPUT)) IS NULL AND TRIM(UPPER(UAT.CORREOIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIVALUE)) IS NULL AND TRIM(UPPER(UAT.CORREOIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIVALUE