SELECT SUM(CASE WHEN TRIM(UPPER(PROD.EDADINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMPLANINTERLOCBINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMPLANINTERLOCBINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMPLANINTERLOCBINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMPLANINTERLOCBVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMPLANINTERLOCBVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMPLANINTERLOCBVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOMASIVOINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOMASIVOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOMASIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOMASIVOVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOMASIVOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOMASIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGMASIVOINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADMINIMAASEGMASIVOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGMASIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGMASIVOVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADMINIMAASEGMASIVOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGMASIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGMASIVOINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADMAXIMAASEGMASIVOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGMASIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGMASIVOVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADMAXIMAASEGMASIVOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGMASIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGMASIVOINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADPERMANASEGMASIVOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGMASIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGMASIVOVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADPERMANASEGMASIVOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGMASIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADALCAFINPOLMASIVOSINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADALCAFINPOLMASIVOSINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADALCAFINPOLMASIVOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADALCAFINPOLMASIVOSVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADALCAFINPOLMASIVOSVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADALCAFINPOLMASIVOSVALUE