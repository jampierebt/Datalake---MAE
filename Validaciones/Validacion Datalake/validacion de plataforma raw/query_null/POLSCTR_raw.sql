SELECT SUM(CASE WHEN TRIM(UPPER(PROD.MONTROTRAMASCTRINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTROTRAMASCTRINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTROTRAMASCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTROTRAMASCTRVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTROTRAMASCTRVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTROTRAMASCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTROTRAMASCTRLCINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTROTRAMASCTRLCINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTROTRAMASCTRLCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTROTRAMASCTRLCVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTROTRAMASCTRLCVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTROTRAMASCTRLCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICACTIVINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICACTIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICACTIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICACTIVVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICACTIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICACTIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.GASTOSADQUISICIONSCTRINPUT)) IS NULL AND TRIM(UPPER(UAT.GASTOSADQUISICIONSCTRINPUT))="" THEN 1 ELSE 0 END) AS DIFF_GASTOSADQUISICIONSCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.GASTOSADQUISICIONSCTRVALUE)) IS NULL AND TRIM(UPPER(UAT.GASTOSADQUISICIONSCTRVALUE))="" THEN 1 ELSE 0 END) AS DIFF_GASTOSADQUISICIONSCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.UTILIDADSCTRINPUT)) IS NULL AND TRIM(UPPER(UAT.UTILIDADSCTRINPUT))="" THEN 1 ELSE 0 END) AS DIFF_UTILIDADSCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.UTILIDADSCTRVALUE)) IS NULL AND TRIM(UPPER(UAT.UTILIDADSCTRVALUE))="" THEN 1 ELSE 0 END) AS DIFF_UTILIDADSCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.GASTOSADMINISTSCTRINPUT)) IS NULL AND TRIM(UPPER(UAT.GASTOSADMINISTSCTRINPUT))="" THEN 1 ELSE 0 END) AS DIFF_GASTOSADMINISTSCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.GASTOSADMINISTSCTRVALUE)) IS NULL AND TRIM(UPPER(UAT.GASTOSADMINISTSCTRVALUE))="" THEN 1 ELSE 0 END) AS DIFF_GASTOSADMINISTSCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DESCUENTOSCTRINPUT)) IS NULL AND TRIM(UPPER(UAT.DESCUENTOSCTRINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DESCUENTOSCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DESCUENTOSCTRVALUE)) IS NULL AND TRIM(UPPER(UAT.DESCUENTOSCTRVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DESCUENTOSCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMISIONMINREASEGUROINPUT)) IS NULL AND TRIM(UPPER(UAT.COMISIONMINREASEGUROINPUT))="" THEN 1 ELSE 0 END) AS DIFF_COMISIONMINREASEGUROINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMISIONMINREASEGUROVALUE)) IS NULL AND TRIM(UPPER(UAT.COMISIONMINREASEGUROVALUE))="" THEN 1 ELSE 0 END) AS DIFF_COMISIONMINREASEGUROVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RPRIMANETAINPUT)) IS NULL AND TRIM(UPPER(UAT.RPRIMANETAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RPRIMANETAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RPRIMANETAVALUE)) IS NULL AND TRIM(UPPER(UAT.RPRIMANETAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RPRIMANETAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RGASEMISINPUT)) IS NULL AND TRIM(UPPER(UAT.RGASEMISINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RGASEMISINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RGASEMISVALUE)) IS NULL AND TRIM(UPPER(UAT.RGASEMISVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RGASEMISVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RIGVINPUT)) IS NULL AND TRIM(UPPER(UAT.RIGVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RIGVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RIGVVALUE)) IS NULL AND TRIM(UPPER(UAT.RIGVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RIGVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RPRIMATOTALINPUT)) IS NULL AND TRIM(UPPER(UAT.RPRIMATOTALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RPRIMATOTALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RPRIMATOTALVALUE)) IS NULL AND TRIM(UPPER(UAT.RPRIMATOTALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RPRIMATOTALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROPROPUESTAINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMEROPROPUESTAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROPROPUESTAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROPROPUESTAVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMEROPROPUESTAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROPROPUESTAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCOTIZACIONINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMEROCOTIZACIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROCOTIZACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCOTIZACIONVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMEROCOTIZACIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMEROCOTIZACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RMAINPUT)) IS NULL AND TRIM(UPPER(UAT.RMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RMAVALUE)) IS NULL AND TRIM(UPPER(UAT.RMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMASEGURADOSSCTRINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMASEGURADOSSCTRINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMASEGURADOSSCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMASEGURADOSSCTRVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMASEGURADOSSCTRVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMASEGURADOSSCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINCOTIZACIONINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINCOTIZACIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINCOTIZACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINCOTIZACIONVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINCOTIZACIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINCOTIZACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSININPUT)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDAPLSININPUT))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SIMBOLOMONEDAPLSINVALUE)) IS NULL AND TRIM(UPPER(UAT.SIMBOLOMONEDAPLSINVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SIMBOLOMONEDAPLSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDEXCLUSIONESINPUT)) IS NULL AND TRIM(UPPER(UAT.INDEXCLUSIONESINPUT))="" THEN 1 ELSE 0 END) AS DIFF_INDEXCLUSIONESINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDEXCLUSIONESVALUE)) IS NULL AND TRIM(UPPER(UAT.INDEXCLUSIONESVALUE))="" THEN 1 ELSE 0 END) AS DIFF_INDEXCLUSIONESVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDCARGATRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.INDCARGATRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_INDCARGATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDCARGATRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.INDCARGATRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_INDCARGATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAEXCLUSIONESINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAEXCLUSIONESINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAEXCLUSIONESINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAEXCLUSIONESVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAEXCLUSIONESVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAEXCLUSIONESVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINPERPAGOINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINPERPAGOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINPERPAGOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINPERPAGOVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINPERPAGOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINPERPAGOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PROPACUMULACIONURINPUT)) IS NULL AND TRIM(UPPER(UAT.PROPACUMULACIONURINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PROPACUMULACIONURINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PROPACUMULACIONURVALUE)) IS NULL AND TRIM(UPPER(UAT.PROPACUMULACIONURVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PROPACUMULACIONURVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CONTRATANTESCTRINPUT)) IS NULL AND TRIM(UPPER(UAT.CONTRATANTESCTRINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CONTRATANTESCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CONTRATANTESCTRVALUE)) IS NULL AND TRIM(UPPER(UAT.CONTRATANTESCTRVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CONTRATANTESCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ASESORSCTRINPUT)) IS NULL AND TRIM(UPPER(UAT.ASESORSCTRINPUT))="" THEN 1 ELSE 0 END) AS DIFF_ASESORSCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ASESORSCTRVALUE)) IS NULL AND TRIM(UPPER(UAT.ASESORSCTRVALUE))="" THEN 1 ELSE 0 END) AS DIFF_ASESORSCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINIPERPAGOINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINIPERPAGOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINIPERPAGOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINIPERPAGOVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINIPERPAGOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINIPERPAGOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RREMUNERATOTALINPUT)) IS NULL AND TRIM(UPPER(UAT.RREMUNERATOTALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RREMUNERATOTALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RREMUNERATOTALVALUE)) IS NULL AND TRIM(UPPER(UAT.RREMUNERATOTALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RREMUNERATOTALVALUE
FROM iter-data-storage-pv-uat.acsele_data.POLSCTR_raw UAT 
INNER JOIN interseguro-data.acsele_data.POLSCTR_raw PROD 
ON UAT.PK = PROD.PK