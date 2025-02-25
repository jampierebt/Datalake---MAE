SELECT SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SUMAASEGURADAINPUT)) IS NULL AND TRIM(UPPER(UAT.SUMAASEGURADAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SUMAASEGURADAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SUMAASEGURADAVALUE)) IS NULL AND TRIM(UPPER(UAT.SUMAASEGURADAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SUMAASEGURADAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCUMENTOINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPODOCUMENTOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPODOCUMENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCUMENTOVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPODOCUMENTOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPODOCUMENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCUMENTOINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMERODOCUMENTOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMERODOCUMENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCUMENTOVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMERODOCUMENTOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMERODOCUMENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRODUCTOSVIDAINPUT)) IS NULL AND TRIM(UPPER(UAT.PRODUCTOSVIDAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRODUCTOSVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRODUCTOSVIDAVALUE)) IS NULL AND TRIM(UPPER(UAT.PRODUCTOSVIDAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRODUCTOSVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANVIDAINPUT)) IS NULL AND TRIM(UPPER(UAT.PLANVIDAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PLANVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANVIDAVALUE)) IS NULL AND TRIM(UPPER(UAT.PLANVIDAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PLANVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHACOTIZACIONINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHACOTIZACIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHACOTIZACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHACOTIZACIONVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHACOTIZACIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHACOTIZACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FLAGVALVIADEPAGOINPUT)) IS NULL AND TRIM(UPPER(UAT.FLAGVALVIADEPAGOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FLAGVALVIADEPAGOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FLAGVALVIADEPAGOVALUE)) IS NULL AND TRIM(UPPER(UAT.FLAGVALVIADEPAGOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FLAGVALVIADEPAGOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONPOLIZAINPUT)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONPOLIZAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONPOLIZAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONPOLIZAVALUE)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONPOLIZAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONPOLIZAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZAELECTRONICAINPUT)) IS NULL AND TRIM(UPPER(UAT.POLIZAELECTRONICAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_POLIZAELECTRONICAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZAELECTRONICAVALUE)) IS NULL AND TRIM(UPPER(UAT.POLIZAELECTRONICAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_POLIZAELECTRONICAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONENDOSOINPUT)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONENDOSOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONENDOSOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONENDOSOVALUE)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONENDOSOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONENDOSOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FLAGNVACOTIZACIONINPUT)) IS NULL AND TRIM(UPPER(UAT.FLAGNVACOTIZACIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FLAGNVACOTIZACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FLAGNVACOTIZACIONVALUE)) IS NULL AND TRIM(UPPER(UAT.FLAGNVACOTIZACIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FLAGNVACOTIZACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPAGOINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPOPAGOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPOPAGOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPAGOVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPOPAGOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPOPAGOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOPERACIONINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMOPERACIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMOPERACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOPERACIONVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMOPERACIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMOPERACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDATRANSACCIONINPUT)) IS NULL AND TRIM(UPPER(UAT.MONEDATRANSACCIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONEDATRANSACCIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDATRANSACCIONVALUE)) IS NULL AND TRIM(UPPER(UAT.MONEDATRANSACCIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONEDATRANSACCIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOTRANSACCIONINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOTRANSACCIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOTRANSACCIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOTRANSACCIONVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOTRANSACCIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOTRANSACCIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEINICIALINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMAGENTEINICIALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEINICIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEINICIALVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMAGENTEINICIALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEINICIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEFINALINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMAGENTEFINALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEFINALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEFINALVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMAGENTEFINALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEFINALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.AGENCIAINICIALINPUT)) IS NULL AND TRIM(UPPER(UAT.AGENCIAINICIALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_AGENCIAINICIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.AGENCIAINICIALVALUE)) IS NULL AND TRIM(UPPER(UAT.AGENCIAINICIALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_AGENCIAINICIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.AGENCIAFINALINPUT)) IS NULL AND TRIM(UPPER(UAT.AGENCIAFINALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_AGENCIAFINALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.AGENCIAFINALVALUE)) IS NULL AND TRIM(UPPER(UAT.AGENCIAFINALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_AGENCIAFINALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILENVIOENDOSOINPUT)) IS NULL AND TRIM(UPPER(UAT.EMAILENVIOENDOSOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EMAILENVIOENDOSOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILENVIOENDOSOVALUE)) IS NULL AND TRIM(UPPER(UAT.EMAILENVIOENDOSOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EMAILENVIOENDOSOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMPROPORIGINALINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMPROPORIGINALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMPROPORIGINALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMPROPORIGINALVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMPROPORIGINALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMPROPORIGINALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAPRIMAINPUT)) IS NULL AND TRIM(UPPER(UAT.MONEDAPRIMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONEDAPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAPRIMAVALUE)) IS NULL AND TRIM(UPPER(UAT.MONEDAPRIMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONEDAPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOPRIMAINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOPRIMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOPRIMAVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOPRIMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TASACOSTOEFECTIVOANUALINPUT)) IS NULL AND TRIM(UPPER(UAT.TASACOSTOEFECTIVOANUALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TASACOSTOEFECTIVOANUALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TASACOSTOEFECTIVOANUALVALUE)) IS NULL AND TRIM(UPPER(UAT.TASACOSTOEFECTIVOANUALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TASACOSTOEFECTIVOANUALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZAELECTRONICAENINPUT)) IS NULL AND TRIM(UPPER(UAT.POLIZAELECTRONICAENINPUT))="" THEN 1 ELSE 0 END) AS DIFF_POLIZAELECTRONICAENINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZAELECTRONICAENVALUE)) IS NULL AND TRIM(UPPER(UAT.POLIZAELECTRONICAENVALUE))="" THEN 1 ELSE 0 END) AS DIFF_POLIZAELECTRONICAENVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDCAMBIOPROPINPUT)) IS NULL AND TRIM(UPPER(UAT.INDCAMBIOPROPINPUT))="" THEN 1 ELSE 0 END) AS DIFF_INDCAMBIOPROPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDCAMBIOPROPVALUE)) IS NULL AND TRIM(UPPER(UAT.INDCAMBIOPROPVALUE))="" THEN 1 ELSE 0 END) AS DIFF_INDCAMBIOPROPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOAGENTEINICIALINPUT)) IS NULL AND TRIM(UPPER(UAT.CORREOAGENTEINICIALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CORREOAGENTEINICIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOAGENTEINICIALVALUE)) IS NULL AND TRIM(UPPER(UAT.CORREOAGENTEINICIALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CORREOAGENTEINICIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOAGENTEFINALINPUT)) IS NULL AND TRIM(UPPER(UAT.CORREOAGENTEFINALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CORREOAGENTEFINALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOAGENTEFINALVALUE)) IS NULL AND TRIM(UPPER(UAT.CORREOAGENTEFINALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CORREOAGENTEFINALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEDEFINITIVOINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMAGENTEDEFINITIVOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEDEFINITIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEDEFINITIVOVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMAGENTEDEFINITIVOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEDEFINITIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDAFINPUT)) IS NULL AND TRIM(UPPER(UAT.INDAFINPUT))="" THEN 1 ELSE 0 END) AS DIFF_INDAFINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDAFVALUE)) IS NULL AND TRIM(UPPER(UAT.INDAFVALUE))="" THEN 1 ELSE 0 END) AS DIFF_INDAFVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAVIDAINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMAVIDAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMAVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAVIDAVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMAVIDAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMAVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACOTINVINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMACOTINVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACOTINVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMACOTINVVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMACOTINVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMACOTINVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTEINICIALINPUT)) IS NULL AND TRIM(UPPER(UAT.CODAGENTEINICIALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODAGENTEINICIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTEINICIALVALUE)) IS NULL AND TRIM(UPPER(UAT.CODAGENTEINICIALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODAGENTEINICIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTEFINALINPUT)) IS NULL AND TRIM(UPPER(UAT.CODAGENTEFINALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CODAGENTEFINALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTEFINALVALUE)) IS NULL AND TRIM(UPPER(UAT.CODAGENTEFINALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CODAGENTEFINALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOANTINPUT)) IS NULL AND TRIM(UPPER(UAT.FRECUENCIAPAGOANTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOANTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOANTVALUE)) IS NULL AND TRIM(UPPER(UAT.FRECUENCIAPAGOANTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOANTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANVIDAANTINPUT)) IS NULL AND TRIM(UPPER(UAT.PLANVIDAANTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PLANVIDAANTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANVIDAANTVALUE)) IS NULL AND TRIM(UPPER(UAT.PLANVIDAANTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PLANVIDAANTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDDPSINPUT)) IS NULL AND TRIM(UPPER(UAT.INDDPSINPUT))="" THEN 1 ELSE 0 END) AS DIFF_INDDPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDDPSVALUE)) IS NULL AND TRIM(UPPER(UAT.INDDPSVALUE))="" THEN 1 ELSE 0 END) AS DIFF_INDDPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXIMAGENREASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAPROXIMAGENREASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAPROXIMAGENREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXIMAGENREASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAPROXIMAGENREASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAPROXIMAGENREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OBSENDINTINPUT)) IS NULL AND TRIM(UPPER(UAT.OBSENDINTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_OBSENDINTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OBSENDINTVALUE)) IS NULL AND TRIM(UPPER(UAT.OBSENDINTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_OBSENDINTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRECONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBRECONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRECONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRECONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBRECONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBRECONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MODOPAGOCONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.MODOPAGOCONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MODOPAGOCONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MODOPAGOCONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.MODOPAGOCONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MODOPAGOCONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONCONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.DIRECCIONCONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DIRECCIONCONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONCONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.DIRECCIONCONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DIRECCIONCONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOICONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.CORREOICONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CORREOICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOICONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.CORREOICONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CORREOICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIICONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.CORREOIICONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIICONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.CORREOIICONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIICONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.CORREOIIICONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIIICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIICONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.CORREOIIICONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CORREOIIICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOICONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.TELEFONOICONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOICONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.TELEFONOICONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIICONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.TELEFONOIICONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOIICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIICONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.TELEFONOIICONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOIICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIICONTRATANTEINPUT)) IS NULL AND TRIM(UPPER(UAT.TELEFONOIIICONTRATANTEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIICONTRATANTEVALUE)) IS NULL AND TRIM(UPPER(UAT.TELEFONOIIICONTRATANTEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENCONTINPUT)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONGENCONTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENCONTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENCONTVALUE)) IS NULL AND TRIM(UPPER(UAT.COMUNICACIONGENCONTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENCONTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFIRMAPROPINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFIRMAPROPINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFIRMAPROPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFIRMAPROPVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFIRMAPROPVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFIRMAPROPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROPINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAPROPINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAPROPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROPVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAPROPVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAPROPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CANALVENTAVIDAINPUT)) IS NULL AND TRIM(UPPER(UAT.CANALVENTAVIDAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_CANALVENTAVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CANALVENTAVIDAVALUE)) IS NULL AND TRIM(UPPER(UAT.CANALVENTAVIDAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_CANALVENTAVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXGENREASEGAUXINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAPROXGENREASEGAUXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAPROXGENREASEGAUXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXGENREASEGAUXVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAPROXGENREASEGAUXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAPROXGENREASEGAUXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDEXCLUSIONESVIDAINPUT)) IS NULL AND TRIM(UPPER(UAT.INDEXCLUSIONESVIDAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_INDEXCLUSIONESVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDEXCLUSIONESVIDAVALUE)) IS NULL AND TRIM(UPPER(UAT.INDEXCLUSIONESVIDAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_INDEXCLUSIONESVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAANTINPUT)) IS NULL AND TRIM(UPPER(UAT.MONEDAANTINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONEDAANTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAANTVALUE)) IS NULL AND TRIM(UPPER(UAT.MONEDAANTVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONEDAANTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOENDOSOPOLSOLINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPOENDOSOPOLSOLINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPOENDOSOPOLSOLINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOENDOSOPOLSOLVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPOENDOSOPOLSOLVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPOENDOSOPOLSOLVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RECARGOACEPTADOINPUT)) IS NULL AND TRIM(UPPER(UAT.RECARGOACEPTADOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RECARGOACEPTADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RECARGOACEPTADOVALUE)) IS NULL AND TRIM(UPPER(UAT.RECARGOACEPTADOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RECARGOACEPTADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ORIGENENDOSOINPUT)) IS NULL AND TRIM(UPPER(UAT.ORIGENENDOSOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_ORIGENENDOSOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ORIGENENDOSOVALUE)) IS NULL AND TRIM(UPPER(UAT.ORIGENENDOSOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_ORIGENENDOSOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPERSONAINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPOPERSONAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPOPERSONAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPERSONAVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPOPERSONAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPOPERSONAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAANUALTARIFAINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMAANUALTARIFAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMAANUALTARIFAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAANUALTARIFAVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMAANUALTARIFAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMAANUALTARIFAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.POLICYDURATIONINPUT)) IS NULL AND TRIM(UPPER(UAT.POLICYDURATIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_POLICYDURATIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.POLICYDURATIONVALUE)) IS NULL AND TRIM(UPPER(UAT.POLICYDURATIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_POLICYDURATIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAGENPRIMAINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAGENPRIMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAGENPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAGENPRIMAVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAGENPRIMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAGENPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COBFALLECINPUT)) IS NULL AND TRIM(UPPER(UAT.COBFALLECINPUT))="" THEN 1 ELSE 0 END) AS DIFF_COBFALLECINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COBFALLECVALUE)) IS NULL AND TRIM(UPPER(UAT.COBFALLECVALUE))="" THEN 1 ELSE 0 END) AS DIFF_COBFALLECVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COBEXONERACIONINPUT)) IS NULL AND TRIM(UPPER(UAT.COBEXONERACIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_COBEXONERACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COBEXONERACIONVALUE)) IS NULL AND TRIM(UPPER(UAT.COBEXONERACIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_COBEXONERACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RECARGOTOTALINPUT)) IS NULL AND TRIM(UPPER(UAT.RECARGOTOTALINPUT))="" THEN 1 ELSE 0 END) AS DIFF_RECARGOTOTALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RECARGOTOTALVALUE)) IS NULL AND TRIM(UPPER(UAT.RECARGOTOTALVALUE))="" THEN 1 ELSE 0 END) AS DIFF_RECARGOTOTALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXGENPRIMAVIDAINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAPROXGENPRIMAVIDAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAPROXGENPRIMAVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXGENPRIMAVIDAVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAPROXGENPRIMAVIDAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAPROXGENPRIMAVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OPCIONCUOTAEGINPUT)) IS NULL AND TRIM(UPPER(UAT.OPCIONCUOTAEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_OPCIONCUOTAEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OPCIONCUOTAEGVALUE)) IS NULL AND TRIM(UPPER(UAT.OPCIONCUOTAEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_OPCIONCUOTAEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDRECARGOINPUT)) IS NULL AND TRIM(UPPER(UAT.INDRECARGOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_INDRECARGOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDRECARGOVALUE)) IS NULL AND TRIM(UPPER(UAT.INDRECARGOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_INDRECARGOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.IGNORARVALIDACIONSAINPUT)) IS NULL AND TRIM(UPPER(UAT.IGNORARVALIDACIONSAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_IGNORARVALIDACIONSAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.IGNORARVALIDACIONSAVALUE)) IS NULL AND TRIM(UPPER(UAT.IGNORARVALIDACIONSAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_IGNORARVALIDACIONSAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHARECEPCIONGDCINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHARECEPCIONGDCINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHARECEPCIONGDCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHARECEPCIONGDCVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHARECEPCIONGDCVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHARECEPCIONGDCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHASALDACIONINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHASALDACIONINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHASALDACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHASALDACIONVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHASALDACIONVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHASALDACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHASALDACIONDESDEINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHASALDACIONDESDEINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHASALDACIONDESDEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHASALDACIONDESDEVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHASALDACIONDESDEVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHASALDACIONDESDEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OPCIONVIDAINPUT)) IS NULL AND TRIM(UPPER(UAT.OPCIONVIDAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_OPCIONVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OPCIONVIDAVALUE)) IS NULL AND TRIM(UPPER(UAT.OPCIONVIDAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_OPCIONVIDAVALUE
FROM iter-data-storage-pv-uat.acsele_data.POLPLANGARANTIZADO_raw UAT 
INNER JOIN interseguro-data.acsele_data.POLPLANGARANTIZADO_raw PROD 
ON UAT.PK = PROD.PK