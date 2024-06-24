SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN PROD.PK!=UAT.PK THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN PROD.STATIC!=UAT.STATIC THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN PROD.STATUS!=UAT.STATUS THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADACTUARIALINPUT))!=TRIM(UPPER(UAT.EDADACTUARIALINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADACTUARIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADACTUARIALVALUE))!=TRIM(UPPER(UAT.EDADACTUARIALVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADACTUARIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREBENEFICIARIOINPUT))!=TRIM(UPPER(UAT.NOMBREBENEFICIARIOINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBREBENEFICIARIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREBENEFICIARIOVALUE))!=TRIM(UPPER(UAT.NOMBREBENEFICIARIOVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBREBENEFICIARIOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIVALUE))!=TRIM(UPPER(UAT.APEPATERNOBENIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIVALUE))!=TRIM(UPPER(UAT.APEMATERNOBENIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIVALUE))!=TRIM(UPPER(UAT.NOMBRESBENIVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIINPUT))!=TRIM(UPPER(UAT.FECHANACBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIVALUE))!=TRIM(UPPER(UAT.FECHANACBENIVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIVALUE))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIVALUE))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIIVALUE))!=TRIM(UPPER(UAT.PARENTESCOBENIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIIVALUE))!=TRIM(UPPER(UAT.APEPATERNOBENIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIIVALUE))!=TRIM(UPPER(UAT.APEMATERNOBENIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIIVALUE))!=TRIM(UPPER(UAT.NOMBRESBENIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIIINPUT))!=TRIM(UPPER(UAT.FECHANACBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIIVALUE))!=TRIM(UPPER(UAT.FECHANACBENIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIIVALUE))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIIVALUE))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIIIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIIIVALUE))!=TRIM(UPPER(UAT.APEPATERNOBENIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIIIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIIIVALUE))!=TRIM(UPPER(UAT.APEMATERNOBENIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIIIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIIIVALUE))!=TRIM(UPPER(UAT.NOMBRESBENIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIIIINPUT))!=TRIM(UPPER(UAT.FECHANACBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIIIVALUE))!=TRIM(UPPER(UAT.FECHANACBENIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIIIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIIIVALUE))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIIIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIIIVALUE))!=TRIM(UPPER(UAT.PARENTESCOBENIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIIIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIIIVALUE))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIVALUE))!=TRIM(UPPER(UAT.APEPATERNOBENCIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIVALUE))!=TRIM(UPPER(UAT.APEMATERNOBENCIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIVALUE))!=TRIM(UPPER(UAT.NOMBRESBENCIVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIINPUT))!=TRIM(UPPER(UAT.FECHANACBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIVALUE))!=TRIM(UPPER(UAT.FECHANACBENCIVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIVALUE))!=TRIM(UPPER(UAT.DOCIDENTIDADBENCIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIVALUE))!=TRIM(UPPER(UAT.PARENTESCOBENCIVALUE)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIVALUE))!=TRIM(UPPER(UAT.DISTRIBUCIONBENCIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIIVALUE))!=TRIM(UPPER(UAT.APEPATERNOBENCIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIIVALUE))!=TRIM(UPPER(UAT.APEMATERNOBENCIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIIVALUE))!=TRIM(UPPER(UAT.NOMBRESBENCIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIIINPUT))!=TRIM(UPPER(UAT.FECHANACBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIIVALUE))!=TRIM(UPPER(UAT.FECHANACBENCIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIIVALUE))!=TRIM(UPPER(UAT.DOCIDENTIDADBENCIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIIVALUE))!=TRIM(UPPER(UAT.PARENTESCOBENCIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIIVALUE))!=TRIM(UPPER(UAT.DISTRIBUCIONBENCIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIVALUE))!=TRIM(UPPER(UAT.PARENTESCOBENIVALUE)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRECONTRATANTEINPUT))!=TRIM(UPPER(UAT.NOMBRECONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRECONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRECONTRATANTEVALUE))!=TRIM(UPPER(UAT.NOMBRECONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBRECONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFIRMAPROPINPUT))!=TRIM(UPPER(UAT.FECHAFIRMAPROPINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAFIRMAPROPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFIRMAPROPVALUE))!=TRIM(UPPER(UAT.FECHAFIRMAPROPVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAFIRMAPROPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROPINPUT))!=TRIM(UPPER(UAT.FECHAPROPINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAPROPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROPVALUE))!=TRIM(UPPER(UAT.FECHAPROPVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAPROPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIIIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIIIVALUE))!=TRIM(UPPER(UAT.APEPATERNOBENCIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIIIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIIIVALUE))!=TRIM(UPPER(UAT.APEMATERNOBENCIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIIIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIIIVALUE))!=TRIM(UPPER(UAT.NOMBRESBENCIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIIIINPUT))!=TRIM(UPPER(UAT.FECHANACBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIIIVALUE))!=TRIM(UPPER(UAT.FECHANACBENCIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIIIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIIIVALUE))!=TRIM(UPPER(UAT.DOCIDENTIDADBENCIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIIIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIIIVALUE))!=TRIM(UPPER(UAT.PARENTESCOBENCIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIIIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIIIVALUE))!=TRIM(UPPER(UAT.DISTRIBUCIONBENCIIIVALUE)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOURINPUT))!=TRIM(UPPER(UAT.SEXOURINPUT)) THEN 1 ELSE 0 END) AS DIFF_SEXOURINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOURVALUE))!=TRIM(UPPER(UAT.SEXOURVALUE)) THEN 1 ELSE 0 END) AS DIFF_SEXOURVALUE
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
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONASEGURADOINPUT))!=TRIM(UPPER(UAT.DIRECCIONASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONASEGURADOVALUE))!=TRIM(UPPER(UAT.DIRECCIONASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOASEGURADOINPUT))!=TRIM(UPPER(UAT.TELEFONOASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOASEGURADOVALUE))!=TRIM(UPPER(UAT.TELEFONOASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILASEGURADOINPUT))!=TRIM(UPPER(UAT.EMAILASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_EMAILASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILASEGURADOVALUE))!=TRIM(UPPER(UAT.EMAILASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_EMAILASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDEPARTASEGURADOINPUT))!=TRIM(UPPER(UAT.CODDEPARTASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODDEPARTASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDEPARTASEGURADOVALUE))!=TRIM(UPPER(UAT.CODDEPARTASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODDEPARTASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODPROVINASEGURADOINPUT))!=TRIM(UPPER(UAT.CODPROVINASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODPROVINASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODPROVINASEGURADOVALUE))!=TRIM(UPPER(UAT.CODPROVINASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODPROVINASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDISTRIASEGURADOINPUT))!=TRIM(UPPER(UAT.CODDISTRIASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODDISTRIASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODDISTRIASEGURADOVALUE))!=TRIM(UPPER(UAT.CODDISTRIASEGURADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODDISTRIASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOCOTINPUT))!=TRIM(UPPER(UAT.FECHANACIMIENTOCOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOCOTVALUE))!=TRIM(UPPER(UAT.FECHANACIMIENTOCOTVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOCOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOCOTINPUT))!=TRIM(UPPER(UAT.SEXOCOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_SEXOCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOCOTVALUE))!=TRIM(UPPER(UAT.SEXOCOTVALUE)) THEN 1 ELSE 0 END) AS DIFF_SEXOCOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORCOTINPUT))!=TRIM(UPPER(UAT.CONDICIONFUMADORCOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORCOTVALUE))!=TRIM(UPPER(UAT.CONDICIONFUMADORCOTVALUE)) THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORCOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOACOTINPUT))!=TRIM(UPPER(UAT.NUMOACOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMOACOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOACOTVALUE))!=TRIM(UPPER(UAT.NUMOACOTVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMOACOTVALUE
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
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORINPUT))!=TRIM(UPPER(UAT.CONDICIONFUMADORINPUT)) THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORVALUE))!=TRIM(UPPER(UAT.CONDICIONFUMADORVALUE)) THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADALCAFINPOLINPUT))!=TRIM(UPPER(UAT.EDADALCAFINPOLINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADALCAFINPOLINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADALCAFINPOLVALUE))!=TRIM(UPPER(UAT.EDADALCAFINPOLVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADALCAFINPOLVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECNACASEGINPUT))!=TRIM(UPPER(UAT.FECNACASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECNACASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECNACASEGVALUE))!=TRIM(UPPER(UAT.FECNACASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECNACASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZACESIONADAVEINPUT))!=TRIM(UPPER(UAT.POLIZACESIONADAVEINPUT)) THEN 1 ELSE 0 END) AS DIFF_POLIZACESIONADAVEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZACESIONADAVEVALUE))!=TRIM(UPPER(UAT.POLIZACESIONADAVEVALUE)) THEN 1 ELSE 0 END) AS DIFF_POLIZACESIONADAVEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PORCENTAJECESIONINPUT))!=TRIM(UPPER(UAT.PORCENTAJECESIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_PORCENTAJECESIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PORCENTAJECESIONVALUE))!=TRIM(UPPER(UAT.PORCENTAJECESIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_PORCENTAJECESIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCESIONINPUT))!=TRIM(UPPER(UAT.MONTOCESIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONTOCESIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCESIONVALUE))!=TRIM(UPPER(UAT.MONTOCESIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_MONTOCESIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCBENEFICIARIOINPUT))!=TRIM(UPPER(UAT.RUCBENEFICIARIOINPUT)) THEN 1 ELSE 0 END) AS DIFF_RUCBENEFICIARIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCBENEFICIARIOVALUE))!=TRIM(UPPER(UAT.RUCBENEFICIARIOVALUE)) THEN 1 ELSE 0 END) AS DIFF_RUCBENEFICIARIOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOCESIONINPUT))!=TRIM(UPPER(UAT.FRECUENCIAPAGOCESIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOCESIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOCESIONVALUE))!=TRIM(UPPER(UAT.FRECUENCIAPAGOCESIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOCESIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CUMULOFALLECVIDAINPUT))!=TRIM(UPPER(UAT.CUMULOFALLECVIDAINPUT)) THEN 1 ELSE 0 END) AS DIFF_CUMULOFALLECVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CUMULOFALLECVIDAVALUE))!=TRIM(UPPER(UAT.CUMULOFALLECVIDAVALUE)) THEN 1 ELSE 0 END) AS DIFF_CUMULOFALLECVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILBENEFPREFINPUT))!=TRIM(UPPER(UAT.EMAILBENEFPREFINPUT)) THEN 1 ELSE 0 END) AS DIFF_EMAILBENEFPREFINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILBENEFPREFVALUE))!=TRIM(UPPER(UAT.EMAILBENEFPREFVALUE)) THEN 1 ELSE 0 END) AS DIFF_EMAILBENEFPREFVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREBENEFICIARIOANTINPUT))!=TRIM(UPPER(UAT.NOMBREBENEFICIARIOANTINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBREBENEFICIARIOANTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREBENEFICIARIOANTVALUE))!=TRIM(UPPER(UAT.NOMBREBENEFICIARIOANTVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBREBENEFICIARIOANTVALUE
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.OAPLANGARANTIZADO_raw UAT 
INNER JOIN interseguro-data.acsele_data.OAPLANGARANTIZADO_raw PROD 
ON UAT.PK = PROD.PK