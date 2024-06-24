SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN PROD.PK!=UAT.PK THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN PROD.STATIC!=UAT.STATIC THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN PROD.STATUS!=UAT.STATUS THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOCLIENTEINPUT))!=TRIM(UPPER(UAT.TIPOCLIENTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOCLIENTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOCLIENTEVALUE))!=TRIM(UPPER(UAT.TIPOCLIENTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPOCLIENTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.GRUPOFAMILIARINPUT))!=TRIM(UPPER(UAT.GRUPOFAMILIARINPUT)) THEN 1 ELSE 0 END) AS DIFF_GRUPOFAMILIARINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.GRUPOFAMILIARVALUE))!=TRIM(UPPER(UAT.GRUPOFAMILIARVALUE)) THEN 1 ELSE 0 END) AS DIFF_GRUPOFAMILIARVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOASEGURADOACCINPUT))!=TRIM(UPPER(UAT.TIPOASEGURADOACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOASEGURADOACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOASEGURADOACCVALUE))!=TRIM(UPPER(UAT.TIPOASEGURADOACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPOASEGURADOACCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOURINPUT))!=TRIM(UPPER(UAT.SEXOURINPUT)) THEN 1 ELSE 0 END) AS DIFF_SEXOURINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOURVALUE))!=TRIM(UPPER(UAT.SEXOURVALUE)) THEN 1 ELSE 0 END) AS DIFF_SEXOURVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OACONTHIJOSINPUT))!=TRIM(UPPER(UAT.OACONTHIJOSINPUT)) THEN 1 ELSE 0 END) AS DIFF_OACONTHIJOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OACONTHIJOSVALUE))!=TRIM(UPPER(UAT.OACONTHIJOSVALUE)) THEN 1 ELSE 0 END) AS DIFF_OACONTHIJOSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OACONTTITULARINPUT))!=TRIM(UPPER(UAT.OACONTTITULARINPUT)) THEN 1 ELSE 0 END) AS DIFF_OACONTTITULARINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OACONTTITULARVALUE))!=TRIM(UPPER(UAT.OACONTTITULARVALUE)) THEN 1 ELSE 0 END) AS DIFF_OACONTTITULARVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OACONTCONYUGEINPUT))!=TRIM(UPPER(UAT.OACONTCONYUGEINPUT)) THEN 1 ELSE 0 END) AS DIFF_OACONTCONYUGEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OACONTCONYUGEVALUE))!=TRIM(UPPER(UAT.OACONTCONYUGEVALUE)) THEN 1 ELSE 0 END) AS DIFF_OACONTCONYUGEVALUE
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
,SUM(CASE WHEN TRIM(UPPER(PROD.CONTRATANTECODIDENINPUT))!=TRIM(UPPER(UAT.CONTRATANTECODIDENINPUT)) THEN 1 ELSE 0 END) AS DIFF_CONTRATANTECODIDENINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CONTRATANTECODIDENVALUE))!=TRIM(UPPER(UAT.CONTRATANTECODIDENVALUE)) THEN 1 ELSE 0 END) AS DIFF_CONTRATANTECODIDENVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENASEGINPUT))!=TRIM(UPPER(UAT.COMUNICACIONGENASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENASEGVALUE))!=TRIM(UPPER(UAT.COMUNICACIONGENASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOIDENTASEGINPUT))!=TRIM(UPPER(UAT.CODIGOIDENTASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODIGOIDENTASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOIDENTASEGVALUE))!=TRIM(UPPER(UAT.CODIGOIDENTASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODIGOIDENTASEGVALUE
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
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGINVACCINPUT))!=TRIM(UPPER(UAT.CAPITALASEGINVACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGINVACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CAPITALASEGINVACCVALUE))!=TRIM(UPPER(UAT.CAPITALASEGINVACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_CAPITALASEGINVACCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TASAANUALINVACCINPUT))!=TRIM(UPPER(UAT.TASAANUALINVACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_TASAANUALINVACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TASAANUALINVACCVALUE))!=TRIM(UPPER(UAT.TASAANUALINVACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_TASAANUALINVACCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAANUALINVACCINPUT))!=TRIM(UPPER(UAT.PRIMAANUALINVACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRIMAANUALINVACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAANUALINVACCVALUE))!=TRIM(UPPER(UAT.PRIMAANUALINVACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRIMAANUALINVACCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGINVINPUT))!=TRIM(UPPER(UAT.EDADMINIMAASEGINVINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGINVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGINVVALUE))!=TRIM(UPPER(UAT.EDADMINIMAASEGINVVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGINVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGINVINPUT))!=TRIM(UPPER(UAT.EDADMAXIMAASEGINVINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGINVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGINVVALUE))!=TRIM(UPPER(UAT.EDADMAXIMAASEGINVVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGINVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGINVINPUT))!=TRIM(UPPER(UAT.EDADPERMANASEGINVINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGINVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGINVVALUE))!=TRIM(UPPER(UAT.EDADPERMANASEGINVVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGINVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.REASEGCUMULOINVACCINPUT))!=TRIM(UPPER(UAT.REASEGCUMULOINVACCINPUT)) THEN 1 ELSE 0 END) AS DIFF_REASEGCUMULOINVACCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.REASEGCUMULOINVACCVALUE))!=TRIM(UPPER(UAT.REASEGCUMULOINVACCVALUE)) THEN 1 ELSE 0 END) AS DIFF_REASEGCUMULOINVACCVALUE
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.OAVIDAPROTEGIDA_raw UAT 
INNER JOIN interseguro-data.acsele_data.OAVIDAPROTEGIDA_raw PROD 
ON UAT.PK = PROD.PK