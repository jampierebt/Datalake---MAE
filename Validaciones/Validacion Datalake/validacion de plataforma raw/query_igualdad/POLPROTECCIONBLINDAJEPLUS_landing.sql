SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN TRIM(UPPER(PROD.PK))!=TRIM(UPPER(UAT.PK)) THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN TRIM(UPPER(PROD.STATIC))!=TRIM(UPPER(UAT.STATIC)) THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN TRIM(UPPER(PROD.STATUS))!=TRIM(UPPER(UAT.STATUS)) THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTIENOFIINPUT))!=TRIM(UPPER(UAT.CODAGENTIENOFIINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODAGENTIENOFIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTIENOFIVALUE))!=TRIM(UPPER(UAT.CODAGENTIENOFIVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODAGENTIENOFIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAINPUT))!=TRIM(UPPER(UAT.FECHAVENTAINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAVALUE))!=TRIM(UPPER(UAT.FECHAVENTAVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVEEDORDIGITINPUT))!=TRIM(UPPER(UAT.PROVEEDORDIGITINPUT)) THEN 1 ELSE 0 END) AS DIFF_PROVEEDORDIGITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVEEDORDIGITVALUE))!=TRIM(UPPER(UAT.PROVEEDORDIGITVALUE)) THEN 1 ELSE 0 END) AS DIFF_PROVEEDORDIGITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCUMENTOINPUT))!=TRIM(UPPER(UAT.TIPODOCUMENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPODOCUMENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCUMENTOVALUE))!=TRIM(UPPER(UAT.TIPODOCUMENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPODOCUMENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCUMENTOINPUT))!=TRIM(UPPER(UAT.NUMERODOCUMENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMERODOCUMENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCUMENTOVALUE))!=TRIM(UPPER(UAT.NUMERODOCUMENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMERODOCUMENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOTARJETAPPALINPUT))!=TRIM(UPPER(UAT.TIPOTARJETAPPALINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOTARJETAPPALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOTARJETAPPALVALUE))!=TRIM(UPPER(UAT.TIPOTARJETAPPALVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPOTARJETAPPALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NROTARJETAPPALINPUT))!=TRIM(UPPER(UAT.NROTARJETAPPALINPUT)) THEN 1 ELSE 0 END) AS DIFF_NROTARJETAPPALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NROTARJETAPPALVALUE))!=TRIM(UPPER(UAT.NROTARJETAPPALVALUE)) THEN 1 ELSE 0 END) AS DIFF_NROTARJETAPPALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODINTERMEDIARIOINPUT))!=TRIM(UPPER(UAT.CODINTERMEDIARIOINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODINTERMEDIARIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODINTERMEDIARIOVALUE))!=TRIM(UPPER(UAT.CODINTERMEDIARIOVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODINTERMEDIARIOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.GASADMINCANPINPUT))!=TRIM(UPPER(UAT.GASADMINCANPINPUT)) THEN 1 ELSE 0 END) AS DIFF_GASADMINCANPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.GASADMINCANPVALUE))!=TRIM(UPPER(UAT.GASADMINCANPVALUE)) THEN 1 ELSE 0 END) AS DIFF_GASADMINCANPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORINPUT))!=TRIM(UPPER(UAT.CODVENDEDORINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORVALUE))!=TRIM(UPPER(UAT.CODVENDEDORVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAANULFUTUROINPUT))!=TRIM(UPPER(UAT.FECHAANULFUTUROINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAANULFUTUROINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAANULFUTUROVALUE))!=TRIM(UPPER(UAT.FECHAANULFUTUROVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAANULFUTUROVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NROTARJETACTAINPUT))!=TRIM(UPPER(UAT.NROTARJETACTAINPUT)) THEN 1 ELSE 0 END) AS DIFF_NROTARJETACTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NROTARJETACTAVALUE))!=TRIM(UPPER(UAT.NROTARJETACTAVALUE)) THEN 1 ELSE 0 END) AS DIFF_NROTARJETACTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDATARJETACTAINPUT))!=TRIM(UPPER(UAT.MONEDATARJETACTAINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONEDATARJETACTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDATARJETACTAVALUE))!=TRIM(UPPER(UAT.MONEDATARJETACTAVALUE)) THEN 1 ELSE 0 END) AS DIFF_MONEDATARJETACTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECVENTARJETACTAINPUT))!=TRIM(UPPER(UAT.FECVENTARJETACTAINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECVENTARJETACTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECVENTARJETACTAVALUE))!=TRIM(UPPER(UAT.FECVENTARJETACTAVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECVENTARJETACTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAACTIVACIONTCINPUT))!=TRIM(UPPER(UAT.FECHAACTIVACIONTCINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAACTIVACIONTCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAACTIVACIONTCVALUE))!=TRIM(UPPER(UAT.FECHAACTIVACIONTCVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAACTIVACIONTCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT))!=TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE))!=TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOASISTINPUT))!=TRIM(UPPER(UAT.FECHANACIMIENTOASISTINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOASISTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOASISTVALUE))!=TRIM(UPPER(UAT.FECHANACIMIENTOASISTVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOASISTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAINPUT))!=TRIM(UPPER(UAT.PRIMACALCULADAINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAVALUE))!=TRIM(UPPER(UAT.PRIMACALCULADAVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSININPUT))!=TRIM(UPPER(UAT.SIMBOLOMONEDAPLSININPUT)) THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSINVALUE))!=TRIM(UPPER(UAT.SIMBOLOMONEDAPLSINVALUE)) THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASININPUT))!=TRIM(UPPER(UAT.SIMBOLOMONEDASININPUT)) THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASINVALUE))!=TRIM(UPPER(UAT.SIMBOLOMONEDASINVALUE)) THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASINVALUE