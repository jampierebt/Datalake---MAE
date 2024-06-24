SELECT SUM(CASE WHEN TRIM(UPPER(PROD.static)) IS NULL AND TRIM(UPPER(UAT.static))="" THEN 1 ELSE 0 END) AS DIFF_static
,SUM(CASE WHEN TRIM(UPPER(PROD.periodopagoprimainput)) IS NULL AND TRIM(UPPER(UAT.periodopagoprimainput))="" THEN 1 ELSE 0 END) AS DIFF_periodopagoprimainput
,SUM(CASE WHEN TRIM(UPPER(PROD.capitalaseguradoinput)) IS NULL AND TRIM(UPPER(UAT.capitalaseguradoinput))="" THEN 1 ELSE 0 END) AS DIFF_capitalaseguradoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.periodopagobenefinput)) IS NULL AND TRIM(UPPER(UAT.periodopagobenefinput))="" THEN 1 ELSE 0 END) AS DIFF_periodopagobenefinput
,SUM(CASE WHEN TRIM(UPPER(PROD.capitalasegantvfinput)) IS NULL AND TRIM(UPPER(UAT.capitalasegantvfinput))="" THEN 1 ELSE 0 END) AS DIFF_capitalasegantvfinput
,SUM(CASE WHEN TRIM(UPPER(PROD.urprimaanualinput)) IS NULL AND TRIM(UPPER(UAT.urprimaanualinput))="" THEN 1 ELSE 0 END) AS DIFF_urprimaanualinput
,SUM(CASE WHEN TRIM(UPPER(PROD.urprimafpinput)) IS NULL AND TRIM(UPPER(UAT.urprimafpinput))="" THEN 1 ELSE 0 END) AS DIFF_urprimafpinput
,SUM(CASE WHEN TRIM(UPPER(PROD.sumaaseguradasegtramoinput)) IS NULL AND TRIM(UPPER(UAT.sumaaseguradasegtramoinput))="" THEN 1 ELSE 0 END) AS DIFF_sumaaseguradasegtramoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.porcdevprimasfinalinput)) IS NULL AND TRIM(UPPER(UAT.porcdevprimasfinalinput))="" THEN 1 ELSE 0 END) AS DIFF_porcdevprimasfinalinput