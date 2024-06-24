SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN PROD.PK!=UAT.PK THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN PROD.STATIC!=UAT.STATIC THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN PROD.STATUS!=UAT.STATUS THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOAUXINPUT))!=TRIM(UPPER(UAT.FRECUENCIAPAGOAUXINPUT)) THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOAUXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOAUXVALUE))!=TRIM(UPPER(UAT.FRECUENCIAPAGOAUXVALUE)) THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOAUXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT))!=TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE))!=TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORINPUT))!=TRIM(UPPER(UAT.CODVENDEDORINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORVALUE))!=TRIM(UPPER(UAT.CODVENDEDORVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOPRESTAMOINPUT))!=TRIM(UPPER(UAT.MONTOPRESTAMOINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONTOPRESTAMOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOPRESTAMOVALUE))!=TRIM(UPPER(UAT.MONTOPRESTAMOVALUE)) THEN 1 ELSE 0 END) AS DIFF_MONTOPRESTAMOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOASEGURADOINPUT))!=TRIM(UPPER(UAT.MONTOASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONTOASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOASEGURADOVALUE))!=TRIM(UPPER(UAT.MONTOASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_MONTOASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCUOTASINPUT))!=TRIM(UPPER(UAT.NUMEROCUOTASINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMEROCUOTASINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCUOTASVALUE))!=TRIM(UPPER(UAT.NUMEROCUOTASVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMEROCUOTASVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAINPUT))!=TRIM(UPPER(UAT.FECHAVENTAINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAVALUE))!=TRIM(UPPER(UAT.FECHAVENTAVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCCONTRATANTEINPUT))!=TRIM(UPPER(UAT.RUCCONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_RUCCONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCCONTRATANTEVALUE))!=TRIM(UPPER(UAT.RUCCONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_RUCCONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAINPUT))!=TRIM(UPPER(UAT.PRIMACALCULADAINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAVALUE))!=TRIM(UPPER(UAT.PRIMACALCULADAVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASININPUT))!=TRIM(UPPER(UAT.SIMBOLOMONEDASININPUT)) THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASINVALUE))!=TRIM(UPPER(UAT.SIMBOLOMONEDASINVALUE)) THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANPROTECCIONCREDITOSINPUT))!=TRIM(UPPER(UAT.PLANPROTECCIONCREDITOSINPUT)) THEN 1 ELSE 0 END) AS DIFF_PLANPROTECCIONCREDITOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANPROTECCIONCREDITOSVALUE))!=TRIM(UPPER(UAT.PLANPROTECCIONCREDITOSVALUE)) THEN 1 ELSE 0 END) AS DIFF_PLANPROTECCIONCREDITOSVALUE
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.POLPROTECCIONCREDITOS_raw UAT 
INNER JOIN interseguro-data.acsele_data.POLPROTECCIONCREDITOS_raw PROD 
ON UAT.PK = PROD.PK