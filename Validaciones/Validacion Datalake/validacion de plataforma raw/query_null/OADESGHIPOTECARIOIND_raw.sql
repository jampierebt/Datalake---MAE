SELECT SUM(CASE WHEN TRIM(UPPER(PROD.SEXOINPUT)) IS NULL AND TRIM(UPPER(UAT.SEXOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SEXOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOVALUE)) IS NULL AND TRIM(UPPER(UAT.SEXOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SEXOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ESTADOCIVILINPUT)) IS NULL AND TRIM(UPPER(UAT.ESTADOCIVILINPUT))="" THEN 1 ELSE 0 END) AS DIFF_ESTADOCIVILINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ESTADOCIVILVALUE)) IS NULL AND TRIM(UPPER(UAT.ESTADOCIVILVALUE))="" THEN 1 ELSE 0 END) AS DIFF_ESTADOCIVILVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAPRIMATRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.MONEDAPRIMATRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONEDAPRIMATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAPRIMATRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.MONEDAPRIMATRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONEDAPRIMATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MOTIVOSOBREPRIMAINPUT)) IS NULL AND TRIM(UPPER(UAT.MOTIVOSOBREPRIMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MOTIVOSOBREPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MOTIVOSOBREPRIMAVALUE)) IS NULL AND TRIM(UPPER(UAT.MOTIVOSOBREPRIMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MOTIVOSOBREPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MOTIVOEXTRAPRIMAINPUT)) IS NULL AND TRIM(UPPER(UAT.MOTIVOEXTRAPRIMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MOTIVOEXTRAPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MOTIVOEXTRAPRIMAVALUE)) IS NULL AND TRIM(UPPER(UAT.MOTIVOEXTRAPRIMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MOTIVOEXTRAPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.TIPODOCTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TIPODOCTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.TIPODOCTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TIPODOCTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCTRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.NUMERODOCTRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NUMERODOCTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCTRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.NUMERODOCTRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NUMERODOCTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREUNOASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBREUNOASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREUNOASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREUNOASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBREUNOASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREUNOASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREDOSASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.NOMBREDOSASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREDOSASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREDOSASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.NOMBREDOSASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_NOMBREDOSASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOPATERNOASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.APELLIDOPATERNOASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDOPATERNOASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOPATERNOASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.APELLIDOPATERNOASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDOPATERNOASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOMATERNOASEGINPUT)) IS NULL AND TRIM(UPPER(UAT.APELLIDOMATERNOASEGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDOMATERNOASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOMATERNOASEGVALUE)) IS NULL AND TRIM(UPPER(UAT.APELLIDOMATERNOASEGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_APELLIDOMATERNOASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDDPSINPUT)) IS NULL AND TRIM(UPPER(UAT.INDDPSINPUT))="" THEN 1 ELSE 0 END) AS DIFF_INDDPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDDPSVALUE)) IS NULL AND TRIM(UPPER(UAT.INDDPSVALUE))="" THEN 1 ELSE 0 END) AS DIFF_INDDPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONTITINPUT)) IS NULL AND TRIM(UPPER(UAT.DIRECCIONTITINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DIRECCIONTITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONTITVALUE)) IS NULL AND TRIM(UPPER(UAT.DIRECCIONTITVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DIRECCIONTITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADINDDPSINPUT)) IS NULL AND TRIM(UPPER(UAT.EDADINDDPSINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EDADINDDPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADINDDPSVALUE)) IS NULL AND TRIM(UPPER(UAT.EDADINDDPSVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EDADINDDPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMADPSINPUT)) IS NULL AND TRIM(UPPER(UAT.SOBREPRIMADPSINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMADPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMADPSVALUE)) IS NULL AND TRIM(UPPER(UAT.SOBREPRIMADPSVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMADPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMADPSINPUT)) IS NULL AND TRIM(UPPER(UAT.EXTRAPRIMADPSINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMADPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMADPSVALUE)) IS NULL AND TRIM(UPPER(UAT.EXTRAPRIMADPSVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMADPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DEPARTAMENTOTITINPUT)) IS NULL AND TRIM(UPPER(UAT.DEPARTAMENTOTITINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DEPARTAMENTOTITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DEPARTAMENTOTITVALUE)) IS NULL AND TRIM(UPPER(UAT.DEPARTAMENTOTITVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DEPARTAMENTOTITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVINCIATITINPUT)) IS NULL AND TRIM(UPPER(UAT.PROVINCIATITINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PROVINCIATITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVINCIATITVALUE)) IS NULL AND TRIM(UPPER(UAT.PROVINCIATITVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PROVINCIATITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRITOTITINPUT)) IS NULL AND TRIM(UPPER(UAT.DISTRITOTITINPUT))="" THEN 1 ELSE 0 END) AS DIFF_DISTRITOTITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRITOTITVALUE)) IS NULL AND TRIM(UPPER(UAT.DISTRITOTITVALUE))="" THEN 1 ELSE 0 END) AS DIFF_DISTRITOTITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMATRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.SOBREPRIMATRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMATRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.SOBREPRIMATRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMATRAMAINPUT)) IS NULL AND TRIM(UPPER(UAT.EXTRAPRIMATRAMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMATRAMAVALUE)) IS NULL AND TRIM(UPPER(UAT.EXTRAPRIMATRAMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.VALORINPUT)) IS NULL AND TRIM(UPPER(UAT.VALORINPUT))="" THEN 1 ELSE 0 END) AS DIFF_VALORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.VALORVALUE)) IS NULL AND TRIM(UPPER(UAT.VALORVALUE))="" THEN 1 ELSE 0 END) AS DIFF_VALORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.VALORFECNACINPUT)) IS NULL AND TRIM(UPPER(UAT.VALORFECNACINPUT))="" THEN 1 ELSE 0 END) AS DIFF_VALORFECNACINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.VALORFECNACVALUE)) IS NULL AND TRIM(UPPER(UAT.VALORFECNACVALUE))="" THEN 1 ELSE 0 END) AS DIFF_VALORFECNACVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORDPSINPUT)) IS NULL AND TRIM(UPPER(UAT.INDICADORDPSINPUT))="" THEN 1 ELSE 0 END) AS DIFF_INDICADORDPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORDPSVALUE)) IS NULL AND TRIM(UPPER(UAT.INDICADORDPSVALUE))="" THEN 1 ELSE 0 END) AS DIFF_INDICADORDPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ASEGASIGNADOINPUT)) IS NULL AND TRIM(UPPER(UAT.ASEGASIGNADOINPUT))="" THEN 1 ELSE 0 END) AS DIFF_ASEGASIGNADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ASEGASIGNADOVALUE)) IS NULL AND TRIM(UPPER(UAT.ASEGASIGNADOVALUE))="" THEN 1 ELSE 0 END) AS DIFF_ASEGASIGNADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECEXCSOBREPRIMAINPUT)) IS NULL AND TRIM(UPPER(UAT.FECEXCSOBREPRIMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECEXCSOBREPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECEXCSOBREPRIMAVALUE)) IS NULL AND TRIM(UPPER(UAT.FECEXCSOBREPRIMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECEXCSOBREPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECEXCEXTRAPRIMAINPUT)) IS NULL AND TRIM(UPPER(UAT.FECEXCEXTRAPRIMAINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECEXCEXTRAPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECEXCEXTRAPRIMAVALUE)) IS NULL AND TRIM(UPPER(UAT.FECEXCEXTRAPRIMAVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECEXCEXTRAPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMAORIGINPUT)) IS NULL AND TRIM(UPPER(UAT.SOBREPRIMAORIGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMAORIGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMAORIGVALUE)) IS NULL AND TRIM(UPPER(UAT.SOBREPRIMAORIGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMAORIGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMAORIGINPUT)) IS NULL AND TRIM(UPPER(UAT.EXTRAPRIMAORIGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMAORIGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMAORIGVALUE)) IS NULL AND TRIM(UPPER(UAT.EXTRAPRIMAORIGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMAORIGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONODESGINPUT)) IS NULL AND TRIM(UPPER(UAT.TELEFONODESGINPUT))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONODESGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONODESGVALUE)) IS NULL AND TRIM(UPPER(UAT.TELEFONODESGVALUE))="" THEN 1 ELSE 0 END) AS DIFF_TELEFONODESGVALUE
FROM iter-data-storage-pv-uat.acsele_data.OADESGHIPOTECARIOIND_raw UAT 
INNER JOIN interseguro-data.acsele_data.OADESGHIPOTECARIOIND_raw PROD 
ON UAT.PK = PROD.PK