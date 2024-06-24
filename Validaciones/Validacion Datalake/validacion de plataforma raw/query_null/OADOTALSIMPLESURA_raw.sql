SELECT SUM(CASE WHEN TRIM(UPPER(PROD.FUMADORCONDICIONINPUT)) IS NULL AND TRIM(UPPER(UAT.FUMADORCONDICIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FUMADORCONDICIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FUMADORCONDICIONVALUE)) IS NULL AND TRIM(UPPER(UAT.FUMADORCONDICIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FUMADORCONDICIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADACTUARIALINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADACTUARIALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADACTUARIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADACTUARIALVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADACTUARIALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADACTUARIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREBENEFICIARIOINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBREBENEFICIARIOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREBENEFICIARIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREBENEFICIARIOVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBREBENEFICIARIOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREBENEFICIARIOVALUE
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
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIVINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIVVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIVINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIVVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIVINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIVVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIVINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIVVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIVINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIVVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIVINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIVVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIVINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIVVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVVALUE
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
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENVIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENVIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENVIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENVIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENVIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENVIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENVIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENVIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIXINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENIXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENIXVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENIXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENIXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENXINPUT)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEPATERNOBENXVALUE)) IS NULL AND TRIM(UPPER(UAT.APEPATERNOBENXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEPATERNOBENXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENVIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENVIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENVIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENVIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENVIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENVIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENVIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENVIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIXINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENIXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENIXVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENIXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENIXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENXINPUT)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APEMATERNOBENXVALUE)) IS NULL AND TRIM(UPPER(UAT.APEMATERNOBENXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APEMATERNOBENXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVIINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENVIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVIVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENVIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVIIINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENVIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVIIVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENVIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENVIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENVIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENVIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENVIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIXINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENIXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENIXVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENIXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENIXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENXINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRESBENXVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRESBENXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRESBENXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENVIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENVIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENVIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENVIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENVIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENVIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENVIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENVIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIXINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENIXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENIXVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENIXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENIXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENXINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACBENXVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACBENXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACBENXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVIINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENVIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVIVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENVIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENVIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENVIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENVIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENVIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENVIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENVIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIXINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENIXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENIXVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENIXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENIXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENXINPUT)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCIDENTIDADBENXVALUE)) IS NULL AND TRIM(UPPER(UAT.DOCIDENTIDADBENXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DOCIDENTIDADBENXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVIINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENVIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVIVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENVIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENVIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENVIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENVIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENVIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENVIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENVIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIXINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENIXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENIXVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENIXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENIXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENXINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRIBUCIONBENXVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRIBUCIONBENXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRIBUCIONBENXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVIINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENVIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVIVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENVIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVIIINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENVIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVIIVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENVIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENVIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENVIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENVIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENVIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIXINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENIXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENIXVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENIXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENIXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENXINPUT)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARENTESCOBENXVALUE)) IS NULL AND TRIM(UPPER(UAT.PARENTESCOBENXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PARENTESCOBENXVALUE
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
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOSININPUT)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOSININPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOSININPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOSINVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHANACIMIENTOSINVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOSINVALUE
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
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZACESIONADAVEINPUT)) IS NULL AND TRIM(UPPER(UAT.POLIZACESIONADAVEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_POLIZACESIONADAVEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZACESIONADAVEVALUE)) IS NULL AND TRIM(UPPER(UAT.POLIZACESIONADAVEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_POLIZACESIONADAVEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PORCENTAJECESIONINPUT)) IS NULL AND TRIM(UPPER(UAT.PORCENTAJECESIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PORCENTAJECESIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PORCENTAJECESIONVALUE)) IS NULL AND TRIM(UPPER(UAT.PORCENTAJECESIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PORCENTAJECESIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCESIONINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCESIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCESIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCESIONVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCESIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCESIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCBENEFICIARIOINPUT)) IS NULL AND TRIM(UPPER(UAT.RUCBENEFICIARIOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RUCBENEFICIARIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCBENEFICIARIOVALUE)) IS NULL AND TRIM(UPPER(UAT.RUCBENEFICIARIOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RUCBENEFICIARIOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOCESIONINPUT)) IS NULL AND TRIM(UPPER(UAT.FRECUENCIAPAGOCESIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOCESIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOCESIONVALUE)) IS NULL AND TRIM(UPPER(UAT.FRECUENCIAPAGOCESIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOCESIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CUMULOFALLECVIDAINPUT)) IS NULL AND TRIM(UPPER(UAT.CUMULOFALLECVIDAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CUMULOFALLECVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CUMULOFALLECVIDAVALUE)) IS NULL AND TRIM(UPPER(UAT.CUMULOFALLECVIDAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CUMULOFALLECVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILBENEFPREFINPUT)) IS NULL AND TRIM(UPPER(UAT.EMAILBENEFPREFINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EMAILBENEFPREFINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILBENEFPREFVALUE)) IS NULL AND TRIM(UPPER(UAT.EMAILBENEFPREFVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EMAILBENEFPREFVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREBENEFICIARIOANTINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBREBENEFICIARIOANTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREBENEFICIARIOANTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREBENEFICIARIOANTVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBREBENEFICIARIOANTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREBENEFICIARIOANTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPREFIJADASURAINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADPREFIJADASURAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADPREFIJADASURAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADPREFIJADASURAVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADPREFIJADASURAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADPREFIJADASURAVALUE
FROM iter-data-storage-pv-uat.acsele_data.OADOTALSIMPLESURA_raw UAT 
INNER JOIN interseguro-data.acsele_data.OADOTALSIMPLESURA_raw PROD 
ON UAT.PK = PROD.PK