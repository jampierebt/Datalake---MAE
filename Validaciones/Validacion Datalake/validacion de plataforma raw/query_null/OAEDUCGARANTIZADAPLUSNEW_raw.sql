SELECT SUM(CASE WHEN TRIM(UPPER(PROD.EDADACTUARIALINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADACTUARIALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADACTUARIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADACTUARIALVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADACTUARIALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADACTUARIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIIINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIIVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIIINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIIVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENCIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENCIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENCIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENCIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENCIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENCIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENCIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENCIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENCIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENCIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENCIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENCIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENCIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENCIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENCIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENCIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENCIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENCIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIIINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENCIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIIVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENCIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENCIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENCIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENCIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENCIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIIINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENCIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIIVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENCIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENCIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENCIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFIRMAPROPINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFIRMAPROPINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFIRMAPROPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFIRMAPROPVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFIRMAPROPVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFIRMAPROPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROPINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAPROPINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAPROPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROPVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAPROPVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAPROPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENCIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENCIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENCIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENCIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENCIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENCIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENCIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENCIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENCIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENCIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENCIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENCIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENCIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENCIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOURINPUT)) IS NULL AND TRIM(UPPER(UAT.SEXOURINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SEXOURINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOURVALUE)) IS NULL AND TRIM(UPPER(UAT.SEXOURVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SEXOURVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOACTIVACIONINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPOACTIVACIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPOACTIVACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOACTIVACIONVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPOACTIVACIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPOACTIVACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADMINIMAASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADMINIMAASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADMAXIMAASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADMAXIMAASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADPERMANASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADPERMANASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONASEGURADOINPUT)) IS NULL AND TRIM(UPPER(UAT.DIRECCIONASEGURADOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DIRECCIONASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONASEGURADOVALUE)) IS NULL AND TRIM(UPPER(UAT.DIRECCIONASEGURADOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DIRECCIONASEGURADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOCOTINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOCOTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOCOTVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOCOTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOCOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOCOTINPUT)) IS NULL AND TRIM(UPPER(UAT.SEXOCOTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SEXOCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOCOTVALUE)) IS NULL AND TRIM(UPPER(UAT.SEXOCOTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SEXOCOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORCOTINPUT)) IS NULL AND TRIM(UPPER(UAT.CONDICIONFUMADORCOTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORCOTVALUE)) IS NULL AND TRIM(UPPER(UAT.CONDICIONFUMADORCOTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORCOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOACOTINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMOACOTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMOACOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOACOTVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMOACOTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMOACOTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONGENASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONGENASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIINPUT)) IS NULL AND TRIM(UPPER(UAT.CORREOIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIVALUE)) IS NULL AND TRIM(UPPER(UAT.CORREOIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIINPUT)) IS NULL AND TRIM(UPPER(UAT.CORREOIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIVALUE)) IS NULL AND TRIM(UPPER(UAT.CORREOIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.CORREOIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.CORREOIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIINPUT)) IS NULL AND TRIM(UPPER(UAT.TELEFONOIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIVALUE)) IS NULL AND TRIM(UPPER(UAT.TELEFONOIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIINPUT)) IS NULL AND TRIM(UPPER(UAT.TELEFONOIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIVALUE)) IS NULL AND TRIM(UPPER(UAT.TELEFONOIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.TELEFONOIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.TELEFONOIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONPOLASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONPOLASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONPOLASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONPOLASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONPOLASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONPOLASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONENASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONENASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONENASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONENASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONENASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONENASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORINPUT)) IS NULL AND TRIM(UPPER(UAT.CONDICIONFUMADORINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORVALUE)) IS NULL AND TRIM(UPPER(UAT.CONDICIONFUMADORVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADALCAFINPOLINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADALCAFINPOLINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADALCAFINPOLINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADALCAFINPOLVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADALCAFINPOLVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADALCAFINPOLVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECNACASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.FECNACASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECNACASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECNACASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.FECNACASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECNACASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CUMULOFALLECVIDAINPUT)) IS NULL AND TRIM(UPPER(UAT.CUMULOFALLECVIDAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CUMULOFALLECVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CUMULOFALLECVIDAVALUE)) IS NULL AND TRIM(UPPER(UAT.CUMULOFALLECVIDAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CUMULOFALLECVIDAVALUE
FROM iter-data-storage-pv-uat.acsele_data.OAEDUCGARANTIZADAPLUSNEW_raw UAT 
INNER JOIN interseguro-data.acsele_data.OAEDUCGARANTIZADAPLUSNEW_raw PROD 
ON UAT.PK = PROD.PK