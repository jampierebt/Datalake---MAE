SELECT SUM(CASE WHEN PROD.PK!=UAT.PK THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN PROD.STATIC!=UAT.STATIC THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN PROD.STATUS!=UAT.STATUS THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGINPUT))!=TRIM(UPPER(UAT.NIVELAGRUPREASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NIVELAGRUPREASEGVALUE))!=TRIM(UPPER(UAT.NIVELAGRUPREASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_NIVELAGRUPREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SUMAASEGURADAINPUT))!=TRIM(UPPER(UAT.SUMAASEGURADAINPUT)) THEN 1 ELSE 0 END) AS DIFF_SUMAASEGURADAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SUMAASEGURADAVALUE))!=TRIM(UPPER(UAT.SUMAASEGURADAVALUE)) THEN 1 ELSE 0 END) AS DIFF_SUMAASEGURADAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCUMENTOINPUT))!=TRIM(UPPER(UAT.TIPODOCUMENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPODOCUMENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCUMENTOVALUE))!=TRIM(UPPER(UAT.TIPODOCUMENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPODOCUMENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCUMENTOINPUT))!=TRIM(UPPER(UAT.NUMERODOCUMENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMERODOCUMENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCUMENTOVALUE))!=TRIM(UPPER(UAT.NUMERODOCUMENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMERODOCUMENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRODUCTOSVIDAINPUT))!=TRIM(UPPER(UAT.PRODUCTOSVIDAINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRODUCTOSVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRODUCTOSVIDAVALUE))!=TRIM(UPPER(UAT.PRODUCTOSVIDAVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRODUCTOSVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANVIDAINPUT))!=TRIM(UPPER(UAT.PLANVIDAINPUT)) THEN 1 ELSE 0 END) AS DIFF_PLANVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANVIDAVALUE))!=TRIM(UPPER(UAT.PLANVIDAVALUE)) THEN 1 ELSE 0 END) AS DIFF_PLANVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODESCUENTOINPUT))!=TRIM(UPPER(UAT.TIPODESCUENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPODESCUENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODESCUENTOVALUE))!=TRIM(UPPER(UAT.TIPODESCUENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPODESCUENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TCEAINPUT))!=TRIM(UPPER(UAT.TCEAINPUT)) THEN 1 ELSE 0 END) AS DIFF_TCEAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TCEAVALUE))!=TRIM(UPPER(UAT.TCEAVALUE)) THEN 1 ELSE 0 END) AS DIFF_TCEAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHACOTIZACIONINPUT))!=TRIM(UPPER(UAT.FECHACOTIZACIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHACOTIZACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHACOTIZACIONVALUE))!=TRIM(UPPER(UAT.FECHACOTIZACIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHACOTIZACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FLAGVALVIADEPAGOINPUT))!=TRIM(UPPER(UAT.FLAGVALVIADEPAGOINPUT)) THEN 1 ELSE 0 END) AS DIFF_FLAGVALVIADEPAGOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FLAGVALVIADEPAGOVALUE))!=TRIM(UPPER(UAT.FLAGVALVIADEPAGOVALUE)) THEN 1 ELSE 0 END) AS DIFF_FLAGVALVIADEPAGOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONPOLIZAINPUT))!=TRIM(UPPER(UAT.COMUNICACIONPOLIZAINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONPOLIZAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONPOLIZAVALUE))!=TRIM(UPPER(UAT.COMUNICACIONPOLIZAVALUE)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONPOLIZAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZAELECTRONICAINPUT))!=TRIM(UPPER(UAT.POLIZAELECTRONICAINPUT)) THEN 1 ELSE 0 END) AS DIFF_POLIZAELECTRONICAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZAELECTRONICAVALUE))!=TRIM(UPPER(UAT.POLIZAELECTRONICAVALUE)) THEN 1 ELSE 0 END) AS DIFF_POLIZAELECTRONICAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONENDOSOINPUT))!=TRIM(UPPER(UAT.COMUNICACIONENDOSOINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONENDOSOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONENDOSOVALUE))!=TRIM(UPPER(UAT.COMUNICACIONENDOSOVALUE)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONENDOSOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FLAGNVACOTIZACIONINPUT))!=TRIM(UPPER(UAT.FLAGNVACOTIZACIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_FLAGNVACOTIZACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FLAGNVACOTIZACIONVALUE))!=TRIM(UPPER(UAT.FLAGNVACOTIZACIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_FLAGNVACOTIZACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPAGOINPUT))!=TRIM(UPPER(UAT.TIPOPAGOINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOPAGOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPAGOVALUE))!=TRIM(UPPER(UAT.TIPOPAGOVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPOPAGOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOPERACIONINPUT))!=TRIM(UPPER(UAT.NUMOPERACIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMOPERACIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMOPERACIONVALUE))!=TRIM(UPPER(UAT.NUMOPERACIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMOPERACIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDATRANSACCIONINPUT))!=TRIM(UPPER(UAT.MONEDATRANSACCIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONEDATRANSACCIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDATRANSACCIONVALUE))!=TRIM(UPPER(UAT.MONEDATRANSACCIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_MONEDATRANSACCIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOTRANSACCIONINPUT))!=TRIM(UPPER(UAT.MONTOTRANSACCIONINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONTOTRANSACCIONINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOTRANSACCIONVALUE))!=TRIM(UPPER(UAT.MONTOTRANSACCIONVALUE)) THEN 1 ELSE 0 END) AS DIFF_MONTOTRANSACCIONVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEINICIALINPUT))!=TRIM(UPPER(UAT.NOMAGENTEINICIALINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEINICIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEINICIALVALUE))!=TRIM(UPPER(UAT.NOMAGENTEINICIALVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEINICIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEFINALINPUT))!=TRIM(UPPER(UAT.NOMAGENTEFINALINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEFINALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEFINALVALUE))!=TRIM(UPPER(UAT.NOMAGENTEFINALVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEFINALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.AGENCIAINICIALINPUT))!=TRIM(UPPER(UAT.AGENCIAINICIALINPUT)) THEN 1 ELSE 0 END) AS DIFF_AGENCIAINICIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.AGENCIAINICIALVALUE))!=TRIM(UPPER(UAT.AGENCIAINICIALVALUE)) THEN 1 ELSE 0 END) AS DIFF_AGENCIAINICIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.AGENCIAFINALINPUT))!=TRIM(UPPER(UAT.AGENCIAFINALINPUT)) THEN 1 ELSE 0 END) AS DIFF_AGENCIAFINALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.AGENCIAFINALVALUE))!=TRIM(UPPER(UAT.AGENCIAFINALVALUE)) THEN 1 ELSE 0 END) AS DIFF_AGENCIAFINALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILENVIOENDOSOINPUT))!=TRIM(UPPER(UAT.EMAILENVIOENDOSOINPUT)) THEN 1 ELSE 0 END) AS DIFF_EMAILENVIOENDOSOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EMAILENVIOENDOSOVALUE))!=TRIM(UPPER(UAT.EMAILENVIOENDOSOVALUE)) THEN 1 ELSE 0 END) AS DIFF_EMAILENVIOENDOSOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMPROPORIGINALINPUT))!=TRIM(UPPER(UAT.NUMPROPORIGINALINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMPROPORIGINALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMPROPORIGINALVALUE))!=TRIM(UPPER(UAT.NUMPROPORIGINALVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMPROPORIGINALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAPRIMAINPUT))!=TRIM(UPPER(UAT.MONEDAPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONEDAPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAPRIMAVALUE))!=TRIM(UPPER(UAT.MONEDAPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_MONEDAPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOPRIMAINPUT))!=TRIM(UPPER(UAT.MONTOPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONTOPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOPRIMAVALUE))!=TRIM(UPPER(UAT.MONTOPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_MONTOPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TASACOSTOEFECTIVOANUALINPUT))!=TRIM(UPPER(UAT.TASACOSTOEFECTIVOANUALINPUT)) THEN 1 ELSE 0 END) AS DIFF_TASACOSTOEFECTIVOANUALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TASACOSTOEFECTIVOANUALVALUE))!=TRIM(UPPER(UAT.TASACOSTOEFECTIVOANUALVALUE)) THEN 1 ELSE 0 END) AS DIFF_TASACOSTOEFECTIVOANUALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZAELECTRONICAENINPUT))!=TRIM(UPPER(UAT.POLIZAELECTRONICAENINPUT)) THEN 1 ELSE 0 END) AS DIFF_POLIZAELECTRONICAENINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZAELECTRONICAENVALUE))!=TRIM(UPPER(UAT.POLIZAELECTRONICAENVALUE)) THEN 1 ELSE 0 END) AS DIFF_POLIZAELECTRONICAENVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDCAMBIOPROPINPUT))!=TRIM(UPPER(UAT.INDCAMBIOPROPINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDCAMBIOPROPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDCAMBIOPROPVALUE))!=TRIM(UPPER(UAT.INDCAMBIOPROPVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDCAMBIOPROPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOAGENTEINICIALINPUT))!=TRIM(UPPER(UAT.CORREOAGENTEINICIALINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOAGENTEINICIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOAGENTEINICIALVALUE))!=TRIM(UPPER(UAT.CORREOAGENTEINICIALVALUE)) THEN 1 ELSE 0 END) AS DIFF_CORREOAGENTEINICIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOAGENTEFINALINPUT))!=TRIM(UPPER(UAT.CORREOAGENTEFINALINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOAGENTEFINALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOAGENTEFINALVALUE))!=TRIM(UPPER(UAT.CORREOAGENTEFINALVALUE)) THEN 1 ELSE 0 END) AS DIFF_CORREOAGENTEFINALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEDEFINITIVOINPUT))!=TRIM(UPPER(UAT.NOMAGENTEDEFINITIVOINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEDEFINITIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMAGENTEDEFINITIVOVALUE))!=TRIM(UPPER(UAT.NOMAGENTEDEFINITIVOVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMAGENTEDEFINITIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOAGENTEDEFINITIVOINPUT))!=TRIM(UPPER(UAT.CORREOAGENTEDEFINITIVOINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOAGENTEDEFINITIVOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOAGENTEDEFINITIVOVALUE))!=TRIM(UPPER(UAT.CORREOAGENTEDEFINITIVOVALUE)) THEN 1 ELSE 0 END) AS DIFF_CORREOAGENTEDEFINITIVOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDAFINPUT))!=TRIM(UPPER(UAT.INDAFINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDAFINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDAFVALUE))!=TRIM(UPPER(UAT.INDAFVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDAFVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAVIDAINPUT))!=TRIM(UPPER(UAT.PRIMAVIDAINPUT)) THEN 1 ELSE 0 END) AS DIFF_PRIMAVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAVIDAVALUE))!=TRIM(UPPER(UAT.PRIMAVIDAVALUE)) THEN 1 ELSE 0 END) AS DIFF_PRIMAVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTEINICIALINPUT))!=TRIM(UPPER(UAT.CODAGENTEINICIALINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODAGENTEINICIALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTEINICIALVALUE))!=TRIM(UPPER(UAT.CODAGENTEINICIALVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODAGENTEINICIALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTEFINALINPUT))!=TRIM(UPPER(UAT.CODAGENTEFINALINPUT)) THEN 1 ELSE 0 END) AS DIFF_CODAGENTEFINALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CODAGENTEFINALVALUE))!=TRIM(UPPER(UAT.CODAGENTEFINALVALUE)) THEN 1 ELSE 0 END) AS DIFF_CODAGENTEFINALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOANTINPUT))!=TRIM(UPPER(UAT.FRECUENCIAPAGOANTINPUT)) THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOANTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOANTVALUE))!=TRIM(UPPER(UAT.FRECUENCIAPAGOANTVALUE)) THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOANTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANVIDAANTINPUT))!=TRIM(UPPER(UAT.PLANVIDAANTINPUT)) THEN 1 ELSE 0 END) AS DIFF_PLANVIDAANTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PLANVIDAANTVALUE))!=TRIM(UPPER(UAT.PLANVIDAANTVALUE)) THEN 1 ELSE 0 END) AS DIFF_PLANVIDAANTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDDPSINPUT))!=TRIM(UPPER(UAT.INDDPSINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDDPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDDPSVALUE))!=TRIM(UPPER(UAT.INDDPSVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDDPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXIMAGENREASEGINPUT))!=TRIM(UPPER(UAT.FECHAPROXIMAGENREASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAPROXIMAGENREASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXIMAGENREASEGVALUE))!=TRIM(UPPER(UAT.FECHAPROXIMAGENREASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAPROXIMAGENREASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.OBSENDINTINPUT))!=TRIM(UPPER(UAT.OBSENDINTINPUT)) THEN 1 ELSE 0 END) AS DIFF_OBSENDINTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.OBSENDINTVALUE))!=TRIM(UPPER(UAT.OBSENDINTVALUE)) THEN 1 ELSE 0 END) AS DIFF_OBSENDINTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRECONTRATANTEINPUT))!=TRIM(UPPER(UAT.NOMBRECONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBRECONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBRECONTRATANTEVALUE))!=TRIM(UPPER(UAT.NOMBRECONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBRECONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MODOPAGOCONTRATANTEINPUT))!=TRIM(UPPER(UAT.MODOPAGOCONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_MODOPAGOCONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MODOPAGOCONTRATANTEVALUE))!=TRIM(UPPER(UAT.MODOPAGOCONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_MODOPAGOCONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONCONTRATANTEINPUT))!=TRIM(UPPER(UAT.DIRECCIONCONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONCONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONCONTRATANTEVALUE))!=TRIM(UPPER(UAT.DIRECCIONCONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONCONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOICONTRATANTEINPUT))!=TRIM(UPPER(UAT.CORREOICONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOICONTRATANTEVALUE))!=TRIM(UPPER(UAT.CORREOICONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_CORREOICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIICONTRATANTEINPUT))!=TRIM(UPPER(UAT.CORREOIICONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOIICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIICONTRATANTEVALUE))!=TRIM(UPPER(UAT.CORREOIICONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_CORREOIICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIICONTRATANTEINPUT))!=TRIM(UPPER(UAT.CORREOIIICONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_CORREOIIICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CORREOIIICONTRATANTEVALUE))!=TRIM(UPPER(UAT.CORREOIIICONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_CORREOIIICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOICONTRATANTEINPUT))!=TRIM(UPPER(UAT.TELEFONOICONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOICONTRATANTEVALUE))!=TRIM(UPPER(UAT.TELEFONOICONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIICONTRATANTEINPUT))!=TRIM(UPPER(UAT.TELEFONOIICONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIICONTRATANTEVALUE))!=TRIM(UPPER(UAT.TELEFONOIICONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIICONTRATANTEINPUT))!=TRIM(UPPER(UAT.TELEFONOIIICONTRATANTEINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIICONTRATANTEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONOIIICONTRATANTEVALUE))!=TRIM(UPPER(UAT.TELEFONOIIICONTRATANTEVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONOIIICONTRATANTEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENCONTINPUT))!=TRIM(UPPER(UAT.COMUNICACIONGENCONTINPUT)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENCONTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.COMUNICACIONGENCONTVALUE))!=TRIM(UPPER(UAT.COMUNICACIONGENCONTVALUE)) THEN 1 ELSE 0 END) AS DIFF_COMUNICACIONGENCONTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFIRMAPROPINPUT))!=TRIM(UPPER(UAT.FECHAFIRMAPROPINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAFIRMAPROPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFIRMAPROPVALUE))!=TRIM(UPPER(UAT.FECHAFIRMAPROPVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAFIRMAPROPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROPINPUT))!=TRIM(UPPER(UAT.FECHAPROPINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAPROPINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROPVALUE))!=TRIM(UPPER(UAT.FECHAPROPVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAPROPVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.CANALVENTAVIDAINPUT))!=TRIM(UPPER(UAT.CANALVENTAVIDAINPUT)) THEN 1 ELSE 0 END) AS DIFF_CANALVENTAVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.CANALVENTAVIDAVALUE))!=TRIM(UPPER(UAT.CANALVENTAVIDAVALUE)) THEN 1 ELSE 0 END) AS DIFF_CANALVENTAVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXGENREASEGAUXINPUT))!=TRIM(UPPER(UAT.FECHAPROXGENREASEGAUXINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAPROXGENREASEGAUXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXGENREASEGAUXVALUE))!=TRIM(UPPER(UAT.FECHAPROXGENREASEGAUXVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAPROXGENREASEGAUXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDEXCLUSIONESVIDAINPUT))!=TRIM(UPPER(UAT.INDEXCLUSIONESVIDAINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDEXCLUSIONESVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDEXCLUSIONESVIDAVALUE))!=TRIM(UPPER(UAT.INDEXCLUSIONESVIDAVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDEXCLUSIONESVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAANTINPUT))!=TRIM(UPPER(UAT.MONEDAANTINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONEDAANTINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAANTVALUE))!=TRIM(UPPER(UAT.MONEDAANTVALUE)) THEN 1 ELSE 0 END) AS DIFF_MONEDAANTVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOENDOSOPOLSOLINPUT))!=TRIM(UPPER(UAT.TIPOENDOSOPOLSOLINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOENDOSOPOLSOLINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOENDOSOPOLSOLVALUE))!=TRIM(UPPER(UAT.TIPOENDOSOPOLSOLVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPOENDOSOPOLSOLVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RECARGOACEPTADOINPUT))!=TRIM(UPPER(UAT.RECARGOACEPTADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_RECARGOACEPTADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RECARGOACEPTADOVALUE))!=TRIM(UPPER(UAT.RECARGOACEPTADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_RECARGOACEPTADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APLICADESCUENTOINPUT))!=TRIM(UPPER(UAT.APLICADESCUENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_APLICADESCUENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APLICADESCUENTOVALUE))!=TRIM(UPPER(UAT.APLICADESCUENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_APLICADESCUENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPERSONAINPUT))!=TRIM(UPPER(UAT.TIPOPERSONAINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPOPERSONAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPOPERSONAVALUE))!=TRIM(UPPER(UAT.TIPOPERSONAVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPOPERSONAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXGENPRIMAVIDAINPUT))!=TRIM(UPPER(UAT.FECHAPROXGENPRIMAVIDAINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAPROXGENPRIMAVIDAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAPROXGENPRIMAVIDAVALUE))!=TRIM(UPPER(UAT.FECHAPROXGENPRIMAVIDAVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAPROXGENPRIMAVIDAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZACESIONADAVEINPUT))!=TRIM(UPPER(UAT.POLIZACESIONADAVEINPUT)) THEN 1 ELSE 0 END) AS DIFF_POLIZACESIONADAVEINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.POLIZACESIONADAVEVALUE))!=TRIM(UPPER(UAT.POLIZACESIONADAVEVALUE)) THEN 1 ELSE 0 END) AS DIFF_POLIZACESIONADAVEVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.IGNORARVALIDACIONSAINPUT))!=TRIM(UPPER(UAT.IGNORARVALIDACIONSAINPUT)) THEN 1 ELSE 0 END) AS DIFF_IGNORARVALIDACIONSAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.IGNORARVALIDACIONSAVALUE))!=TRIM(UPPER(UAT.IGNORARVALIDACIONSAVALUE)) THEN 1 ELSE 0 END) AS DIFF_IGNORARVALIDACIONSAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHARECEPCIONGDCINPUT))!=TRIM(UPPER(UAT.FECHARECEPCIONGDCINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHARECEPCIONGDCINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHARECEPCIONGDCVALUE))!=TRIM(UPPER(UAT.FECHARECEPCIONGDCVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHARECEPCIONGDCVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOPAGOMINIMOINPUT))!=TRIM(UPPER(UAT.PERIODOPAGOMINIMOINPUT)) THEN 1 ELSE 0 END) AS DIFF_PERIODOPAGOMINIMOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOPAGOMINIMOVALUE))!=TRIM(UPPER(UAT.PERIODOPAGOMINIMOVALUE)) THEN 1 ELSE 0 END) AS DIFF_PERIODOPAGOMINIMOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.VIGPOSTPERIODPAGOPRIMAINPUT))!=TRIM(UPPER(UAT.VIGPOSTPERIODPAGOPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_VIGPOSTPERIODPAGOPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.VIGPOSTPERIODPAGOPRIMAVALUE))!=TRIM(UPPER(UAT.VIGPOSTPERIODPAGOPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_VIGPOSTPERIODPAGOPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOPAGODIFERIDOSINPUT))!=TRIM(UPPER(UAT.PERIODOPAGODIFERIDOSINPUT)) THEN 1 ELSE 0 END) AS DIFF_PERIODOPAGODIFERIDOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PERIODOPAGODIFERIDOSVALUE))!=TRIM(UPPER(UAT.PERIODOPAGODIFERIDOSVALUE)) THEN 1 ELSE 0 END) AS DIFF_PERIODOPAGODIFERIDOSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOORIGENINPUT))!=TRIM(UPPER(UAT.FRECUENCIAPAGOORIGENINPUT)) THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOORIGENINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FRECUENCIAPAGOORIGENVALUE))!=TRIM(UPPER(UAT.FRECUENCIAPAGOORIGENVALUE)) THEN 1 ELSE 0 END) AS DIFF_FRECUENCIAPAGOORIGENVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAEFECTIVADIFERIMIENTOINPUT))!=TRIM(UPPER(UAT.FECHAEFECTIVADIFERIMIENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAEFECTIVADIFERIMIENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAEFECTIVADIFERIMIENTOVALUE))!=TRIM(UPPER(UAT.FECHAEFECTIVADIFERIMIENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAEFECTIVADIFERIMIENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINIDIFERIMIENTOINPUT))!=TRIM(UPPER(UAT.FECHAINIDIFERIMIENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAINIDIFERIMIENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINIDIFERIMIENTOVALUE))!=TRIM(UPPER(UAT.FECHAINIDIFERIMIENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAINIDIFERIMIENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINDIFERIMIENTOINPUT))!=TRIM(UPPER(UAT.FECHAFINDIFERIMIENTOINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECHAFINDIFERIMIENTOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINDIFERIMIENTOVALUE))!=TRIM(UPPER(UAT.FECHAFINDIFERIMIENTOVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECHAFINDIFERIMIENTOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MESESDIFERIDOSTOTALINPUT))!=TRIM(UPPER(UAT.MESESDIFERIDOSTOTALINPUT)) THEN 1 ELSE 0 END) AS DIFF_MESESDIFERIDOSTOTALINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MESESDIFERIDOSTOTALVALUE))!=TRIM(UPPER(UAT.MESESDIFERIDOSTOTALVALUE)) THEN 1 ELSE 0 END) AS DIFF_MESESDIFERIDOSTOTALVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.HISTORIALDIFERIMIENTOSINPUT))!=TRIM(UPPER(UAT.HISTORIALDIFERIMIENTOSINPUT)) THEN 1 ELSE 0 END) AS DIFF_HISTORIALDIFERIMIENTOSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.HISTORIALDIFERIMIENTOSVALUE))!=TRIM(UPPER(UAT.HISTORIALDIFERIMIENTOSVALUE)) THEN 1 ELSE 0 END) AS DIFF_HISTORIALDIFERIMIENTOSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.RESPUESTAAPIENDOSODIFINPUT))!=TRIM(UPPER(UAT.RESPUESTAAPIENDOSODIFINPUT)) THEN 1 ELSE 0 END) AS DIFF_RESPUESTAAPIENDOSODIFINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.RESPUESTAAPIENDOSODIFVALUE))!=TRIM(UPPER(UAT.RESPUESTAAPIENDOSODIFVALUE)) THEN 1 ELSE 0 END) AS DIFF_RESPUESTAAPIENDOSODIFVALUE
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO