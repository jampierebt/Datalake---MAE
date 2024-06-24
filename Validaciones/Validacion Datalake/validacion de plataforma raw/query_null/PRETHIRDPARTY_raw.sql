SELECT SUM(CASE WHEN TRIM(UPPER(PROD.PK)) IS NULL AND TRIM(UPPER(UAT.PK))="" THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN TRIM(UPPER(PROD.STATIC)) IS NULL AND TRIM(UPPER(UAT.STATIC))="" THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN TRIM(UPPER(PROD.STATUS)) IS NULL AND TRIM(UPPER(UAT.STATUS))="" THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.ACTIVIDADECONOMICAINPUT)) IS NULL AND TRIM(UPPER(UAT.ACTIVIDADECONOMICAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_ACTIVIDADECONOMICAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ACTIVIDADECONOMICAVALUE)) IS NULL AND TRIM(UPPER(UAT.ACTIVIDADECONOMICAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_ACTIVIDADECONOMICAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREPREDETERMINADOINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBREPREDETERMINADOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREPREDETERMINADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREPREDETERMINADOVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBREPREDETERMINADOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREPREDETERMINADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILUNOINPUT)) IS NULL AND TRIM(UPPER(UAT.EMAILUNOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EMAILUNOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILUNOVALUE)) IS NULL AND TRIM(UPPER(UAT.EMAILUNOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EMAILUNOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILDOSINPUT)) IS NULL AND TRIM(UPPER(UAT.EMAILDOSINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EMAILDOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILDOSVALUE)) IS NULL AND TRIM(UPPER(UAT.EMAILDOSVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EMAILDOSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILTRESINPUT)) IS NULL AND TRIM(UPPER(UAT.EMAILTRESINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EMAILTRESINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILTRESVALUE)) IS NULL AND TRIM(UPPER(UAT.EMAILTRESVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EMAILTRESVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TWITTERIDINPUT)) IS NULL AND TRIM(UPPER(UAT.TWITTERIDINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TWITTERIDINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TWITTERIDVALUE)) IS NULL AND TRIM(UPPER(UAT.TWITTERIDVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TWITTERIDVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FACEBOOKIDINPUT)) IS NULL AND TRIM(UPPER(UAT.FACEBOOKIDINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FACEBOOKIDINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FACEBOOKIDVALUE)) IS NULL AND TRIM(UPPER(UAT.FACEBOOKIDVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FACEBOOKIDVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.YAHOOIDINPUT)) IS NULL AND TRIM(UPPER(UAT.YAHOOIDINPUT))="" THEN 1 ELSE 0 END) AS DIFF_YAHOOIDINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.YAHOOIDVALUE)) IS NULL AND TRIM(UPPER(UAT.YAHOOIDVALUE))="" THEN 1 ELSE 0 END) AS DIFF_YAHOOIDVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SKYPEIDINPUT)) IS NULL AND TRIM(UPPER(UAT.SKYPEIDINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SKYPEIDINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SKYPEIDVALUE)) IS NULL AND TRIM(UPPER(UAT.SKYPEIDVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SKYPEIDVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.IDORIGENTERCEROINPUT)) IS NULL AND TRIM(UPPER(UAT.IDORIGENTERCEROINPUT))="" THEN 1 ELSE 0 END) AS DIFF_IDORIGENTERCEROINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.IDORIGENTERCEROVALUE)) IS NULL AND TRIM(UPPER(UAT.IDORIGENTERCEROVALUE))="" THEN 1 ELSE 0 END) AS DIFF_IDORIGENTERCEROVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOIDENTIFICADORINPUT)) IS NULL AND TRIM(UPPER(UAT.CODIGOIDENTIFICADORINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODIGOIDENTIFICADORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOIDENTIFICADORVALUE)) IS NULL AND TRIM(UPPER(UAT.CODIGOIDENTIFICADORVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODIGOIDENTIFICADORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.USERLOGININPUT)) IS NULL AND TRIM(UPPER(UAT.USERLOGININPUT))="" THEN 1 ELSE 0 END) AS DIFF_USERLOGININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.USERLOGINVALUE)) IS NULL AND TRIM(UPPER(UAT.USERLOGINVALUE))="" THEN 1 ELSE 0 END) AS DIFF_USERLOGINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SYSTEMIDINPUT)) IS NULL AND TRIM(UPPER(UAT.SYSTEMIDINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SYSTEMIDINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SYSTEMIDVALUE)) IS NULL AND TRIM(UPPER(UAT.SYSTEMIDVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SYSTEMIDVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOINTERNOINPUT)) IS NULL AND TRIM(UPPER(UAT.CODIGOINTERNOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODIGOINTERNOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOINTERNOVALUE)) IS NULL AND TRIM(UPPER(UAT.CODIGOINTERNOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODIGOINTERNOVALUE
FROM iter-data-storage-pv-uat.acsele_data.PRETHIRDPARTY_raw UAT 
INNER JOIN interseguro-data.acsele_data.PRETHIRDPARTY_raw PROD 
ON UAT.PK = PROD.PK