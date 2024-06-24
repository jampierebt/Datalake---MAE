SELECT SUM(CASE WHEN TRIM(UPPER(PROD.apellidoinput)) IS NULL AND TRIM(UPPER(UAT.apellidoinput))="" THEN 1 ELSE 0 END) AS DIFF_apellidoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidovalue)) IS NULL AND TRIM(UPPER(UAT.apellidovalue))="" THEN 1 ELSE 0 END) AS DIFF_apellidovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidomaternoinput)) IS NULL AND TRIM(UPPER(UAT.apellidomaternoinput))="" THEN 1 ELSE 0 END) AS DIFF_apellidomaternoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidomaternovalue)) IS NULL AND TRIM(UPPER(UAT.apellidomaternovalue))="" THEN 1 ELSE 0 END) AS DIFF_apellidomaternovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechanacimientoinput)) IS NULL AND TRIM(UPPER(UAT.fechanacimientoinput))="" THEN 1 ELSE 0 END) AS DIFF_fechanacimientoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechanacimientovalue)) IS NULL AND TRIM(UPPER(UAT.fechanacimientovalue))="" THEN 1 ELSE 0 END) AS DIFF_fechanacimientovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.sexoinput)) IS NULL AND TRIM(UPPER(UAT.sexoinput))="" THEN 1 ELSE 0 END) AS DIFF_sexoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.sexovalue)) IS NULL AND TRIM(UPPER(UAT.sexovalue))="" THEN 1 ELSE 0 END) AS DIFF_sexovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.estadocivilinput)) IS NULL AND TRIM(UPPER(UAT.estadocivilinput))="" THEN 1 ELSE 0 END) AS DIFF_estadocivilinput
,SUM(CASE WHEN TRIM(UPPER(PROD.estadocivilvalue)) IS NULL AND TRIM(UPPER(UAT.estadocivilvalue))="" THEN 1 ELSE 0 END) AS DIFF_estadocivilvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetextranjeriainput)) IS NULL AND TRIM(UPPER(UAT.carnetextranjeriainput))="" THEN 1 ELSE 0 END) AS DIFF_carnetextranjeriainput
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetextranjeriavalue)) IS NULL AND TRIM(UPPER(UAT.carnetextranjeriavalue))="" THEN 1 ELSE 0 END) AS DIFF_carnetextranjeriavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.partidanacimientoinput)) IS NULL AND TRIM(UPPER(UAT.partidanacimientoinput))="" THEN 1 ELSE 0 END) AS DIFF_partidanacimientoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.partidanacimientovalue)) IS NULL AND TRIM(UPPER(UAT.partidanacimientovalue))="" THEN 1 ELSE 0 END) AS DIFF_partidanacimientovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.pasaporteinput)) IS NULL AND TRIM(UPPER(UAT.pasaporteinput))="" THEN 1 ELSE 0 END) AS DIFF_pasaporteinput
,SUM(CASE WHEN TRIM(UPPER(PROD.pasaportevalue)) IS NULL AND TRIM(UPPER(UAT.pasaportevalue))="" THEN 1 ELSE 0 END) AS DIFF_pasaportevalue
,SUM(CASE WHEN TRIM(UPPER(PROD.nombreinput)) IS NULL AND TRIM(UPPER(UAT.nombreinput))="" THEN 1 ELSE 0 END) AS DIFF_nombreinput
,SUM(CASE WHEN TRIM(UPPER(PROD.nombrevalue)) IS NULL AND TRIM(UPPER(UAT.nombrevalue))="" THEN 1 ELSE 0 END) AS DIFF_nombrevalue
,SUM(CASE WHEN TRIM(UPPER(PROD.documentoidentidadinput)) IS NULL AND TRIM(UPPER(UAT.documentoidentidadinput))="" THEN 1 ELSE 0 END) AS DIFF_documentoidentidadinput
,SUM(CASE WHEN TRIM(UPPER(PROD.documentoidentidadvalue)) IS NULL AND TRIM(UPPER(UAT.documentoidentidadvalue))="" THEN 1 ELSE 0 END) AS DIFF_documentoidentidadvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetministrabinput)) IS NULL AND TRIM(UPPER(UAT.carnetministrabinput))="" THEN 1 ELSE 0 END) AS DIFF_carnetministrabinput
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetministrabvalue)) IS NULL AND TRIM(UPPER(UAT.carnetministrabvalue))="" THEN 1 ELSE 0 END) AS DIFF_carnetministrabvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetidenpoliciainput)) IS NULL AND TRIM(UPPER(UAT.carnetidenpoliciainput))="" THEN 1 ELSE 0 END) AS DIFF_carnetidenpoliciainput
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetidenpoliciavalue)) IS NULL AND TRIM(UPPER(UAT.carnetidenpoliciavalue))="" THEN 1 ELSE 0 END) AS DIFF_carnetidenpoliciavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.segundonombreinput)) IS NULL AND TRIM(UPPER(UAT.segundonombreinput))="" THEN 1 ELSE 0 END) AS DIFF_segundonombreinput
,SUM(CASE WHEN TRIM(UPPER(PROD.segundonombrevalue)) IS NULL AND TRIM(UPPER(UAT.segundonombrevalue))="" THEN 1 ELSE 0 END) AS DIFF_segundonombrevalue
,SUM(CASE WHEN TRIM(UPPER(PROD.profesioninput)) IS NULL AND TRIM(UPPER(UAT.profesioninput))="" THEN 1 ELSE 0 END) AS DIFF_profesioninput
,SUM(CASE WHEN TRIM(UPPER(PROD.profesionvalue)) IS NULL AND TRIM(UPPER(UAT.profesionvalue))="" THEN 1 ELSE 0 END) AS DIFF_profesionvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.codigoafpinput)) IS NULL AND TRIM(UPPER(UAT.codigoafpinput))="" THEN 1 ELSE 0 END) AS DIFF_codigoafpinput
,SUM(CASE WHEN TRIM(UPPER(PROD.codigoafpvalue)) IS NULL AND TRIM(UPPER(UAT.codigoafpvalue))="" THEN 1 ELSE 0 END) AS DIFF_codigoafpvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.nacionalidadinput)) IS NULL AND TRIM(UPPER(UAT.nacionalidadinput))="" THEN 1 ELSE 0 END) AS DIFF_nacionalidadinput
,SUM(CASE WHEN TRIM(UPPER(PROD.nacionalidadvalue)) IS NULL AND TRIM(UPPER(UAT.nacionalidadvalue))="" THEN 1 ELSE 0 END) AS DIFF_nacionalidadvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechafallecimientoinput)) IS NULL AND TRIM(UPPER(UAT.fechafallecimientoinput))="" THEN 1 ELSE 0 END) AS DIFF_fechafallecimientoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechafallecimientovalue)) IS NULL AND TRIM(UPPER(UAT.fechafallecimientovalue))="" THEN 1 ELSE 0 END) AS DIFF_fechafallecimientovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fumadorcondicioninput)) IS NULL AND TRIM(UPPER(UAT.fumadorcondicioninput))="" THEN 1 ELSE 0 END) AS DIFF_fumadorcondicioninput
,SUM(CASE WHEN TRIM(UPPER(PROD.fumadorcondicionvalue)) IS NULL AND TRIM(UPPER(UAT.fumadorcondicionvalue))="" THEN 1 ELSE 0 END) AS DIFF_fumadorcondicionvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.libretamilitarinput)) IS NULL AND TRIM(UPPER(UAT.libretamilitarinput))="" THEN 1 ELSE 0 END) AS DIFF_libretamilitarinput
,SUM(CASE WHEN TRIM(UPPER(PROD.libretamilitarvalue)) IS NULL AND TRIM(UPPER(UAT.libretamilitarvalue))="" THEN 1 ELSE 0 END) AS DIFF_libretamilitarvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetdiplomaticoinput)) IS NULL AND TRIM(UPPER(UAT.carnetdiplomaticoinput))="" THEN 1 ELSE 0 END) AS DIFF_carnetdiplomaticoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetdiplomaticovalue)) IS NULL AND TRIM(UPPER(UAT.carnetdiplomaticovalue))="" THEN 1 ELSE 0 END) AS DIFF_carnetdiplomaticovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechamatrimonioinput)) IS NULL AND TRIM(UPPER(UAT.fechamatrimonioinput))="" THEN 1 ELSE 0 END) AS DIFF_fechamatrimonioinput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechamatrimoniovalue)) IS NULL AND TRIM(UPPER(UAT.fechamatrimoniovalue))="" THEN 1 ELSE 0 END) AS DIFF_fechamatrimoniovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.rucnaturalinput)) IS NULL AND TRIM(UPPER(UAT.rucnaturalinput))="" THEN 1 ELSE 0 END) AS DIFF_rucnaturalinput
,SUM(CASE WHEN TRIM(UPPER(PROD.rucnaturalvalue)) IS NULL AND TRIM(UPPER(UAT.rucnaturalvalue))="" THEN 1 ELSE 0 END) AS DIFF_rucnaturalvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetfuerzasarmadasinput)) IS NULL AND TRIM(UPPER(UAT.carnetfuerzasarmadasinput))="" THEN 1 ELSE 0 END) AS DIFF_carnetfuerzasarmadasinput
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetfuerzasarmadasvalue)) IS NULL AND TRIM(UPPER(UAT.carnetfuerzasarmadasvalue))="" THEN 1 ELSE 0 END) AS DIFF_carnetfuerzasarmadasvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionemailinput)) IS NULL AND TRIM(UPPER(UAT.autorizacionemailinput))="" THEN 1 ELSE 0 END) AS DIFF_autorizacionemailinput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionemailvalue)) IS NULL AND TRIM(UPPER(UAT.autorizacionemailvalue))="" THEN 1 ELSE 0 END) AS DIFF_autorizacionemailvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionsmsinput)) IS NULL AND TRIM(UPPER(UAT.autorizacionsmsinput))="" THEN 1 ELSE 0 END) AS DIFF_autorizacionsmsinput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionsmsvalue)) IS NULL AND TRIM(UPPER(UAT.autorizacionsmsvalue))="" THEN 1 ELSE 0 END) AS DIFF_autorizacionsmsvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacioncomerdatinput)) IS NULL AND TRIM(UPPER(UAT.autorizacioncomerdatinput))="" THEN 1 ELSE 0 END) AS DIFF_autorizacioncomerdatinput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacioncomerdatvalue)) IS NULL AND TRIM(UPPER(UAT.autorizacioncomerdatvalue))="" THEN 1 ELSE 0 END) AS DIFF_autorizacioncomerdatvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizaciontratdatosinput)) IS NULL AND TRIM(UPPER(UAT.autorizaciontratdatosinput))="" THEN 1 ELSE 0 END) AS DIFF_autorizaciontratdatosinput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizaciontratdatosvalue)) IS NULL AND TRIM(UPPER(UAT.autorizaciontratdatosvalue))="" THEN 1 ELSE 0 END) AS DIFF_autorizaciontratdatosvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionaccdatosinput)) IS NULL AND TRIM(UPPER(UAT.autorizacionaccdatosinput))="" THEN 1 ELSE 0 END) AS DIFF_autorizacionaccdatosinput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionaccdatosvalue)) IS NULL AND TRIM(UPPER(UAT.autorizacionaccdatosvalue))="" THEN 1 ELSE 0 END) AS DIFF_autorizacionaccdatosvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelulardosinput)) IS NULL AND TRIM(UPPER(UAT.telefonocelulardosinput))="" THEN 1 ELSE 0 END) AS DIFF_telefonocelulardosinput
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelulardosvalue)) IS NULL AND TRIM(UPPER(UAT.telefonocelulardosvalue))="" THEN 1 ELSE 0 END) AS DIFF_telefonocelulardosvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelulartresinput)) IS NULL AND TRIM(UPPER(UAT.telefonocelulartresinput))="" THEN 1 ELSE 0 END) AS DIFF_telefonocelulartresinput
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelulartresvalue)) IS NULL AND TRIM(UPPER(UAT.telefonocelulartresvalue))="" THEN 1 ELSE 0 END) AS DIFF_telefonocelulartresvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelularunoinput)) IS NULL AND TRIM(UPPER(UAT.telefonocelularunoinput))="" THEN 1 ELSE 0 END) AS DIFF_telefonocelularunoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelularunovalue)) IS NULL AND TRIM(UPPER(UAT.telefonocelularunovalue))="" THEN 1 ELSE 0 END) AS DIFF_telefonocelularunovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.codigocolaboradorinput)) IS NULL AND TRIM(UPPER(UAT.codigocolaboradorinput))="" THEN 1 ELSE 0 END) AS DIFF_codigocolaboradorinput
,SUM(CASE WHEN TRIM(UPPER(PROD.codigocolaboradorvalue)) IS NULL AND TRIM(UPPER(UAT.codigocolaboradorvalue))="" THEN 1 ELSE 0 END) AS DIFF_codigocolaboradorvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.indicadorcolaboradorinput)) IS NULL AND TRIM(UPPER(UAT.indicadorcolaboradorinput))="" THEN 1 ELSE 0 END) AS DIFF_indicadorcolaboradorinput
,SUM(CASE WHEN TRIM(UPPER(PROD.indicadorcolaboradorvalue)) IS NULL AND TRIM(UPPER(UAT.indicadorcolaboradorvalue))="" THEN 1 ELSE 0 END) AS DIFF_indicadorcolaboradorvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionenvllamainput)) IS NULL AND TRIM(UPPER(UAT.autorizacionenvllamainput))="" THEN 1 ELSE 0 END) AS DIFF_autorizacionenvllamainput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionenvllamavalue)) IS NULL AND TRIM(UPPER(UAT.autorizacionenvllamavalue))="" THEN 1 ELSE 0 END) AS DIFF_autorizacionenvllamavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.cargodesempaseginput)) IS NULL AND TRIM(UPPER(UAT.cargodesempaseginput))="" THEN 1 ELSE 0 END) AS DIFF_cargodesempaseginput
,SUM(CASE WHEN TRIM(UPPER(PROD.cargodesempasegvalue)) IS NULL AND TRIM(UPPER(UAT.cargodesempasegvalue))="" THEN 1 ELSE 0 END) AS DIFF_cargodesempasegvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.centrotrabaseginput)) IS NULL AND TRIM(UPPER(UAT.centrotrabaseginput))="" THEN 1 ELSE 0 END) AS DIFF_centrotrabaseginput
,SUM(CASE WHEN TRIM(UPPER(PROD.centrotrabasegvalue)) IS NULL AND TRIM(UPPER(UAT.centrotrabasegvalue))="" THEN 1 ELSE 0 END) AS DIFF_centrotrabasegvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.indpepinput)) IS NULL AND TRIM(UPPER(UAT.indpepinput))="" THEN 1 ELSE 0 END) AS DIFF_indpepinput
,SUM(CASE WHEN TRIM(UPPER(PROD.indpepvalue)) IS NULL AND TRIM(UPPER(UAT.indpepvalue))="" THEN 1 ELSE 0 END) AS DIFF_indpepvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.comunicaciongeneralinput)) IS NULL AND TRIM(UPPER(UAT.comunicaciongeneralinput))="" THEN 1 ELSE 0 END) AS DIFF_comunicaciongeneralinput
,SUM(CASE WHEN TRIM(UPPER(PROD.comunicaciongeneralvalue)) IS NULL AND TRIM(UPPER(UAT.comunicaciongeneralvalue))="" THEN 1 ELSE 0 END) AS DIFF_comunicaciongeneralvalue
FROM iter-data-storage-pv-uat.acsele_data.PERSONANATURAL_raw UAT 
INNER JOIN interseguro-data.acsele_data.PERSONANATURAL_raw PROD 
ON UAT.PK = PROD.PK