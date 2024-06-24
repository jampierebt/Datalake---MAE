SELECT SUM(CASE WHEN TRIM(UPPER(PROD.PK)) IS NULL AND TRIM(UPPER(UAT.PK))="" THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN TRIM(UPPER(PROD.STATIC)) IS NULL AND TRIM(UPPER(UAT.STATIC))="" THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN TRIM(UPPER(PROD.STATUS)) IS NULL AND TRIM(UPPER(UAT.STATUS))="" THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMPLANINTERLOCBINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMPLANINTERLOCBINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMPLANINTERLOCBINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMPLANINTERLOCBVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMPLANINTERLOCBVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMPLANINTERLOCBVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OPCIONPBINPUT)) IS NULL AND TRIM(UPPER(UAT.OPCIONPBINPUT))="" THEN 1 ELSE 0 END) AS DIFF_OPCIONPBINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OPCIONPBVALUE)) IS NULL AND TRIM(UPPER(UAT.OPCIONPBVALUE))="" THEN 1 ELSE 0 END) AS DIFF_OPCIONPBVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FMOVIMIENTOINPUT)) IS NULL AND TRIM(UPPER(UAT.FMOVIMIENTOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FMOVIMIENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FMOVIMIENTOVALUE)) IS NULL AND TRIM(UPPER(UAT.FMOVIMIENTOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FMOVIMIENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOSININPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOSININPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOSINVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOSINVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAEXTRACTOINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAEXTRACTOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAEXTRACTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAEXTRACTOVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAEXTRACTOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAEXTRACTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRACTOFNINPUT)) IS NULL AND TRIM(UPPER(UAT.EXTRACTOFNINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EXTRACTOFNINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRACTOFNVALUE)) IS NULL AND TRIM(UPPER(UAT.EXTRACTOFNVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EXTRACTOFNVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRACTOANUALINPUT)) IS NULL AND TRIM(UPPER(UAT.EXTRACTOANUALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EXTRACTOANUALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRACTOANUALVALUE)) IS NULL AND TRIM(UPPER(UAT.EXTRACTOANUALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EXTRACTOANUALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADCONEXTRACTOINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADCONEXTRACTOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADCONEXTRACTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADCONEXTRACTOVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADCONEXTRACTOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADCONEXTRACTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGMASIVOINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADMAXIMAASEGMASIVOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGMASIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGMASIVOVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADMAXIMAASEGMASIVOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGMASIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGMASIVOINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADMINIMAASEGMASIVOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGMASIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGMASIVOVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADMINIMAASEGMASIVOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGMASIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGMASIVOINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADPERMANASEGMASIVOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGMASIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGMASIVOVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADPERMANASEGMASIVOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGMASIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXPERCONEXTRACTOINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADMAXPERCONEXTRACTOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADMAXPERCONEXTRACTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXPERCONEXTRACTOVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADMAXPERCONEXTRACTOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADMAXPERCONEXTRACTOVALUE