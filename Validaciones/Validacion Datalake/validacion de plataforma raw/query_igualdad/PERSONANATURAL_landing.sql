SELECT SUM(CASE WHEN PROD.ADT_EVENTDATE!=UAT.ADT_EVENTDATE THEN 1 ELSE 0 END) AS DIFF_ADT_EVENTDATE
,SUM(CASE WHEN TRIM(UPPER(PROD.ADT_EVENTDATE_YYYYMMDD))!=TRIM(UPPER(UAT.ADT_EVENTDATE_YYYYMMDD)) THEN 1 ELSE 0 END) AS DIFF_ADT_EVENTDATE_YYYYMMDD
,SUM(CASE WHEN TRIM(UPPER(PROD.PK))!=TRIM(UPPER(UAT.PK)) THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN TRIM(UPPER(PROD.STATIC))!=TRIM(UPPER(UAT.STATIC)) THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN TRIM(UPPER(PROD.STATUS))!=TRIM(UPPER(UAT.STATUS)) THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOINPUT))!=TRIM(UPPER(UAT.APELLIDOINPUT)) THEN 1 ELSE 0 END) AS DIFF_APELLIDOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOVALUE))!=TRIM(UPPER(UAT.APELLIDOVALUE)) THEN 1 ELSE 0 END) AS DIFF_APELLIDOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOMATERNOINPUT))!=TRIM(UPPER(UAT.APELLIDOMATERNOINPUT)) THEN 1 ELSE 0 END) AS DIFF_APELLIDOMATERNOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOMATERNOVALUE))!=TRIM(UPPER(UAT.APELLIDOMATERNOVALUE)) THEN 1 ELSE 0 END) AS DIFF_APELLIDOMATERNOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOINPUT))!=TRIM(UPPER(UAT.FECHANACIMIENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHANACIMIENTOVALUE))!=TRIM(UPPER(UAT.FECHANACIMIENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHANACIMIENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOINPUT))!=TRIM(UPPER(UAT.SEXOINPUT)) THEN 1 ELSE 0 END) AS DIFF_SEXOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOVALUE))!=TRIM(UPPER(UAT.SEXOVALUE)) THEN 1 ELSE 0 END) AS DIFF_SEXOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ESTADOCIVILINPUT))!=TRIM(UPPER(UAT.ESTADOCIVILINPUT)) THEN 1 ELSE 0 END) AS DIFF_ESTADOCIVILINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ESTADOCIVILVALUE))!=TRIM(UPPER(UAT.ESTADOCIVILVALUE)) THEN 1 ELSE 0 END) AS DIFF_ESTADOCIVILVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CARNETEXTRANJERIAINPUT))!=TRIM(UPPER(UAT.CARNETEXTRANJERIAINPUT)) THEN 1 ELSE 0 END) AS DIFF_CARNETEXTRANJERIAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CARNETEXTRANJERIAVALUE))!=TRIM(UPPER(UAT.CARNETEXTRANJERIAVALUE)) THEN 1 ELSE 0 END) AS DIFF_CARNETEXTRANJERIAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PARTIDANACIMIENTOINPUT))!=TRIM(UPPER(UAT.PARTIDANACIMIENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_PARTIDANACIMIENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PARTIDANACIMIENTOVALUE))!=TRIM(UPPER(UAT.PARTIDANACIMIENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_PARTIDANACIMIENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PASAPORTEINPUT))!=TRIM(UPPER(UAT.PASAPORTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_PASAPORTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PASAPORTEVALUE))!=TRIM(UPPER(UAT.PASAPORTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_PASAPORTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREINPUT))!=TRIM(UPPER(UAT.NOMBREINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBREINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREVALUE))!=TRIM(UPPER(UAT.NOMBREVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBREVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCUMENTOIDENTIDADINPUT))!=TRIM(UPPER(UAT.DOCUMENTOIDENTIDADINPUT)) THEN 1 ELSE 0 END) AS DIFF_DOCUMENTOIDENTIDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DOCUMENTOIDENTIDADVALUE))!=TRIM(UPPER(UAT.DOCUMENTOIDENTIDADVALUE)) THEN 1 ELSE 0 END) AS DIFF_DOCUMENTOIDENTIDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CARNETMINISTRABINPUT))!=TRIM(UPPER(UAT.CARNETMINISTRABINPUT)) THEN 1 ELSE 0 END) AS DIFF_CARNETMINISTRABINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CARNETMINISTRABVALUE))!=TRIM(UPPER(UAT.CARNETMINISTRABVALUE)) THEN 1 ELSE 0 END) AS DIFF_CARNETMINISTRABVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CARNETIDENPOLICIAINPUT))!=TRIM(UPPER(UAT.CARNETIDENPOLICIAINPUT)) THEN 1 ELSE 0 END) AS DIFF_CARNETIDENPOLICIAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CARNETIDENPOLICIAVALUE))!=TRIM(UPPER(UAT.CARNETIDENPOLICIAVALUE)) THEN 1 ELSE 0 END) AS DIFF_CARNETIDENPOLICIAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SEGUNDONOMBREINPUT))!=TRIM(UPPER(UAT.SEGUNDONOMBREINPUT)) THEN 1 ELSE 0 END) AS DIFF_SEGUNDONOMBREINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEGUNDONOMBREVALUE))!=TRIM(UPPER(UAT.SEGUNDONOMBREVALUE)) THEN 1 ELSE 0 END) AS DIFF_SEGUNDONOMBREVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PROFESIONINPUT))!=TRIM(UPPER(UAT.PROFESIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_PROFESIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PROFESIONVALUE))!=TRIM(UPPER(UAT.PROFESIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_PROFESIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOAFPINPUT))!=TRIM(UPPER(UAT.CODIGOAFPINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODIGOAFPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOAFPVALUE))!=TRIM(UPPER(UAT.CODIGOAFPVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODIGOAFPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NACIONALIDADINPUT))!=TRIM(UPPER(UAT.NACIONALIDADINPUT)) THEN 1 ELSE 0 END) AS DIFF_NACIONALIDADINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NACIONALIDADVALUE))!=TRIM(UPPER(UAT.NACIONALIDADVALUE)) THEN 1 ELSE 0 END) AS DIFF_NACIONALIDADVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFALLECIMIENTOINPUT))!=TRIM(UPPER(UAT.FECHAFALLECIMIENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAFALLECIMIENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFALLECIMIENTOVALUE))!=TRIM(UPPER(UAT.FECHAFALLECIMIENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAFALLECIMIENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FUMADORCONDICIONINPUT))!=TRIM(UPPER(UAT.FUMADORCONDICIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_FUMADORCONDICIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FUMADORCONDICIONVALUE))!=TRIM(UPPER(UAT.FUMADORCONDICIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_FUMADORCONDICIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.LIBRETAMILITARINPUT))!=TRIM(UPPER(UAT.LIBRETAMILITARINPUT)) THEN 1 ELSE 0 END) AS DIFF_LIBRETAMILITARINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.LIBRETAMILITARVALUE))!=TRIM(UPPER(UAT.LIBRETAMILITARVALUE)) THEN 1 ELSE 0 END) AS DIFF_LIBRETAMILITARVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CARNETDIPLOMATICOINPUT))!=TRIM(UPPER(UAT.CARNETDIPLOMATICOINPUT)) THEN 1 ELSE 0 END) AS DIFF_CARNETDIPLOMATICOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CARNETDIPLOMATICOVALUE))!=TRIM(UPPER(UAT.CARNETDIPLOMATICOVALUE)) THEN 1 ELSE 0 END) AS DIFF_CARNETDIPLOMATICOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAMATRIMONIOINPUT))!=TRIM(UPPER(UAT.FECHAMATRIMONIOINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAMATRIMONIOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAMATRIMONIOVALUE))!=TRIM(UPPER(UAT.FECHAMATRIMONIOVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAMATRIMONIOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCNATURALINPUT))!=TRIM(UPPER(UAT.RUCNATURALINPUT)) THEN 1 ELSE 0 END) AS DIFF_RUCNATURALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RUCNATURALVALUE))!=TRIM(UPPER(UAT.RUCNATURALVALUE)) THEN 1 ELSE 0 END) AS DIFF_RUCNATURALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CARNETFUERZASARMADASINPUT))!=TRIM(UPPER(UAT.CARNETFUERZASARMADASINPUT)) THEN 1 ELSE 0 END) AS DIFF_CARNETFUERZASARMADASINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CARNETFUERZASARMADASVALUE))!=TRIM(UPPER(UAT.CARNETFUERZASARMADASVALUE)) THEN 1 ELSE 0 END) AS DIFF_CARNETFUERZASARMADASVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONEMAILINPUT))!=TRIM(UPPER(UAT.AUTORIZACIONEMAILINPUT)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONEMAILINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONEMAILVALUE))!=TRIM(UPPER(UAT.AUTORIZACIONEMAILVALUE)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONEMAILVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONSMSINPUT))!=TRIM(UPPER(UAT.AUTORIZACIONSMSINPUT)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONSMSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONSMSVALUE))!=TRIM(UPPER(UAT.AUTORIZACIONSMSVALUE)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONSMSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONCOMERDATINPUT))!=TRIM(UPPER(UAT.AUTORIZACIONCOMERDATINPUT)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONCOMERDATINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONCOMERDATVALUE))!=TRIM(UPPER(UAT.AUTORIZACIONCOMERDATVALUE)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONCOMERDATVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONTRATDATOSINPUT))!=TRIM(UPPER(UAT.AUTORIZACIONTRATDATOSINPUT)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONTRATDATOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONTRATDATOSVALUE))!=TRIM(UPPER(UAT.AUTORIZACIONTRATDATOSVALUE)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONTRATDATOSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONACCDATOSINPUT))!=TRIM(UPPER(UAT.AUTORIZACIONACCDATOSINPUT)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONACCDATOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONACCDATOSVALUE))!=TRIM(UPPER(UAT.AUTORIZACIONACCDATOSVALUE)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONACCDATOSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOCELULARDOSINPUT))!=TRIM(UPPER(UAT.TELEFONOCELULARDOSINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOCELULARDOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOCELULARDOSVALUE))!=TRIM(UPPER(UAT.TELEFONOCELULARDOSVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOCELULARDOSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOCELULARTRESINPUT))!=TRIM(UPPER(UAT.TELEFONOCELULARTRESINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOCELULARTRESINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOCELULARTRESVALUE))!=TRIM(UPPER(UAT.TELEFONOCELULARTRESVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOCELULARTRESVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOCELULARUNOINPUT))!=TRIM(UPPER(UAT.TELEFONOCELULARUNOINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOCELULARUNOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOCELULARUNOVALUE))!=TRIM(UPPER(UAT.TELEFONOCELULARUNOVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOCELULARUNOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOCOLABORADORINPUT))!=TRIM(UPPER(UAT.CODIGOCOLABORADORINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODIGOCOLABORADORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODIGOCOLABORADORVALUE))!=TRIM(UPPER(UAT.CODIGOCOLABORADORVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODIGOCOLABORADORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORCOLABORADORINPUT))!=TRIM(UPPER(UAT.INDICADORCOLABORADORINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDICADORCOLABORADORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORCOLABORADORVALUE))!=TRIM(UPPER(UAT.INDICADORCOLABORADORVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDICADORCOLABORADORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONENVLLAMAINPUT))!=TRIM(UPPER(UAT.AUTORIZACIONENVLLAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONENVLLAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.AUTORIZACIONENVLLAMAVALUE))!=TRIM(UPPER(UAT.AUTORIZACIONENVLLAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_AUTORIZACIONENVLLAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CARGODESEMPASEGINPUT))!=TRIM(UPPER(UAT.CARGODESEMPASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_CARGODESEMPASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CARGODESEMPASEGVALUE))!=TRIM(UPPER(UAT.CARGODESEMPASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_CARGODESEMPASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CENTROTRABASEGINPUT))!=TRIM(UPPER(UAT.CENTROTRABASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_CENTROTRABASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CENTROTRABASEGVALUE))!=TRIM(UPPER(UAT.CENTROTRABASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_CENTROTRABASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDPEPINPUT))!=TRIM(UPPER(UAT.INDPEPINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDPEPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDPEPVALUE))!=TRIM(UPPER(UAT.INDPEPVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDPEPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENERALINPUT))!=TRIM(UPPER(UAT.COMUNICACIONGENERALINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENERALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENERALVALUE))!=TRIM(UPPER(UAT.COMUNICACIONGENERALVALUE)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENERALVALUE