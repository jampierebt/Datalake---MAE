SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN PROD.PK!=UAT.PK THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN PROD.STATIC!=UAT.STATIC THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN PROD.STATUS!=UAT.STATUS THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOASEGURADOACCINPUT))!=TRIM(UPPER(UAT.TIPOASEGURADOACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOASEGURADOACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOASEGURADOACCVALUE))!=TRIM(UPPER(UAT.TIPOASEGURADOACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPOASEGURADOACCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOURINPUT))!=TRIM(UPPER(UAT.SEXOURINPUT)) THEN 1 ELSE 0 END) AS DIFF_SEXOURINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOURVALUE))!=TRIM(UPPER(UAT.SEXOURVALUE)) THEN 1 ELSE 0 END) AS DIFF_SEXOURVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OACONTTITULARINPUT))!=TRIM(UPPER(UAT.OACONTTITULARINPUT)) THEN 1 ELSE 0 END) AS DIFF_OACONTTITULARINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OACONTTITULARVALUE))!=TRIM(UPPER(UAT.OACONTTITULARVALUE)) THEN 1 ELSE 0 END) AS DIFF_OACONTTITULARVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADCRONOLOGICAINPUT))!=TRIM(UPPER(UAT.EDADCRONOLOGICAINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADCRONOLOGICAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADCRONOLOGICAVALUE))!=TRIM(UPPER(UAT.EDADCRONOLOGICAVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADCRONOLOGICAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOACTIVACIONINPUT))!=TRIM(UPPER(UAT.TIPOACTIVACIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOACTIVACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOACTIVACIONVALUE))!=TRIM(UPPER(UAT.TIPOACTIVACIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPOACTIVACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCUMENTOIDENTIDADSININPUT))!=TRIM(UPPER(UAT.DOCUMENTOIDENTIDADSININPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCUMENTOIDENTIDADSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCUMENTOIDENTIDADSINVALUE))!=TRIM(UPPER(UAT.DOCUMENTOIDENTIDADSINVALUE)) THEN 1 ELSE 0 END) AS DIFF_DOCUMENTOIDENTIDADSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOSININPUT))!=TRIM(UPPER(UAT.FECHANACIMIENTOSININPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOSINVALUE))!=TRIM(UPPER(UAT.FECHANACIMIENTOSINVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOSINVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGINPUT))!=TRIM(UPPER(UAT.EDADMINIMAASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGVALUE))!=TRIM(UPPER(UAT.EDADMINIMAASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGINPUT))!=TRIM(UPPER(UAT.EDADMAXIMAASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGVALUE))!=TRIM(UPPER(UAT.EDADMAXIMAASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGINPUT))!=TRIM(UPPER(UAT.EDADPERMANASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGVALUE))!=TRIM(UPPER(UAT.EDADPERMANASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CUMULOFALLECIMIENTOACCINPUT))!=TRIM(UPPER(UAT.CUMULOFALLECIMIENTOACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_CUMULOFALLECIMIENTOACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CUMULOFALLECIMIENTOACCVALUE))!=TRIM(UPPER(UAT.CUMULOFALLECIMIENTOACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_CUMULOFALLECIMIENTOACCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONASEGURADOINPUT))!=TRIM(UPPER(UAT.DIRECCIONASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONASEGURADOVALUE))!=TRIM(UPPER(UAT.DIRECCIONASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOASEGURADOINPUT))!=TRIM(UPPER(UAT.TELEFONOASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOASEGURADOVALUE))!=TRIM(UPPER(UAT.TELEFONOASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FAXASEGURADOINPUT))!=TRIM(UPPER(UAT.FAXASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_FAXASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FAXASEGURADOVALUE))!=TRIM(UPPER(UAT.FAXASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_FAXASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILASEGURADOINPUT))!=TRIM(UPPER(UAT.EMAILASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_EMAILASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILASEGURADOVALUE))!=TRIM(UPPER(UAT.EMAILASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_EMAILASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDEPARTASEGURADOINPUT))!=TRIM(UPPER(UAT.CODDEPARTASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODDEPARTASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDEPARTASEGURADOVALUE))!=TRIM(UPPER(UAT.CODDEPARTASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODDEPARTASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODPROVINASEGURADOINPUT))!=TRIM(UPPER(UAT.CODPROVINASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODPROVINASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODPROVINASEGURADOVALUE))!=TRIM(UPPER(UAT.CODPROVINASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODPROVINASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDISTRIASEGURADOINPUT))!=TRIM(UPPER(UAT.CODDISTRIASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODDISTRIASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDISTRIASEGURADOVALUE))!=TRIM(UPPER(UAT.CODDISTRIASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODDISTRIASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGFALLECACCINPUT))!=TRIM(UPPER(UAT.CAPITALASEGFALLECACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGFALLECACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGFALLECACCVALUE))!=TRIM(UPPER(UAT.CAPITALASEGFALLECACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGFALLECACCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TASAANUALFALLECACCINPUT))!=TRIM(UPPER(UAT.TASAANUALFALLECACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_TASAANUALFALLECACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TASAANUALFALLECACCVALUE))!=TRIM(UPPER(UAT.TASAANUALFALLECACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_TASAANUALFALLECACCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAANUALFALLECACCINPUT))!=TRIM(UPPER(UAT.PRIMAANUALFALLECACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRIMAANUALFALLECACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAANUALFALLECACCVALUE))!=TRIM(UPPER(UAT.PRIMAANUALFALLECACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRIMAANUALFALLECACCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PLAZOVIGENCIAINPUT))!=TRIM(UPPER(UAT.PLAZOVIGENCIAINPUT)) THEN 1 ELSE 0 END) AS DIFF_PLAZOVIGENCIAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLAZOVIGENCIAVALUE))!=TRIM(UPPER(UAT.PLAZOVIGENCIAVALUE)) THEN 1 ELSE 0 END) AS DIFF_PLAZOVIGENCIAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOCOTINPUT))!=TRIM(UPPER(UAT.FECHANACIMIENTOCOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOCOTVALUE))!=TRIM(UPPER(UAT.FECHANACIMIENTOCOTVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOCOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOCOTINPUT))!=TRIM(UPPER(UAT.SEXOCOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_SEXOCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOCOTVALUE))!=TRIM(UPPER(UAT.SEXOCOTVALUE)) THEN 1 ELSE 0 END) AS DIFF_SEXOCOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORCOTINPUT))!=TRIM(UPPER(UAT.CONDICIONFUMADORCOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORCOTVALUE))!=TRIM(UPPER(UAT.CONDICIONFUMADORCOTVALUE)) THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORCOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOACOTINPUT))!=TRIM(UPPER(UAT.NUMOACOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMOACOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOACOTVALUE))!=TRIM(UPPER(UAT.NUMOACOTVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMOACOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.REASEGCUMULOFALLECACCINPUT))!=TRIM(UPPER(UAT.REASEGCUMULOFALLECACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_REASEGCUMULOFALLECACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.REASEGCUMULOFALLECACCVALUE))!=TRIM(UPPER(UAT.REASEGCUMULOFALLECACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_REASEGCUMULOFALLECACCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENASEGINPUT))!=TRIM(UPPER(UAT.COMUNICACIONGENASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENASEGVALUE))!=TRIM(UPPER(UAT.COMUNICACIONGENASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIINPUT))!=TRIM(UPPER(UAT.CORREOIINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIVALUE))!=TRIM(UPPER(UAT.CORREOIVALUE)) THEN 1 ELSE 0 END) AS DIFF_CORREOIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIINPUT))!=TRIM(UPPER(UAT.CORREOIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIVALUE))!=TRIM(UPPER(UAT.CORREOIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_CORREOIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIIINPUT))!=TRIM(UPPER(UAT.CORREOIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIIVALUE))!=TRIM(UPPER(UAT.CORREOIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_CORREOIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIINPUT))!=TRIM(UPPER(UAT.TELEFONOIINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIVALUE))!=TRIM(UPPER(UAT.TELEFONOIVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIINPUT))!=TRIM(UPPER(UAT.TELEFONOIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIVALUE))!=TRIM(UPPER(UAT.TELEFONOIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIIINPUT))!=TRIM(UPPER(UAT.TELEFONOIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIIVALUE))!=TRIM(UPPER(UAT.TELEFONOIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONPOLASEGINPUT))!=TRIM(UPPER(UAT.COMUNICACIONPOLASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONPOLASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONPOLASEGVALUE))!=TRIM(UPPER(UAT.COMUNICACIONPOLASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONPOLASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONENASEGINPUT))!=TRIM(UPPER(UAT.COMUNICACIONENASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONENASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONENASEGVALUE))!=TRIM(UPPER(UAT.COMUNICACIONENASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONENASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGFALLACCTRINPUT))!=TRIM(UPPER(UAT.CAPITALASEGFALLACCTRINPUT)) THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGFALLACCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGFALLACCTRVALUE))!=TRIM(UPPER(UAT.CAPITALASEGFALLACCTRVALUE)) THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGFALLACCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGINVACCTPINPUT))!=TRIM(UPPER(UAT.CAPITALASEGINVACCTPINPUT)) THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGINVACCTPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGINVACCTPVALUE))!=TRIM(UPPER(UAT.CAPITALASEGINVACCTPVALUE)) THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGINVACCTPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TASAANUALFALLECACCTRAINPUT))!=TRIM(UPPER(UAT.TASAANUALFALLECACCTRAINPUT)) THEN 1 ELSE 0 END) AS DIFF_TASAANUALFALLECACCTRAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TASAANUALFALLECACCTRAVALUE))!=TRIM(UPPER(UAT.TASAANUALFALLECACCTRAVALUE)) THEN 1 ELSE 0 END) AS DIFF_TASAANUALFALLECACCTRAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TASAANUALINVACCTOTPARINPUT))!=TRIM(UPPER(UAT.TASAANUALINVACCTOTPARINPUT)) THEN 1 ELSE 0 END) AS DIFF_TASAANUALINVACCTOTPARINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TASAANUALINVACCTOTPARVALUE))!=TRIM(UPPER(UAT.TASAANUALINVACCTOTPARVALUE)) THEN 1 ELSE 0 END) AS DIFF_TASAANUALINVACCTOTPARVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGACCTRINPUT))!=TRIM(UPPER(UAT.EDADMINIMAASEGACCTRINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGACCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGACCTRVALUE))!=TRIM(UPPER(UAT.EDADMINIMAASEGACCTRVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGACCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGACCTRINPUT))!=TRIM(UPPER(UAT.EDADMAXIMAASEGACCTRINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGACCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGACCTRVALUE))!=TRIM(UPPER(UAT.EDADMAXIMAASEGACCTRVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGACCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGACCTRINPUT))!=TRIM(UPPER(UAT.EDADPERMANASEGACCTRINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGACCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGACCTRVALUE))!=TRIM(UPPER(UAT.EDADPERMANASEGACCTRVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGACCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGINVACCTPINPUT))!=TRIM(UPPER(UAT.EDADPERMANASEGINVACCTPINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGINVACCTPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGINVACCTPVALUE))!=TRIM(UPPER(UAT.EDADPERMANASEGINVACCTPVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGINVACCTPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGINVACCTPINPUT))!=TRIM(UPPER(UAT.EDADMAXIMAASEGINVACCTPINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGINVACCTPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGINVACCTPVALUE))!=TRIM(UPPER(UAT.EDADMAXIMAASEGINVACCTPVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGINVACCTPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGINVACCTPINPUT))!=TRIM(UPPER(UAT.EDADMINIMAASEGINVACCTPINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGINVACCTPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGINVACCTPVALUE))!=TRIM(UPPER(UAT.EDADMINIMAASEGINVACCTPVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGINVACCTPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAANUALFALLECACCTRINPUT))!=TRIM(UPPER(UAT.PRIMAANUALFALLECACCTRINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRIMAANUALFALLECACCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAANUALFALLECACCTRVALUE))!=TRIM(UPPER(UAT.PRIMAANUALFALLECACCTRVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRIMAANUALFALLECACCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAANUALINVACCTOTPAINPUT))!=TRIM(UPPER(UAT.PRIMAANUALINVACCTOTPAINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRIMAANUALINVACCTOTPAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAANUALINVACCTOTPAVALUE))!=TRIM(UPPER(UAT.PRIMAANUALINVACCTOTPAVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRIMAANUALINVACCTOTPAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.REASEGCUMULOFALLACCTRINPUT))!=TRIM(UPPER(UAT.REASEGCUMULOFALLACCTRINPUT)) THEN 1 ELSE 0 END) AS DIFF_REASEGCUMULOFALLACCTRINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.REASEGCUMULOFALLACCTRVALUE))!=TRIM(UPPER(UAT.REASEGCUMULOFALLACCTRVALUE)) THEN 1 ELSE 0 END) AS DIFF_REASEGCUMULOFALLACCTRVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.REASEGCUMULOINVACCTPINPUT))!=TRIM(UPPER(UAT.REASEGCUMULOINVACCTPINPUT)) THEN 1 ELSE 0 END) AS DIFF_REASEGCUMULOINVACCTPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.REASEGCUMULOINVACCTPVALUE))!=TRIM(UPPER(UAT.REASEGCUMULOINVACCTPVALUE)) THEN 1 ELSE 0 END) AS DIFF_REASEGCUMULOINVACCTPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CONTRATANTECODIDENANTINPUT))!=TRIM(UPPER(UAT.CONTRATANTECODIDENANTINPUT)) THEN 1 ELSE 0 END) AS DIFF_CONTRATANTECODIDENANTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CONTRATANTECODIDENANTVALUE))!=TRIM(UPPER(UAT.CONTRATANTECODIDENANTVALUE)) THEN 1 ELSE 0 END) AS DIFF_CONTRATANTECODIDENANTVALUE
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.OASEGUROACCIDENTES_raw UAT 
INNER JOIN interseguro-data.acsele_data.OASEGUROACCIDENTES_raw PROD 
ON UAT.PK = PROD.PK