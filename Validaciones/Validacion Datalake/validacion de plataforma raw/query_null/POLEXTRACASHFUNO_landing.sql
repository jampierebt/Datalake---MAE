SELECT SUM(CASE WHEN TRIM(UPPER(PROD.FUMADORCONDICIONINPUT)) IS NULL AND TRIM(UPPER(UAT.FUMADORCONDICIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FUMADORCONDICIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FUMADORCONDICIONVALUE)) IS NULL AND TRIM(UPPER(UAT.FUMADORCONDICIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FUMADORCONDICIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODINTERMEDIARIOINPUT)) IS NULL AND TRIM(UPPER(UAT.CODINTERMEDIARIOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODINTERMEDIARIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODINTERMEDIARIOVALUE)) IS NULL AND TRIM(UPPER(UAT.CODINTERMEDIARIOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODINTERMEDIARIOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAVENTAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAVENTAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTIENOFIINPUT)) IS NULL AND TRIM(UPPER(UAT.CODAGENTIENOFIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODAGENTIENOFIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTIENOFIVALUE)) IS NULL AND TRIM(UPPER(UAT.CODAGENTIENOFIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODAGENTIENOFIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVEEDORDIGITINPUT)) IS NULL AND TRIM(UPPER(UAT.PROVEEDORDIGITINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PROVEEDORDIGITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVEEDORDIGITVALUE)) IS NULL AND TRIM(UPPER(UAT.PROVEEDORDIGITVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PROVEEDORDIGITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOASISTINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOASISTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOASISTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOASISTVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOASISTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOASISTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NROTARJETACTAINPUT)) IS NULL AND TRIM(UPPER(UAT.NROTARJETACTAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NROTARJETACTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NROTARJETACTAVALUE)) IS NULL AND TRIM(UPPER(UAT.NROTARJETACTAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NROTARJETACTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECVENTARJETACTAINPUT)) IS NULL AND TRIM(UPPER(UAT.FECVENTARJETACTAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECVENTARJETACTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECVENTARJETACTAVALUE)) IS NULL AND TRIM(UPPER(UAT.FECVENTARJETACTAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECVENTARJETACTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAANULFUTUROINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAANULFUTUROINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAANULFUTUROINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAANULFUTUROVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAANULFUTUROVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAANULFUTUROVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORINPUT)) IS NULL AND TRIM(UPPER(UAT.CODVENDEDORINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORVALUE)) IS NULL AND TRIM(UPPER(UAT.CODVENDEDORVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMACALCULADAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMACALCULADAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOAUXINPUT)) IS NULL AND TRIM(UPPER(UAT.FRECUENCIAPAGOAUXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOAUXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOAUXVALUE)) IS NULL AND TRIM(UPPER(UAT.FRECUENCIAPAGOAUXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOAUXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOASEGURADOINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOASEGURADOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOASEGURADOVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOASEGURADOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECACTTARJETACTAINPUT)) IS NULL AND TRIM(UPPER(UAT.FECACTTARJETACTAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECACTTARJETACTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECACTTARJETACTAVALUE)) IS NULL AND TRIM(UPPER(UAT.FECACTTARJETACTAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECACTTARJETACTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASININPUT)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDASININPUT))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASINVALUE)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDASINVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSININPUT)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDAPLSININPUT))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSINVALUE)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDAPLSINVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANEXTRACASHFUNOINPUT)) IS NULL AND TRIM(UPPER(UAT.PLANEXTRACASHFUNOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PLANEXTRACASHFUNOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANEXTRACASHFUNOVALUE)) IS NULL AND TRIM(UPPER(UAT.PLANEXTRACASHFUNOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PLANEXTRACASHFUNOVALUE