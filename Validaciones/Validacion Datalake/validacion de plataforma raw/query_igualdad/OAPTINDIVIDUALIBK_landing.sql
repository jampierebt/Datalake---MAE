SELECT SUM(CASE WHEN PROD.auditdate!=UAT.auditdate THEN 1 ELSE 0 END) AS DIFF_auditdate
,SUM(CASE WHEN PROD.pk!=UAT.pk THEN 1 ELSE 0 END) AS DIFF_pk
,SUM(CASE WHEN TRIM(UPPER(PROD.static))!=TRIM(UPPER(UAT.static)) THEN 1 ELSE 0 END) AS DIFF_static
,SUM(CASE WHEN PROD.status!=UAT.status THEN 1 ELSE 0 END) AS DIFF_status
,SUM(CASE WHEN TRIM(UPPER(PROD.edadinput))!=TRIM(UPPER(UAT.edadinput)) THEN 1 ELSE 0 END) AS DIFF_edadinput
,SUM(CASE WHEN TRIM(UPPER(PROD.edadvalue))!=TRIM(UPPER(UAT.edadvalue)) THEN 1 ELSE 0 END) AS DIFF_edadvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.numplaninterlocbinput))!=TRIM(UPPER(UAT.numplaninterlocbinput)) THEN 1 ELSE 0 END) AS DIFF_numplaninterlocbinput
,SUM(CASE WHEN TRIM(UPPER(PROD.numplaninterlocbvalue))!=TRIM(UPPER(UAT.numplaninterlocbvalue)) THEN 1 ELSE 0 END) AS DIFF_numplaninterlocbvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fmovimientoinput))!=TRIM(UPPER(UAT.fmovimientoinput)) THEN 1 ELSE 0 END) AS DIFF_fmovimientoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.fmovimientovalue))!=TRIM(UPPER(UAT.fmovimientovalue)) THEN 1 ELSE 0 END) AS DIFF_fmovimientovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechanacimientosininput))!=TRIM(UPPER(UAT.fechanacimientosininput)) THEN 1 ELSE 0 END) AS DIFF_fechanacimientosininput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechanacimientosinvalue))!=TRIM(UPPER(UAT.fechanacimientosinvalue)) THEN 1 ELSE 0 END) AS DIFF_fechanacimientosinvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechaextractoinput))!=TRIM(UPPER(UAT.fechaextractoinput)) THEN 1 ELSE 0 END) AS DIFF_fechaextractoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechaextractovalue))!=TRIM(UPPER(UAT.fechaextractovalue)) THEN 1 ELSE 0 END) AS DIFF_fechaextractovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.extractofninput))!=TRIM(UPPER(UAT.extractofninput)) THEN 1 ELSE 0 END) AS DIFF_extractofninput
,SUM(CASE WHEN TRIM(UPPER(PROD.extractofnvalue))!=TRIM(UPPER(UAT.extractofnvalue)) THEN 1 ELSE 0 END) AS DIFF_extractofnvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.extractoanualinput))!=TRIM(UPPER(UAT.extractoanualinput)) THEN 1 ELSE 0 END) AS DIFF_extractoanualinput
,SUM(CASE WHEN TRIM(UPPER(PROD.extractoanualvalue))!=TRIM(UPPER(UAT.extractoanualvalue)) THEN 1 ELSE 0 END) AS DIFF_extractoanualvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.edadconextractoinput))!=TRIM(UPPER(UAT.edadconextractoinput)) THEN 1 ELSE 0 END) AS DIFF_edadconextractoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.edadconextractovalue))!=TRIM(UPPER(UAT.edadconextractovalue)) THEN 1 ELSE 0 END) AS DIFF_edadconextractovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.edadminimaasegmasivoinput))!=TRIM(UPPER(UAT.edadminimaasegmasivoinput)) THEN 1 ELSE 0 END) AS DIFF_edadminimaasegmasivoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.edadminimaasegmasivovalue))!=TRIM(UPPER(UAT.edadminimaasegmasivovalue)) THEN 1 ELSE 0 END) AS DIFF_edadminimaasegmasivovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.edadmaximaasegmasivoinput))!=TRIM(UPPER(UAT.edadmaximaasegmasivoinput)) THEN 1 ELSE 0 END) AS DIFF_edadmaximaasegmasivoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.edadmaximaasegmasivovalue))!=TRIM(UPPER(UAT.edadmaximaasegmasivovalue)) THEN 1 ELSE 0 END) AS DIFF_edadmaximaasegmasivovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.edadpermanasegmasivoinput))!=TRIM(UPPER(UAT.edadpermanasegmasivoinput)) THEN 1 ELSE 0 END) AS DIFF_edadpermanasegmasivoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.edadpermanasegmasivovalue))!=TRIM(UPPER(UAT.edadpermanasegmasivovalue)) THEN 1 ELSE 0 END) AS DIFF_edadpermanasegmasivovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.edadmaxperconextractoinput))!=TRIM(UPPER(UAT.edadmaxperconextractoinput)) THEN 1 ELSE 0 END) AS DIFF_edadmaxperconextractoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.edadmaxperconextractovalue))!=TRIM(UPPER(UAT.edadmaxperconextractovalue)) THEN 1 ELSE 0 END) AS DIFF_edadmaxperconextractovalue