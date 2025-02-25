SELECT SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
,SUM(CASE WHEN PROD.PK!=UAT.PK THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN PROD.STATIC!=UAT.STATIC THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN PROD.STATUS!=UAT.STATUS THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCASOSININPUT))!=TRIM(UPPER(UAT.NUMEROCASOSININPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMEROCASOSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCASOSINVALUE))!=TRIM(UPPER(UAT.NUMEROCASOSINVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMEROCASOSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAOCURRENCIAINPUT))!=TRIM(UPPER(UAT.FECHAOCURRENCIAINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAOCURRENCIAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAOCURRENCIAVALUE))!=TRIM(UPPER(UAT.FECHAOCURRENCIAVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAOCURRENCIAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.HORAOCURRENCIASOATINPUT))!=TRIM(UPPER(UAT.HORAOCURRENCIASOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_HORAOCURRENCIASOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.HORAOCURRENCIASOATVALUE))!=TRIM(UPPER(UAT.HORAOCURRENCIASOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_HORAOCURRENCIASOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.LUGAROCURRENCIAVALUE))!=TRIM(UPPER(UAT.LUGAROCURRENCIAVALUE)) THEN 1 ELSE 0 END) AS DIFF_LUGAROCURRENCIAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDEPARTAMENTOSOATINPUT))!=TRIM(UPPER(UAT.CODDEPARTAMENTOSOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODDEPARTAMENTOSOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDEPARTAMENTOSOATVALUE))!=TRIM(UPPER(UAT.CODDEPARTAMENTOSOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODDEPARTAMENTOSOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODPROVINCIASOATINPUT))!=TRIM(UPPER(UAT.CODPROVINCIASOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODPROVINCIASOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODPROVINCIASOATVALUE))!=TRIM(UPPER(UAT.CODPROVINCIASOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODPROVINCIASOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDISTRITOSOATINPUT))!=TRIM(UPPER(UAT.CODDISTRITOSOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODDISTRITOSOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDISTRITOSOATVALUE))!=TRIM(UPPER(UAT.CODDISTRITOSOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODDISTRITOSOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANOTIFICACIONINPUT))!=TRIM(UPPER(UAT.FECHANOTIFICACIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANOTIFICACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANOTIFICACIONVALUE))!=TRIM(UPPER(UAT.FECHANOTIFICACIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANOTIFICACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.HORANOTIFICACIONINPUT))!=TRIM(UPPER(UAT.HORANOTIFICACIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_HORANOTIFICACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.HORANOTIFICACIONVALUE))!=TRIM(UPPER(UAT.HORANOTIFICACIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_HORANOTIFICACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMISARIAINPUT))!=TRIM(UPPER(UAT.COMISARIAINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMISARIAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMISARIAVALUE))!=TRIM(UPPER(UAT.COMISARIAVALUE)) THEN 1 ELSE 0 END) AS DIFF_COMISARIAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CAUSASINIESTROSOATINPUT))!=TRIM(UPPER(UAT.CAUSASINIESTROSOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_CAUSASINIESTROSOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAUSASINIESTROSOATVALUE))!=TRIM(UPPER(UAT.CAUSASINIESTROSOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_CAUSASINIESTROSOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PLACASININPUT))!=TRIM(UPPER(UAT.PLACASININPUT)) THEN 1 ELSE 0 END) AS DIFF_PLACASININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLACASINVALUE))!=TRIM(UPPER(UAT.PLACASINVALUE)) THEN 1 ELSE 0 END) AS DIFF_PLACASINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.USOSININPUT))!=TRIM(UPPER(UAT.USOSININPUT)) THEN 1 ELSE 0 END) AS DIFF_USOSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.USOSINVALUE))!=TRIM(UPPER(UAT.USOSINVALUE)) THEN 1 ELSE 0 END) AS DIFF_USOSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MARCASININPUT))!=TRIM(UPPER(UAT.MARCASININPUT)) THEN 1 ELSE 0 END) AS DIFF_MARCASININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MARCASINVALUE))!=TRIM(UPPER(UAT.MARCASINVALUE)) THEN 1 ELSE 0 END) AS DIFF_MARCASINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MODELOSININPUT))!=TRIM(UPPER(UAT.MODELOSININPUT)) THEN 1 ELSE 0 END) AS DIFF_MODELOSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MODELOSINVALUE))!=TRIM(UPPER(UAT.MODELOSINVALUE)) THEN 1 ELSE 0 END) AS DIFF_MODELOSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOCONDSOATINPUT))!=TRIM(UPPER(UAT.APEPATERNOCONDSOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOCONDSOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOCONDSOATVALUE))!=TRIM(UPPER(UAT.APEPATERNOCONDSOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOCONDSOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOCONDSOATINPUT))!=TRIM(UPPER(UAT.APEMATERNOCONDSOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOCONDSOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOCONDSOATVALUE))!=TRIM(UPPER(UAT.APEMATERNOCONDSOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOCONDSOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESCONDSOATINPUT))!=TRIM(UPPER(UAT.NOMBRESCONDSOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESCONDSOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESCONDSOATVALUE))!=TRIM(UPPER(UAT.NOMBRESCONDSOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESCONDSOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.LICENCIACONDUCTORINPUT))!=TRIM(UPPER(UAT.LICENCIACONDUCTORINPUT)) THEN 1 ELSE 0 END) AS DIFF_LICENCIACONDUCTORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.LICENCIACONDUCTORVALUE))!=TRIM(UPPER(UAT.LICENCIACONDUCTORVALUE)) THEN 1 ELSE 0 END) AS DIFF_LICENCIACONDUCTORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCONTACTOINPUT))!=TRIM(UPPER(UAT.NUMEROCONTACTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMEROCONTACTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROCONTACTOVALUE))!=TRIM(UPPER(UAT.NUMEROCONTACTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMEROCONTACTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOLESIONADOINPUT))!=TRIM(UPPER(UAT.APEPATERNOLESIONADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOLESIONADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOLESIONADOVALUE))!=TRIM(UPPER(UAT.APEPATERNOLESIONADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOLESIONADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOLESIONADOINPUT))!=TRIM(UPPER(UAT.APEMATERNOLESIONADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOLESIONADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOLESIONADOVALUE))!=TRIM(UPPER(UAT.APEMATERNOLESIONADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOLESIONADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRELESIONADOINPUT))!=TRIM(UPPER(UAT.NOMBRELESIONADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRELESIONADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRELESIONADOVALUE))!=TRIM(UPPER(UAT.NOMBRELESIONADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBRELESIONADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DNILESIONADOINPUT))!=TRIM(UPPER(UAT.DNILESIONADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_DNILESIONADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DNILESIONADOVALUE))!=TRIM(UPPER(UAT.DNILESIONADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_DNILESIONADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROACCIDENTADOSINPUT))!=TRIM(UPPER(UAT.NUMEROACCIDENTADOSINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMEROACCIDENTADOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMEROACCIDENTADOSVALUE))!=TRIM(UPPER(UAT.NUMEROACCIDENTADOSVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMEROACCIDENTADOSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CAUSAINVALIDEZSOATINPUT))!=TRIM(UPPER(UAT.CAUSAINVALIDEZSOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_CAUSAINVALIDEZSOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAUSAINVALIDEZSOATVALUE))!=TRIM(UPPER(UAT.CAUSAINVALIDEZSOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_CAUSAINVALIDEZSOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PORCINVALIDEZSOATINPUT))!=TRIM(UPPER(UAT.PORCINVALIDEZSOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_PORCINVALIDEZSOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PORCINVALIDEZSOATVALUE))!=TRIM(UPPER(UAT.PORCINVALIDEZSOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_PORCINVALIDEZSOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORINCAPACIDADINPUT))!=TRIM(UPPER(UAT.INDICADORINCAPACIDADINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDICADORINCAPACIDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORINCAPACIDADVALUE))!=TRIM(UPPER(UAT.INDICADORINCAPACIDADVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDICADORINCAPACIDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOINCAPACIDADINPUT))!=TRIM(UPPER(UAT.FECHAINICIOINCAPACIDADINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOINCAPACIDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOINCAPACIDADVALUE))!=TRIM(UPPER(UAT.FECHAINICIOINCAPACIDADVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOINCAPACIDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINALINCAPACIDADINPUT))!=TRIM(UPPER(UAT.FECHAFINALINCAPACIDADINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAFINALINCAPACIDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINALINCAPACIDADVALUE))!=TRIM(UPPER(UAT.FECHAFINALINCAPACIDADVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAFINALINCAPACIDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DIASINCAPACIDADINPUT))!=TRIM(UPPER(UAT.DIASINCAPACIDADINPUT)) THEN 1 ELSE 0 END) AS DIFF_DIASINCAPACIDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DIASINCAPACIDADVALUE))!=TRIM(UPPER(UAT.DIASINCAPACIDADVALUE)) THEN 1 ELSE 0 END) AS DIFF_DIASINCAPACIDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINALCALCULADAINPUT))!=TRIM(UPPER(UAT.FECHAFINALCALCULADAINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAFINALCALCULADAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINALCALCULADAVALUE))!=TRIM(UPPER(UAT.FECHAFINALCALCULADAVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAFINALCALCULADAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DIASINCAPCALCULADOSINPUT))!=TRIM(UPPER(UAT.DIASINCAPCALCULADOSINPUT)) THEN 1 ELSE 0 END) AS DIFF_DIASINCAPCALCULADOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DIASINCAPCALCULADOSVALUE))!=TRIM(UPPER(UAT.DIASINCAPCALCULADOSVALUE)) THEN 1 ELSE 0 END) AS DIFF_DIASINCAPCALCULADOSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORFALLECIMIENTOINPUT))!=TRIM(UPPER(UAT.INDICADORFALLECIMIENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDICADORFALLECIMIENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORFALLECIMIENTOVALUE))!=TRIM(UPPER(UAT.INDICADORFALLECIMIENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDICADORFALLECIMIENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFALLECIMIENTOSOATINPUT))!=TRIM(UPPER(UAT.FECHAFALLECIMIENTOSOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAFALLECIMIENTOSOATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFALLECIMIENTOSOATVALUE))!=TRIM(UPPER(UAT.FECHAFALLECIMIENTOSOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAFALLECIMIENTOSOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OBSERVACIONESSOATVALUE))!=TRIM(UPPER(UAT.OBSERVACIONESSOATVALUE)) THEN 1 ELSE 0 END) AS DIFF_OBSERVACIONESSOATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ANODOCINPUT))!=TRIM(UPPER(UAT.ANODOCINPUT)) THEN 1 ELSE 0 END) AS DIFF_ANODOCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ANODOCVALUE))!=TRIM(UPPER(UAT.ANODOCVALUE)) THEN 1 ELSE 0 END) AS DIFF_ANODOCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDEPARTAMENTOETIQSININPUT))!=TRIM(UPPER(UAT.CODDEPARTAMENTOETIQSININPUT)) THEN 1 ELSE 0 END) AS DIFF_CODDEPARTAMENTOETIQSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDEPARTAMENTOETIQSINVALUE))!=TRIM(UPPER(UAT.CODDEPARTAMENTOETIQSINVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODDEPARTAMENTOETIQSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ETIQUETADEPARTSININPUT))!=TRIM(UPPER(UAT.ETIQUETADEPARTSININPUT)) THEN 1 ELSE 0 END) AS DIFF_ETIQUETADEPARTSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ETIQUETADEPARTSINVALUE))!=TRIM(UPPER(UAT.ETIQUETADEPARTSINVALUE)) THEN 1 ELSE 0 END) AS DIFF_ETIQUETADEPARTSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORINVALIDEZINPUT))!=TRIM(UPPER(UAT.INDICADORINVALIDEZINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDICADORINVALIDEZINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORINVALIDEZVALUE))!=TRIM(UPPER(UAT.INDICADORINVALIDEZVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDICADORINVALIDEZVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINVALIDEZINPUT))!=TRIM(UPPER(UAT.FECHAINVALIDEZINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAINVALIDEZINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINVALIDEZVALUE))!=TRIM(UPPER(UAT.FECHAINVALIDEZVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAINVALIDEZVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ANOFALLECDOCINPUT))!=TRIM(UPPER(UAT.ANOFALLECDOCINPUT)) THEN 1 ELSE 0 END) AS DIFF_ANOFALLECDOCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ANOFALLECDOCVALUE))!=TRIM(UPPER(UAT.ANOFALLECDOCVALUE)) THEN 1 ELSE 0 END) AS DIFF_ANOFALLECDOCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ANOINVDOCINPUT))!=TRIM(UPPER(UAT.ANOINVDOCINPUT)) THEN 1 ELSE 0 END) AS DIFF_ANOINVDOCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ANOINVDOCVALUE))!=TRIM(UPPER(UAT.ANOINVDOCVALUE)) THEN 1 ELSE 0 END) AS DIFF_ANOINVDOCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.LUGAROCURRENCIAINPUT))!=TRIM(UPPER(UAT.LUGAROCURRENCIAINPUT)) THEN 1 ELSE 0 END) AS DIFF_LUGAROCURRENCIAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OBSERVACIONESSOATINPUT))!=TRIM(UPPER(UAT.OBSERVACIONESSOATINPUT)) THEN 1 ELSE 0 END) AS DIFF_OBSERVACIONESSOATINPUT
FROM iter-data-storage-pv-uat.acsele_data.ATROPELLOSIN_raw UAT 
INNER JOIN interseguro-data.acsele_data.ATROPELLOSIN_raw PROD 
ON UAT.PK = PROD.PK