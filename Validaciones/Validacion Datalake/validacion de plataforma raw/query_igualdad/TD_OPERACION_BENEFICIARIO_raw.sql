SELECT SUM(CASE WHEN TRIM(UPPER(PROD.NUMERO_POLIZA))!=TRIM(UPPER(UAT.NUMERO_POLIZA)) THEN 1 ELSE 0 END) AS DIFF_NUMERO_POLIZA
,SUM(CASE WHEN PROD.NUMERO_OPERACION!=UAT.NUMERO_OPERACION THEN 1 ELSE 0 END) AS DIFF_NUMERO_OPERACION
,SUM(CASE WHEN TRIM(UPPER(PROD.AUDITDATE_SYSTEM_DATE))!=TRIM(UPPER(UAT.AUDITDATE_SYSTEM_DATE)) THEN 1 ELSE 0 END) AS DIFF_AUDITDATE_SYSTEM_DATE
,SUM(CASE WHEN TRIM(UPPER(PROD.OPERATION_DATETIME))!=TRIM(UPPER(UAT.OPERATION_DATETIME)) THEN 1 ELSE 0 END) AS DIFF_OPERATION_DATETIME
,SUM(CASE WHEN PROD.ID_PRODUCTO!=UAT.ID_PRODUCTO THEN 1 ELSE 0 END) AS DIFF_ID_PRODUCTO
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRE_PRODUCTO))!=TRIM(UPPER(UAT.NOMBRE_PRODUCTO)) THEN 1 ELSE 0 END) AS DIFF_NOMBRE_PRODUCTO
,SUM(CASE WHEN TRIM(UPPER(PROD.STATUS_OPERATION))!=TRIM(UPPER(UAT.STATUS_OPERATION)) THEN 1 ELSE 0 END) AS DIFF_STATUS_OPERATION
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONASEGURADOINPUT))!=TRIM(UPPER(UAT.DIRECCIONASEGURADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONASEGURADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENXINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENXINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENVINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENVIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVIIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENVIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVIIIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENVIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIXINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENIXINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIVINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENIVINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIIIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENCIIIINPUT))!=TRIM(UPPER(UAT.PARENTESCOBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENXINPUT))!=TRIM(UPPER(UAT.NOMBRESBENXINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVINPUT))!=TRIM(UPPER(UAT.NOMBRESBENVINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENVIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVIIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENVIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVIIIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENVIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIXINPUT))!=TRIM(UPPER(UAT.NOMBRESBENIXINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIVINPUT))!=TRIM(UPPER(UAT.NOMBRESBENIVINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIIIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENCIIIINPUT))!=TRIM(UPPER(UAT.NOMBRESBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENXINPUT))!=TRIM(UPPER(UAT.FECHANACBENXINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVINPUT))!=TRIM(UPPER(UAT.FECHANACBENVINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVIINPUT))!=TRIM(UPPER(UAT.FECHANACBENVIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVIIINPUT))!=TRIM(UPPER(UAT.FECHANACBENVIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVIIIINPUT))!=TRIM(UPPER(UAT.FECHANACBENVIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIXINPUT))!=TRIM(UPPER(UAT.FECHANACBENIXINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIVINPUT))!=TRIM(UPPER(UAT.FECHANACBENIVINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIINPUT))!=TRIM(UPPER(UAT.FECHANACBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIIINPUT))!=TRIM(UPPER(UAT.FECHANACBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIIIINPUT))!=TRIM(UPPER(UAT.FECHANACBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIINPUT))!=TRIM(UPPER(UAT.FECHANACBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIIINPUT))!=TRIM(UPPER(UAT.FECHANACBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENCIIIINPUT))!=TRIM(UPPER(UAT.FECHANACBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENXINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENXINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENVINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENVIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVIIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENVIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVIIIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENVIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIXINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIXINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIVINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIVINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIIIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENCIIIINPUT))!=TRIM(UPPER(UAT.DOCIDENTIDADBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENXINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENXINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENVINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENVIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVIIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENVIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVIIIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENVIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIXINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIXINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIVINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIVINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIIIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENCIIIINPUT))!=TRIM(UPPER(UAT.DISTRIBUCIONBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENXINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENXINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENVINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENVIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVIIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENVIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVIIIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENVIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIXINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENIXINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIVINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENIVINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIIIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENCIIIINPUT))!=TRIM(UPPER(UAT.APEPATERNOBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENXINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENXINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENVINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENVIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVIIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENVIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVIIIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENVIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIXINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENIXINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIVINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENIVINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIIIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENCIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENCIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENCIIIINPUT))!=TRIM(UPPER(UAT.APEMATERNOBENCIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENCIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOACTIVACIONINPUT))!=TRIM(UPPER(UAT.TIPOACTIVACIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOACTIVACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOURINPUT))!=TRIM(UPPER(UAT.SEXOURINPUT)) THEN 1 ELSE 0 END) AS DIFF_SEXOURINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOCOTINPUT))!=TRIM(UPPER(UAT.SEXOCOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_SEXOCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCBENEFICIARIOINPUT))!=TRIM(UPPER(UAT.RUCBENEFICIARIOINPUT)) THEN 1 ELSE 0 END) AS DIFF_RUCBENEFICIARIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PORCENTAJECESIONINPUT))!=TRIM(UPPER(UAT.PORCENTAJECESIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_PORCENTAJECESIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZACESIONADAVEINPUT))!=TRIM(UPPER(UAT.POLIZACESIONADAVEINPUT)) THEN 1 ELSE 0 END) AS DIFF_POLIZACESIONADAVEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREBENEFICIARIOINPUT))!=TRIM(UPPER(UAT.NOMBREBENEFICIARIOINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBREBENEFICIARIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREBENEFICIARIOANTINPUT))!=TRIM(UPPER(UAT.NOMBREBENEFICIARIOANTINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBREBENEFICIARIOANTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCESIONINPUT))!=TRIM(UPPER(UAT.MONTOCESIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONTOCESIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FUMADORCONDICIONINPUT))!=TRIM(UPPER(UAT.FUMADORCONDICIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_FUMADORCONDICIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOCESIONINPUT))!=TRIM(UPPER(UAT.FRECUENCIAPAGOCESIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOCESIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOSININPUT))!=TRIM(UPPER(UAT.FECHANACIMIENTOSININPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOCOTINPUT))!=TRIM(UPPER(UAT.FECHANACIMIENTOCOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILBENEFPREFINPUT))!=TRIM(UPPER(UAT.EMAILBENEFPREFINPUT)) THEN 1 ELSE 0 END) AS DIFF_EMAILBENEFPREFINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPREFIJADASURAINPUT))!=TRIM(UPPER(UAT.EDADPREFIJADASURAINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADPREFIJADASURAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPERMANASEGINPUT))!=TRIM(UPPER(UAT.EDADPERMANASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADPERMANASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMINIMAASEGINPUT))!=TRIM(UPPER(UAT.EDADMINIMAASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMINIMAASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADMAXIMAASEGINPUT))!=TRIM(UPPER(UAT.EDADMAXIMAASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADMAXIMAASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADINPUT))!=TRIM(UPPER(UAT.EDADINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADACTUARIALINPUT))!=TRIM(UPPER(UAT.EDADACTUARIALINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADACTUARIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CUMULOFALLECVIDAINPUT))!=TRIM(UPPER(UAT.CUMULOFALLECVIDAINPUT)) THEN 1 ELSE 0 END) AS DIFF_CUMULOFALLECVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORINPUT))!=TRIM(UPPER(UAT.CONDICIONFUMADORINPUT)) THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CONDICIONFUMADORCOTINPUT))!=TRIM(UPPER(UAT.CONDICIONFUMADORCOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_CONDICIONFUMADORCOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONPOLASEGINPUT))!=TRIM(UPPER(UAT.COMUNICACIONPOLASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONPOLASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENASEGINPUT))!=TRIM(UPPER(UAT.COMUNICACIONGENASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONENASEGINPUT))!=TRIM(UPPER(UAT.COMUNICACIONENASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONENASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIINPUT))!=TRIM(UPPER(UAT.TELEFONOIINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIINPUT))!=TRIM(UPPER(UAT.TELEFONOIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIIINPUT))!=TRIM(UPPER(UAT.TELEFONOIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOACOTINPUT))!=TRIM(UPPER(UAT.NUMOACOTINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMOACOTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIINPUT))!=TRIM(UPPER(UAT.CORREOIINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIINPUT))!=TRIM(UPPER(UAT.CORREOIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIIINPUT))!=TRIM(UPPER(UAT.CORREOIIIINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOIIIINPUT
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.TD_OPERACION_BENEFICIARIO_raw UAT 
INNER JOIN interseguro-data.acsele_data.TD_OPERACION_BENEFICIARIO_raw PROD 
ON UAT.NUMERO_POLIZA = PROD.NUMERO_POLIZA 
AND UAT.NUMERO_OPERACION = PROD.NUMERO_OPERACION