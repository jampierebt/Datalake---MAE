SELECT SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAPRIMATRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.MONEDAPRIMATRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONEDAPRIMATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAPRIMATRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.MONEDAPRIMATRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONEDAPRIMATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMACALCULADAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMACALCULADAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAVENTAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAVENTAVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAVENTAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAVENTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORINPUT)) IS NULL AND TRIM(UPPER(UAT.CODVENDEDORINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODVENDEDORVALUE)) IS NULL AND TRIM(UPPER(UAT.CODVENDEDORVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODVENDEDORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.REASEGURADORINTERBINPUT)) IS NULL AND TRIM(UPPER(UAT.REASEGURADORINTERBINPUT))="" THEN 1 ELSE 0 END) AS DIFF_REASEGURADORINTERBINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.REASEGURADORINTERBVALUE)) IS NULL AND TRIM(UPPER(UAT.REASEGURADORINTERBVALUE))="" THEN 1 ELSE 0 END) AS DIFF_REASEGURADORINTERBVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOASEGURADOTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOASEGURADOTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOASEGURADOTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOASEGURADOTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOASEGURADOTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOASEGURADOTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCCONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.RUCCONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RUCCONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCCONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.RUCCONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RUCCONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASININPUT)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDASININPUT))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDASINVALUE)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDASINVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDASINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSININPUT)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDAPLSININPUT))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSINVALUE)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDAPLSINVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSINVALUE
FROM iter-data-storage-pv-uat.acsele_data.POLINTERBANKACCIDENTES_raw UAT 
INNER JOIN interseguro-data.acsele_data.POLINTERBANKACCIDENTES_raw PROD 
ON UAT.PK = PROD.PK