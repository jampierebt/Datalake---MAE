SELECT SUM(CASE WHEN PROD.pk!=UAT.pk THEN 1 ELSE 0 END) AS DIFF_pk
,SUM(CASE WHEN PROD.static!=UAT.static THEN 1 ELSE 0 END) AS DIFF_static
,SUM(CASE WHEN PROD.status!=UAT.status THEN 1 ELSE 0 END) AS DIFF_status
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidoinput))!=TRIM(UPPER(UAT.apellidoinput)) THEN 1 ELSE 0 END) AS DIFF_apellidoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidovalue))!=TRIM(UPPER(UAT.apellidovalue)) THEN 1 ELSE 0 END) AS DIFF_apellidovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidomaternoinput))!=TRIM(UPPER(UAT.apellidomaternoinput)) THEN 1 ELSE 0 END) AS DIFF_apellidomaternoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidomaternovalue))!=TRIM(UPPER(UAT.apellidomaternovalue)) THEN 1 ELSE 0 END) AS DIFF_apellidomaternovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechanacimientoinput))!=TRIM(UPPER(UAT.fechanacimientoinput)) THEN 1 ELSE 0 END) AS DIFF_fechanacimientoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechanacimientovalue))!=TRIM(UPPER(UAT.fechanacimientovalue)) THEN 1 ELSE 0 END) AS DIFF_fechanacimientovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.sexoinput))!=TRIM(UPPER(UAT.sexoinput)) THEN 1 ELSE 0 END) AS DIFF_sexoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.sexovalue))!=TRIM(UPPER(UAT.sexovalue)) THEN 1 ELSE 0 END) AS DIFF_sexovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.estadocivilinput))!=TRIM(UPPER(UAT.estadocivilinput)) THEN 1 ELSE 0 END) AS DIFF_estadocivilinput
,SUM(CASE WHEN TRIM(UPPER(PROD.estadocivilvalue))!=TRIM(UPPER(UAT.estadocivilvalue)) THEN 1 ELSE 0 END) AS DIFF_estadocivilvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetextranjeriainput))!=TRIM(UPPER(UAT.carnetextranjeriainput)) THEN 1 ELSE 0 END) AS DIFF_carnetextranjeriainput
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetextranjeriavalue))!=TRIM(UPPER(UAT.carnetextranjeriavalue)) THEN 1 ELSE 0 END) AS DIFF_carnetextranjeriavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.partidanacimientoinput))!=TRIM(UPPER(UAT.partidanacimientoinput)) THEN 1 ELSE 0 END) AS DIFF_partidanacimientoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.partidanacimientovalue))!=TRIM(UPPER(UAT.partidanacimientovalue)) THEN 1 ELSE 0 END) AS DIFF_partidanacimientovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.pasaporteinput))!=TRIM(UPPER(UAT.pasaporteinput)) THEN 1 ELSE 0 END) AS DIFF_pasaporteinput
,SUM(CASE WHEN TRIM(UPPER(PROD.pasaportevalue))!=TRIM(UPPER(UAT.pasaportevalue)) THEN 1 ELSE 0 END) AS DIFF_pasaportevalue
,SUM(CASE WHEN TRIM(UPPER(PROD.nombreinput))!=TRIM(UPPER(UAT.nombreinput)) THEN 1 ELSE 0 END) AS DIFF_nombreinput
,SUM(CASE WHEN TRIM(UPPER(PROD.nombrevalue))!=TRIM(UPPER(UAT.nombrevalue)) THEN 1 ELSE 0 END) AS DIFF_nombrevalue
,SUM(CASE WHEN TRIM(UPPER(PROD.documentoidentidadinput))!=TRIM(UPPER(UAT.documentoidentidadinput)) THEN 1 ELSE 0 END) AS DIFF_documentoidentidadinput
,SUM(CASE WHEN TRIM(UPPER(PROD.documentoidentidadvalue))!=TRIM(UPPER(UAT.documentoidentidadvalue)) THEN 1 ELSE 0 END) AS DIFF_documentoidentidadvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetministrabinput))!=TRIM(UPPER(UAT.carnetministrabinput)) THEN 1 ELSE 0 END) AS DIFF_carnetministrabinput
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetministrabvalue))!=TRIM(UPPER(UAT.carnetministrabvalue)) THEN 1 ELSE 0 END) AS DIFF_carnetministrabvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetidenpoliciainput))!=TRIM(UPPER(UAT.carnetidenpoliciainput)) THEN 1 ELSE 0 END) AS DIFF_carnetidenpoliciainput
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetidenpoliciavalue))!=TRIM(UPPER(UAT.carnetidenpoliciavalue)) THEN 1 ELSE 0 END) AS DIFF_carnetidenpoliciavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.segundonombreinput))!=TRIM(UPPER(UAT.segundonombreinput)) THEN 1 ELSE 0 END) AS DIFF_segundonombreinput
,SUM(CASE WHEN TRIM(UPPER(PROD.segundonombrevalue))!=TRIM(UPPER(UAT.segundonombrevalue)) THEN 1 ELSE 0 END) AS DIFF_segundonombrevalue
,SUM(CASE WHEN TRIM(UPPER(PROD.profesioninput))!=TRIM(UPPER(UAT.profesioninput)) THEN 1 ELSE 0 END) AS DIFF_profesioninput
,SUM(CASE WHEN TRIM(UPPER(PROD.profesionvalue))!=TRIM(UPPER(UAT.profesionvalue)) THEN 1 ELSE 0 END) AS DIFF_profesionvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.codigoafpinput))!=TRIM(UPPER(UAT.codigoafpinput)) THEN 1 ELSE 0 END) AS DIFF_codigoafpinput
,SUM(CASE WHEN TRIM(UPPER(PROD.codigoafpvalue))!=TRIM(UPPER(UAT.codigoafpvalue)) THEN 1 ELSE 0 END) AS DIFF_codigoafpvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.nacionalidadinput))!=TRIM(UPPER(UAT.nacionalidadinput)) THEN 1 ELSE 0 END) AS DIFF_nacionalidadinput
,SUM(CASE WHEN TRIM(UPPER(PROD.nacionalidadvalue))!=TRIM(UPPER(UAT.nacionalidadvalue)) THEN 1 ELSE 0 END) AS DIFF_nacionalidadvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechafallecimientoinput))!=TRIM(UPPER(UAT.fechafallecimientoinput)) THEN 1 ELSE 0 END) AS DIFF_fechafallecimientoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechafallecimientovalue))!=TRIM(UPPER(UAT.fechafallecimientovalue)) THEN 1 ELSE 0 END) AS DIFF_fechafallecimientovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fumadorcondicioninput))!=TRIM(UPPER(UAT.fumadorcondicioninput)) THEN 1 ELSE 0 END) AS DIFF_fumadorcondicioninput
,SUM(CASE WHEN TRIM(UPPER(PROD.fumadorcondicionvalue))!=TRIM(UPPER(UAT.fumadorcondicionvalue)) THEN 1 ELSE 0 END) AS DIFF_fumadorcondicionvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.libretamilitarinput))!=TRIM(UPPER(UAT.libretamilitarinput)) THEN 1 ELSE 0 END) AS DIFF_libretamilitarinput
,SUM(CASE WHEN TRIM(UPPER(PROD.libretamilitarvalue))!=TRIM(UPPER(UAT.libretamilitarvalue)) THEN 1 ELSE 0 END) AS DIFF_libretamilitarvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetdiplomaticoinput))!=TRIM(UPPER(UAT.carnetdiplomaticoinput)) THEN 1 ELSE 0 END) AS DIFF_carnetdiplomaticoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetdiplomaticovalue))!=TRIM(UPPER(UAT.carnetdiplomaticovalue)) THEN 1 ELSE 0 END) AS DIFF_carnetdiplomaticovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fechamatrimonioinput))!=TRIM(UPPER(UAT.fechamatrimonioinput)) THEN 1 ELSE 0 END) AS DIFF_fechamatrimonioinput
,SUM(CASE WHEN TRIM(UPPER(PROD.fechamatrimoniovalue))!=TRIM(UPPER(UAT.fechamatrimoniovalue)) THEN 1 ELSE 0 END) AS DIFF_fechamatrimoniovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.rucnaturalinput))!=TRIM(UPPER(UAT.rucnaturalinput)) THEN 1 ELSE 0 END) AS DIFF_rucnaturalinput
,SUM(CASE WHEN TRIM(UPPER(PROD.rucnaturalvalue))!=TRIM(UPPER(UAT.rucnaturalvalue)) THEN 1 ELSE 0 END) AS DIFF_rucnaturalvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetfuerzasarmadasinput))!=TRIM(UPPER(UAT.carnetfuerzasarmadasinput)) THEN 1 ELSE 0 END) AS DIFF_carnetfuerzasarmadasinput
,SUM(CASE WHEN TRIM(UPPER(PROD.carnetfuerzasarmadasvalue))!=TRIM(UPPER(UAT.carnetfuerzasarmadasvalue)) THEN 1 ELSE 0 END) AS DIFF_carnetfuerzasarmadasvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionemailinput))!=TRIM(UPPER(UAT.autorizacionemailinput)) THEN 1 ELSE 0 END) AS DIFF_autorizacionemailinput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionemailvalue))!=TRIM(UPPER(UAT.autorizacionemailvalue)) THEN 1 ELSE 0 END) AS DIFF_autorizacionemailvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionsmsinput))!=TRIM(UPPER(UAT.autorizacionsmsinput)) THEN 1 ELSE 0 END) AS DIFF_autorizacionsmsinput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionsmsvalue))!=TRIM(UPPER(UAT.autorizacionsmsvalue)) THEN 1 ELSE 0 END) AS DIFF_autorizacionsmsvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacioncomerdatinput))!=TRIM(UPPER(UAT.autorizacioncomerdatinput)) THEN 1 ELSE 0 END) AS DIFF_autorizacioncomerdatinput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacioncomerdatvalue))!=TRIM(UPPER(UAT.autorizacioncomerdatvalue)) THEN 1 ELSE 0 END) AS DIFF_autorizacioncomerdatvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizaciontratdatosinput))!=TRIM(UPPER(UAT.autorizaciontratdatosinput)) THEN 1 ELSE 0 END) AS DIFF_autorizaciontratdatosinput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizaciontratdatosvalue))!=TRIM(UPPER(UAT.autorizaciontratdatosvalue)) THEN 1 ELSE 0 END) AS DIFF_autorizaciontratdatosvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionaccdatosinput))!=TRIM(UPPER(UAT.autorizacionaccdatosinput)) THEN 1 ELSE 0 END) AS DIFF_autorizacionaccdatosinput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionaccdatosvalue))!=TRIM(UPPER(UAT.autorizacionaccdatosvalue)) THEN 1 ELSE 0 END) AS DIFF_autorizacionaccdatosvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelulardosinput))!=TRIM(UPPER(UAT.telefonocelulardosinput)) THEN 1 ELSE 0 END) AS DIFF_telefonocelulardosinput
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelulardosvalue))!=TRIM(UPPER(UAT.telefonocelulardosvalue)) THEN 1 ELSE 0 END) AS DIFF_telefonocelulardosvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelulartresinput))!=TRIM(UPPER(UAT.telefonocelulartresinput)) THEN 1 ELSE 0 END) AS DIFF_telefonocelulartresinput
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelulartresvalue))!=TRIM(UPPER(UAT.telefonocelulartresvalue)) THEN 1 ELSE 0 END) AS DIFF_telefonocelulartresvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelularunoinput))!=TRIM(UPPER(UAT.telefonocelularunoinput)) THEN 1 ELSE 0 END) AS DIFF_telefonocelularunoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonocelularunovalue))!=TRIM(UPPER(UAT.telefonocelularunovalue)) THEN 1 ELSE 0 END) AS DIFF_telefonocelularunovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.codigocolaboradorinput))!=TRIM(UPPER(UAT.codigocolaboradorinput)) THEN 1 ELSE 0 END) AS DIFF_codigocolaboradorinput
,SUM(CASE WHEN TRIM(UPPER(PROD.codigocolaboradorvalue))!=TRIM(UPPER(UAT.codigocolaboradorvalue)) THEN 1 ELSE 0 END) AS DIFF_codigocolaboradorvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.indicadorcolaboradorinput))!=TRIM(UPPER(UAT.indicadorcolaboradorinput)) THEN 1 ELSE 0 END) AS DIFF_indicadorcolaboradorinput
,SUM(CASE WHEN TRIM(UPPER(PROD.indicadorcolaboradorvalue))!=TRIM(UPPER(UAT.indicadorcolaboradorvalue)) THEN 1 ELSE 0 END) AS DIFF_indicadorcolaboradorvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionenvllamainput))!=TRIM(UPPER(UAT.autorizacionenvllamainput)) THEN 1 ELSE 0 END) AS DIFF_autorizacionenvllamainput
,SUM(CASE WHEN TRIM(UPPER(PROD.autorizacionenvllamavalue))!=TRIM(UPPER(UAT.autorizacionenvllamavalue)) THEN 1 ELSE 0 END) AS DIFF_autorizacionenvllamavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.cargodesempaseginput))!=TRIM(UPPER(UAT.cargodesempaseginput)) THEN 1 ELSE 0 END) AS DIFF_cargodesempaseginput
,SUM(CASE WHEN TRIM(UPPER(PROD.cargodesempasegvalue))!=TRIM(UPPER(UAT.cargodesempasegvalue)) THEN 1 ELSE 0 END) AS DIFF_cargodesempasegvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.centrotrabaseginput))!=TRIM(UPPER(UAT.centrotrabaseginput)) THEN 1 ELSE 0 END) AS DIFF_centrotrabaseginput
,SUM(CASE WHEN TRIM(UPPER(PROD.centrotrabasegvalue))!=TRIM(UPPER(UAT.centrotrabasegvalue)) THEN 1 ELSE 0 END) AS DIFF_centrotrabasegvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.indpepinput))!=TRIM(UPPER(UAT.indpepinput)) THEN 1 ELSE 0 END) AS DIFF_indpepinput
,SUM(CASE WHEN TRIM(UPPER(PROD.indpepvalue))!=TRIM(UPPER(UAT.indpepvalue)) THEN 1 ELSE 0 END) AS DIFF_indpepvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.comunicaciongeneralinput))!=TRIM(UPPER(UAT.comunicaciongeneralinput)) THEN 1 ELSE 0 END) AS DIFF_comunicaciongeneralinput
,SUM(CASE WHEN TRIM(UPPER(PROD.comunicaciongeneralvalue))!=TRIM(UPPER(UAT.comunicaciongeneralvalue)) THEN 1 ELSE 0 END) AS DIFF_comunicaciongeneralvalue
FROM iter-data-storage-pv-uat.acsele_data.PERSONANATURAL_raw UAT 
INNER JOIN interseguro-data.acsele_data.PERSONANATURAL_raw PROD 
ON UAT.PK = PROD.PK