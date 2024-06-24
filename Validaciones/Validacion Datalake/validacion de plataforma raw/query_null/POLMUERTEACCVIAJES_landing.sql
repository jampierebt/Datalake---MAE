SELECT SUM(CASE WHEN TRIM(UPPER(PROD.PLANMUERTEACCVIAJESINPUT)) IS NULL AND TRIM(UPPER(UAT.PLANMUERTEACCVIAJESINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PLANMUERTEACCVIAJESINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANMUERTEACCVIAJESVALUE)) IS NULL AND TRIM(UPPER(UAT.PLANMUERTEACCVIAJESVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PLANMUERTEACCVIAJESVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CARGOSINPUT)) IS NULL AND TRIM(UPPER(UAT.CARGOSINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CARGOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CARGOSVALUE)) IS NULL AND TRIM(UPPER(UAT.CARGOSVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CARGOSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DESTINOVIAJEINPUT)) IS NULL AND TRIM(UPPER(UAT.DESTINOVIAJEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DESTINOVIAJEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DESTINOVIAJEVALUE)) IS NULL AND TRIM(UPPER(UAT.DESTINOVIAJEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DESTINOVIAJEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODIASVIAJEMAVINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMERODIASVIAJEMAVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMERODIASVIAJEMAVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODIASVIAJEMAVVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMERODIASVIAJEMAVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMERODIASVIAJEMAVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOVIAJEINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPOVIAJEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPOVIAJEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOVIAJEVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPOVIAJEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPOVIAJEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVEEDORDIGITINPUT)) IS NULL AND TRIM(UPPER(UAT.PROVEEDORDIGITINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PROVEEDORDIGITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVEEDORDIGITVALUE)) IS NULL AND TRIM(UPPER(UAT.PROVEEDORDIGITVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PROVEEDORDIGITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOASISTINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOASISTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOASISTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOASISTVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOASISTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOASISTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMACALCULADAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMACALCULADAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAVALUE