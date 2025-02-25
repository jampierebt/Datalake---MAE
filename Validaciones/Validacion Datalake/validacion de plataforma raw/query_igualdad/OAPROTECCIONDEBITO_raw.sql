SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN TRIM(UPPER(PROD.PK))!=TRIM(UPPER(UAT.PK)) THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN TRIM(UPPER(PROD.STATIC))!=TRIM(UPPER(UAT.STATIC)) THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN TRIM(UPPER(PROD.STATUS))!=TRIM(UPPER(UAT.STATUS)) THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADINPUT))!=TRIM(UPPER(UAT.EDADINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADVALUE))!=TRIM(UPPER(UAT.EDADVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMPLANINTERLOCINPUT))!=TRIM(UPPER(UAT.NUMPLANINTERLOCINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMPLANINTERLOCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMPLANINTERLOCVALUE))!=TRIM(UPPER(UAT.NUMPLANINTERLOCVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMPLANINTERLOCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TARIFESPMIGRPDINPUT))!=TRIM(UPPER(UAT.TARIFESPMIGRPDINPUT)) THEN 1 ELSE 0 END) AS DIFF_TARIFESPMIGRPDINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TARIFESPMIGRPDVALUE))!=TRIM(UPPER(UAT.TARIFESPMIGRPDVALUE)) THEN 1 ELSE 0 END) AS DIFF_TARIFESPMIGRPDVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FMOVIMIENTOINPUT))!=TRIM(UPPER(UAT.FMOVIMIENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_FMOVIMIENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FMOVIMIENTOVALUE))!=TRIM(UPPER(UAT.FMOVIMIENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_FMOVIMIENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOSININPUT))!=TRIM(UPPER(UAT.FECHANACIMIENTOSININPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOSINVALUE))!=TRIM(UPPER(UAT.FECHANACIMIENTOSINVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAEXTRACTOINPUT))!=TRIM(UPPER(UAT.FECHAEXTRACTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAEXTRACTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAEXTRACTOVALUE))!=TRIM(UPPER(UAT.FECHAEXTRACTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAEXTRACTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRACTOFNINPUT))!=TRIM(UPPER(UAT.EXTRACTOFNINPUT)) THEN 1 ELSE 0 END) AS DIFF_EXTRACTOFNINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRACTOFNVALUE))!=TRIM(UPPER(UAT.EXTRACTOFNVALUE)) THEN 1 ELSE 0 END) AS DIFF_EXTRACTOFNVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRACTOANUALINPUT))!=TRIM(UPPER(UAT.EXTRACTOANUALINPUT)) THEN 1 ELSE 0 END) AS DIFF_EXTRACTOANUALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRACTOANUALVALUE))!=TRIM(UPPER(UAT.EXTRACTOANUALVALUE)) THEN 1 ELSE 0 END) AS DIFF_EXTRACTOANUALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADCONEXTRACTOINPUT))!=TRIM(UPPER(UAT.EDADCONEXTRACTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADCONEXTRACTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADCONEXTRACTOVALUE))!=TRIM(UPPER(UAT.EDADCONEXTRACTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADCONEXTRACTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGMASIVOINPUT))!=TRIM(UPPER(UAT.EDADMINIMAASEGMASIVOINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGMASIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGMASIVOVALUE))!=TRIM(UPPER(UAT.EDADMINIMAASEGMASIVOVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGMASIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGMASIVOINPUT))!=TRIM(UPPER(UAT.EDADMAXIMAASEGMASIVOINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGMASIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGMASIVOVALUE))!=TRIM(UPPER(UAT.EDADMAXIMAASEGMASIVOVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGMASIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGMASIVOINPUT))!=TRIM(UPPER(UAT.EDADPERMANASEGMASIVOINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGMASIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGMASIVOVALUE))!=TRIM(UPPER(UAT.EDADPERMANASEGMASIVOVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGMASIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXPERCONEXTRACTOINPUT))!=TRIM(UPPER(UAT.EDADMAXPERCONEXTRACTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXPERCONEXTRACTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXPERCONEXTRACTOVALUE))!=TRIM(UPPER(UAT.EDADMAXPERCONEXTRACTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXPERCONEXTRACTOVALUE
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.OAPROTECCIONDEBITO_raw UAT 
INNER JOIN interseguro-data.acsele_data.OAPROTECCIONDEBITO_raw PROD 
ON UAT.PK = PROD.PK