SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN PROD.PK!=UAT.PK THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN PROD.STATIC!=UAT.STATIC THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN PROD.STATUS!=UAT.STATUS THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT))!=TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE))!=TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SALDOINSOLUTOINPUT))!=TRIM(UPPER(UAT.SALDOINSOLUTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_SALDOINSOLUTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SALDOINSOLUTOVALUE))!=TRIM(UPPER(UAT.SALDOINSOLUTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_SALDOINSOLUTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODINTERMEDIARIOINPUT))!=TRIM(UPPER(UAT.CODINTERMEDIARIOINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODINTERMEDIARIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODINTERMEDIARIOVALUE))!=TRIM(UPPER(UAT.CODINTERMEDIARIOVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODINTERMEDIARIOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.GASADMINCANPINPUT))!=TRIM(UPPER(UAT.GASADMINCANPINPUT)) THEN 1 ELSE 0 END) AS DIFF_GASADMINCANPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.GASADMINCANPVALUE))!=TRIM(UPPER(UAT.GASADMINCANPVALUE)) THEN 1 ELSE 0 END) AS DIFF_GASADMINCANPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAINPUT))!=TRIM(UPPER(UAT.FECHAVENTAINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAVALUE))!=TRIM(UPPER(UAT.FECHAVENTAVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTIENOFIINPUT))!=TRIM(UPPER(UAT.CODAGENTIENOFIINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODAGENTIENOFIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTIENOFIVALUE))!=TRIM(UPPER(UAT.CODAGENTIENOFIVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODAGENTIENOFIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVEEDORDIGITINPUT))!=TRIM(UPPER(UAT.PROVEEDORDIGITINPUT)) THEN 1 ELSE 0 END) AS DIFF_PROVEEDORDIGITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVEEDORDIGITVALUE))!=TRIM(UPPER(UAT.PROVEEDORDIGITVALUE)) THEN 1 ELSE 0 END) AS DIFF_PROVEEDORDIGITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOASISTINPUT))!=TRIM(UPPER(UAT.FECHANACIMIENTOASISTINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOASISTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOASISTVALUE))!=TRIM(UPPER(UAT.FECHANACIMIENTOASISTVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOASISTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAANULFUTUROINPUT))!=TRIM(UPPER(UAT.FECHAANULFUTUROINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAANULFUTUROINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAANULFUTUROVALUE))!=TRIM(UPPER(UAT.FECHAANULFUTUROVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAANULFUTUROVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORINPUT))!=TRIM(UPPER(UAT.CODVENDEDORINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORVALUE))!=TRIM(UPPER(UAT.CODVENDEDORVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASININPUT))!=TRIM(UPPER(UAT.SIMBOLOMONEDASININPUT)) THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASINVALUE))!=TRIM(UPPER(UAT.SIMBOLOMONEDASINVALUE)) THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSININPUT))!=TRIM(UPPER(UAT.SIMBOLOMONEDAPLSININPUT)) THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSINVALUE))!=TRIM(UPPER(UAT.SIMBOLOMONEDAPLSINVALUE)) THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRODDESGRAVAMENINPUT))!=TRIM(UPPER(UAT.PRODDESGRAVAMENINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRODDESGRAVAMENINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRODDESGRAVAMENVALUE))!=TRIM(UPPER(UAT.PRODDESGRAVAMENVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRODDESGRAVAMENVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SUBPRODUCTOPLANINPUT))!=TRIM(UPPER(UAT.SUBPRODUCTOPLANINPUT)) THEN 1 ELSE 0 END) AS DIFF_SUBPRODUCTOPLANINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SUBPRODUCTOPLANVALUE))!=TRIM(UPPER(UAT.SUBPRODUCTOPLANVALUE)) THEN 1 ELSE 0 END) AS DIFF_SUBPRODUCTOPLANVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPOLIZAHIPINPUT))!=TRIM(UPPER(UAT.TIPOPOLIZAHIPINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOPOLIZAHIPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPOLIZAHIPVALUE))!=TRIM(UPPER(UAT.TIPOPOLIZAHIPVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPOPOLIZAHIPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOASEGURADOINPUT))!=TRIM(UPPER(UAT.TIPOASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOASEGURADOVALUE))!=TRIM(UPPER(UAT.TIPOASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPOASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOUNICOCLIENTEINPUT))!=TRIM(UPPER(UAT.CODIGOUNICOCLIENTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODIGOUNICOCLIENTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOUNICOCLIENTEVALUE))!=TRIM(UPPER(UAT.CODIGOUNICOCLIENTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODIGOUNICOCLIENTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCREDITOTRAMAINPUT))!=TRIM(UPPER(UAT.NUMEROCREDITOTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMEROCREDITOTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCREDITOTRAMAVALUE))!=TRIM(UPPER(UAT.NUMEROCREDITOTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMEROCREDITOTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRESTAMOINICIALTRAMAINPUT))!=TRIM(UPPER(UAT.PRESTAMOINICIALTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRESTAMOINICIALTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRESTAMOINICIALTRAMAVALUE))!=TRIM(UPPER(UAT.PRESTAMOINICIALTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRESTAMOINICIALTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TASATRAMAINPUT))!=TRIM(UPPER(UAT.TASATRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_TASATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TASATRAMAVALUE))!=TRIM(UPPER(UAT.TASATRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_TASATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADADESGINPUT))!=TRIM(UPPER(UAT.PRIMACALCULADADESGINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADADESGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADADESGVALUE))!=TRIM(UPPER(UAT.PRIMACALCULADADESGVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADADESGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCUOTATRAMAINPUT))!=TRIM(UPPER(UAT.NUMEROCUOTATRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMEROCUOTATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCUOTATRAMAVALUE))!=TRIM(UPPER(UAT.NUMEROCUOTATRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMEROCUOTATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NROTARJETACTATRAMAINPUT))!=TRIM(UPPER(UAT.NROTARJETACTATRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_NROTARJETACTATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NROTARJETACTATRAMAVALUE))!=TRIM(UPPER(UAT.NROTARJETACTATRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_NROTARJETACTATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREUNOTRAMAINPUT))!=TRIM(UPPER(UAT.NOMBREUNOTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBREUNOTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREUNOTRAMAVALUE))!=TRIM(UPPER(UAT.NOMBREUNOTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBREUNOTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREDOSTRAMAINPUT))!=TRIM(UPPER(UAT.NOMBREDOSTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBREDOSTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREDOSTRAMAVALUE))!=TRIM(UPPER(UAT.NOMBREDOSTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBREDOSTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOUNOTRAMAINPUT))!=TRIM(UPPER(UAT.APELLIDOUNOTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_APELLIDOUNOTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOUNOTRAMAVALUE))!=TRIM(UPPER(UAT.APELLIDOUNOTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_APELLIDOUNOTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDODOSTRAMAINPUT))!=TRIM(UPPER(UAT.APELLIDODOSTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_APELLIDODOSTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDODOSTRAMAVALUE))!=TRIM(UPPER(UAT.APELLIDODOSTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_APELLIDODOSTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCTRAMAINPUT))!=TRIM(UPPER(UAT.TIPODOCTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPODOCTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCTRAMAVALUE))!=TRIM(UPPER(UAT.TIPODOCTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPODOCTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCTRAMAINPUT))!=TRIM(UPPER(UAT.NUMERODOCTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMERODOCTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCTRAMAVALUE))!=TRIM(UPPER(UAT.NUMERODOCTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMERODOCTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FNACTRAMAINPUT))!=TRIM(UPPER(UAT.FNACTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_FNACTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FNACTRAMAVALUE))!=TRIM(UPPER(UAT.FNACTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_FNACTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOBASEINPUT))!=TRIM(UPPER(UAT.PERIODOBASEINPUT)) THEN 1 ELSE 0 END) AS DIFF_PERIODOBASEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOBASEVALUE))!=TRIM(UPPER(UAT.PERIODOBASEVALUE)) THEN 1 ELSE 0 END) AS DIFF_PERIODOBASEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONTRAMAINPUT))!=TRIM(UPPER(UAT.DIRECCIONTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONTRAMAVALUE))!=TRIM(UPPER(UAT.DIRECCIONTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCDESGTRAMAINPUT))!=TRIM(UPPER(UAT.TIPODOCDESGTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPODOCDESGTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCDESGTRAMAVALUE))!=TRIM(UPPER(UAT.TIPODOCDESGTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPODOCDESGTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SALDOPROMEDIOINPUT))!=TRIM(UPPER(UAT.SALDOPROMEDIOINPUT)) THEN 1 ELSE 0 END) AS DIFF_SALDOPROMEDIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SALDOPROMEDIOVALUE))!=TRIM(UPPER(UAT.SALDOPROMEDIOVALUE)) THEN 1 ELSE 0 END) AS DIFF_SALDOPROMEDIOVALUE