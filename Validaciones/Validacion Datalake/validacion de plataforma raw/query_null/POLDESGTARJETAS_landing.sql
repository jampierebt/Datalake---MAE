SELECT SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTIENOFIINPUT)) IS NULL AND TRIM(UPPER(UAT.CODAGENTIENOFIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODAGENTIENOFIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTIENOFIVALUE)) IS NULL AND TRIM(UPPER(UAT.CODAGENTIENOFIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODAGENTIENOFIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORINPUT)) IS NULL AND TRIM(UPPER(UAT.CODVENDEDORINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORVALUE)) IS NULL AND TRIM(UPPER(UAT.CODVENDEDORVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAVENTAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAVENTAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRODDESGRAVAMENINPUT)) IS NULL AND TRIM(UPPER(UAT.PRODDESGRAVAMENINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRODDESGRAVAMENINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRODDESGRAVAMENVALUE)) IS NULL AND TRIM(UPPER(UAT.PRODDESGRAVAMENVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRODDESGRAVAMENVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SUBPRODUCTOPLANINPUT)) IS NULL AND TRIM(UPPER(UAT.SUBPRODUCTOPLANINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SUBPRODUCTOPLANINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SUBPRODUCTOPLANVALUE)) IS NULL AND TRIM(UPPER(UAT.SUBPRODUCTOPLANVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SUBPRODUCTOPLANVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPOLIZAHIPINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPOPOLIZAHIPINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPOPOLIZAHIPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPOLIZAHIPVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPOPOLIZAHIPVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPOPOLIZAHIPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOASEGURADOINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPOASEGURADOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPOASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOASEGURADOVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPOASEGURADOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPOASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAANULFUTUROINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAANULFUTUROINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAANULFUTUROINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAANULFUTUROVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAANULFUTUROVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAANULFUTUROVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVEEDORDIGITINPUT)) IS NULL AND TRIM(UPPER(UAT.PROVEEDORDIGITINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PROVEEDORDIGITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVEEDORDIGITVALUE)) IS NULL AND TRIM(UPPER(UAT.PROVEEDORDIGITVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PROVEEDORDIGITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODINTERMEDIARIOINPUT)) IS NULL AND TRIM(UPPER(UAT.CODINTERMEDIARIOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODINTERMEDIARIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODINTERMEDIARIOVALUE)) IS NULL AND TRIM(UPPER(UAT.CODINTERMEDIARIOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODINTERMEDIARIOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.GASADMINCANPINPUT)) IS NULL AND TRIM(UPPER(UAT.GASADMINCANPINPUT))="" THEN 1 ELSE 0 END) AS DIFF_GASADMINCANPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.GASADMINCANPVALUE)) IS NULL AND TRIM(UPPER(UAT.GASADMINCANPVALUE))="" THEN 1 ELSE 0 END) AS DIFF_GASADMINCANPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOASISTINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOASISTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOASISTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOASISTVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOASISTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOASISTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCREDITOTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMEROCREDITOTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROCREDITOTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCREDITOTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMEROCREDITOTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROCREDITOTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NROTARJETACTATRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.NROTARJETACTATRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NROTARJETACTATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NROTARJETACTATRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.NROTARJETACTATRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NROTARJETACTATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOUNICOCLIENTEINPUT)) IS NULL AND TRIM(UPPER(UAT.CODIGOUNICOCLIENTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODIGOUNICOCLIENTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOUNICOCLIENTEVALUE)) IS NULL AND TRIM(UPPER(UAT.CODIGOUNICOCLIENTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODIGOUNICOCLIENTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREUNOTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBREUNOTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREUNOTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREUNOTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBREUNOTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREUNOTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREDOSTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBREDOSTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREDOSTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREDOSTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBREDOSTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREDOSTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOUNOTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.APELLIDOUNOTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDOUNOTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOUNOTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.APELLIDOUNOTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDOUNOTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDODOSTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.APELLIDODOSTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDODOSTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDODOSTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.APELLIDODOSTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDODOSTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPODOCTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPODOCTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPODOCTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPODOCTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMERODOCTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMERODOCTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMERODOCTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMERODOCTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FNACTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.FNACTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FNACTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FNACTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.FNACTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FNACTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRESTAMOINICIALTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.PRESTAMOINICIALTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRESTAMOINICIALTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRESTAMOINICIALTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.PRESTAMOINICIALTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRESTAMOINICIALTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SALDOINSOLUTOINPUT)) IS NULL AND TRIM(UPPER(UAT.SALDOINSOLUTOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SALDOINSOLUTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SALDOINSOLUTOVALUE)) IS NULL AND TRIM(UPPER(UAT.SALDOINSOLUTOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SALDOINSOLUTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TASATRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.TASATRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TASATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TASATRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.TASATRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TASATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADADESGINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMACALCULADADESGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADADESGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADADESGVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMACALCULADADESGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADADESGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOBASEINPUT)) IS NULL AND TRIM(UPPER(UAT.PERIODOBASEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PERIODOBASEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOBASEVALUE)) IS NULL AND TRIM(UPPER(UAT.PERIODOBASEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PERIODOBASEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCUOTATRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMEROCUOTATRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROCUOTATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCUOTATRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMEROCUOTATRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROCUOTATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSININPUT)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDAPLSININPUT))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSINVALUE)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDAPLSINVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASININPUT)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDASININPUT))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASINVALUE)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDASINVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASINVALUE