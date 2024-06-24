SELECT SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOAUXINPUT)) IS NULL AND TRIM(UPPER(UAT.FRECUENCIAPAGOAUXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOAUXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOAUXVALUE)) IS NULL AND TRIM(UPPER(UAT.FRECUENCIAPAGOAUXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOAUXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROPOLMATRIZGEINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMEROPOLMATRIZGEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROPOLMATRIZGEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROPOLMATRIZGEVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMEROPOLMATRIZGEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROPOLMATRIZGEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCERTIFICADOGEINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMEROCERTIFICADOGEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROCERTIFICADOGEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCERTIFICADOGEVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMEROCERTIFICADOGEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROCERTIFICADOGEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIENDAINPUT)) IS NULL AND TRIM(UPPER(UAT.TIENDAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIENDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIENDAVALUE)) IS NULL AND TRIM(UPPER(UAT.TIENDAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIENDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANCONTRATADOINPUT)) IS NULL AND TRIM(UPPER(UAT.PLANCONTRATADOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PLANCONTRATADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANCONTRATADOVALUE)) IS NULL AND TRIM(UPPER(UAT.PLANCONTRATADOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PLANCONTRATADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SKUINPUT)) IS NULL AND TRIM(UPPER(UAT.SKUINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SKUINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SKUVALUE)) IS NULL AND TRIM(UPPER(UAT.SKUVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SKUVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREARTICULOINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBREARTICULOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREARTICULOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREARTICULOVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBREARTICULOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREARTICULOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHACOMPRAINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHACOMPRAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHACOMPRAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHACOMPRAVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHACOMPRAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHACOMPRAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PLAZOGARANTIAINPUT)) IS NULL AND TRIM(UPPER(UAT.PLAZOGARANTIAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PLAZOGARANTIAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLAZOGARANTIAVALUE)) IS NULL AND TRIM(UPPER(UAT.PLAZOGARANTIAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PLAZOGARANTIAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMARIESGOINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMARIESGOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMARIESGOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMARIESGOVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMARIESGOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMARIESGOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARTICIPACIONINTERSEGINPUT)) IS NULL AND TRIM(UPPER(UAT.PARTICIPACIONINTERSEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARTICIPACIONINTERSEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARTICIPACIONINTERSEGVALUE)) IS NULL AND TRIM(UPPER(UAT.PARTICIPACIONINTERSEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARTICIPACIONINTERSEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMISIONCOASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.COMISIONCOASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_COMISIONCOASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMISIONCOASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.COMISIONCOASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_COMISIONCOASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.GASTOSCOASEGUROINPUT)) IS NULL AND TRIM(UPPER(UAT.GASTOSCOASEGUROINPUT))="" THEN 1 ELSE 0 END) AS DIFF_GASTOSCOASEGUROINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.GASTOSCOASEGUROVALUE)) IS NULL AND TRIM(UPPER(UAT.GASTOSCOASEGUROVALUE))="" THEN 1 ELSE 0 END) AS DIFF_GASTOSCOASEGUROVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARTICIPACCARDIFINPUT)) IS NULL AND TRIM(UPPER(UAT.PARTICIPACCARDIFINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARTICIPACCARDIFINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARTICIPACCARDIFVALUE)) IS NULL AND TRIM(UPPER(UAT.PARTICIPACCARDIFVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARTICIPACCARDIFVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCUMENTOGEINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPODOCUMENTOGEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPODOCUMENTOGEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCUMENTOGEVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPODOCUMENTOGEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPODOCUMENTOGEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCUMENTOGEINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMERODOCUMENTOGEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMERODOCUMENTOGEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCUMENTOGEVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMERODOCUMENTOGEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMERODOCUMENTOGEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREUNOASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBREUNOASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREUNOASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREUNOASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBREUNOASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREUNOASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREDOSASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBREDOSASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREDOSASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREDOSASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBREDOSASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREDOSASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOPATERNOASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.APELLIDOPATERNOASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDOPATERNOASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOPATERNOASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.APELLIDOPATERNOASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDOPATERNOASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOMATERNOASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.APELLIDOMATERNOASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDOMATERNOASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOMATERNOASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.APELLIDOMATERNOASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDOMATERNOASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOASEGGEINPUT)) IS NULL AND TRIM(UPPER(UAT.SEXOASEGGEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SEXOASEGGEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOASEGGEVALUE)) IS NULL AND TRIM(UPPER(UAT.SEXOASEGGEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SEXOASEGGEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAGEINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMACALCULADAGEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAGEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACALCULADAGEVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMACALCULADAGEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACALCULADAGEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCCONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.RUCCONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RUCCONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCCONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.RUCCONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RUCCONTRATANTEVALUE
FROM iter-data-storage-pv-uat.acsele_data.POLGARANTIAEXTENDIDA_raw UAT 
INNER JOIN interseguro-data.acsele_data.POLGARANTIAEXTENDIDA_raw PROD 
ON UAT.PK = PROD.PK