SELECT SUM(CASE WHEN PROD.AUDITDATE!=UAT.AUDITDATE THEN 1 ELSE 0 END) AS DIFF_AUDITDATE
,SUM(CASE WHEN PROD.PK!=UAT.PK THEN 1 ELSE 0 END) AS DIFF_PK
,SUM(CASE WHEN PROD.STATIC!=UAT.STATIC THEN 1 ELSE 0 END) AS DIFF_STATIC
,SUM(CASE WHEN PROD.STATUS!=UAT.STATUS THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOINPUT))!=TRIM(UPPER(UAT.SEXOINPUT)) THEN 1 ELSE 0 END) AS DIFF_SEXOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SEXOVALUE))!=TRIM(UPPER(UAT.SEXOVALUE)) THEN 1 ELSE 0 END) AS DIFF_SEXOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ESTADOCIVILINPUT))!=TRIM(UPPER(UAT.ESTADOCIVILINPUT)) THEN 1 ELSE 0 END) AS DIFF_ESTADOCIVILINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ESTADOCIVILVALUE))!=TRIM(UPPER(UAT.ESTADOCIVILVALUE)) THEN 1 ELSE 0 END) AS DIFF_ESTADOCIVILVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAPRIMATRAMAINPUT))!=TRIM(UPPER(UAT.MONEDAPRIMATRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_MONEDAPRIMATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONEDAPRIMATRAMAVALUE))!=TRIM(UPPER(UAT.MONEDAPRIMATRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_MONEDAPRIMATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MOTIVOSOBREPRIMAINPUT))!=TRIM(UPPER(UAT.MOTIVOSOBREPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_MOTIVOSOBREPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MOTIVOSOBREPRIMAVALUE))!=TRIM(UPPER(UAT.MOTIVOSOBREPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_MOTIVOSOBREPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MOTIVOEXTRAPRIMAINPUT))!=TRIM(UPPER(UAT.MOTIVOEXTRAPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_MOTIVOEXTRAPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MOTIVOEXTRAPRIMAVALUE))!=TRIM(UPPER(UAT.MOTIVOEXTRAPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_MOTIVOEXTRAPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCTRAMAINPUT))!=TRIM(UPPER(UAT.TIPODOCTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_TIPODOCTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TIPODOCTRAMAVALUE))!=TRIM(UPPER(UAT.TIPODOCTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_TIPODOCTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCTRAMAINPUT))!=TRIM(UPPER(UAT.NUMERODOCTRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_NUMERODOCTRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NUMERODOCTRAMAVALUE))!=TRIM(UPPER(UAT.NUMERODOCTRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_NUMERODOCTRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREUNOASEGINPUT))!=TRIM(UPPER(UAT.NOMBREUNOASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBREUNOASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREUNOASEGVALUE))!=TRIM(UPPER(UAT.NOMBREUNOASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBREUNOASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREDOSASEGINPUT))!=TRIM(UPPER(UAT.NOMBREDOSASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_NOMBREDOSASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.NOMBREDOSASEGVALUE))!=TRIM(UPPER(UAT.NOMBREDOSASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_NOMBREDOSASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOPATERNOASEGINPUT))!=TRIM(UPPER(UAT.APELLIDOPATERNOASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_APELLIDOPATERNOASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOPATERNOASEGVALUE))!=TRIM(UPPER(UAT.APELLIDOPATERNOASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_APELLIDOPATERNOASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOMATERNOASEGINPUT))!=TRIM(UPPER(UAT.APELLIDOMATERNOASEGINPUT)) THEN 1 ELSE 0 END) AS DIFF_APELLIDOMATERNOASEGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.APELLIDOMATERNOASEGVALUE))!=TRIM(UPPER(UAT.APELLIDOMATERNOASEGVALUE)) THEN 1 ELSE 0 END) AS DIFF_APELLIDOMATERNOASEGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDDPSINPUT))!=TRIM(UPPER(UAT.INDDPSINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDDPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDDPSVALUE))!=TRIM(UPPER(UAT.INDDPSVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDDPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONTITINPUT))!=TRIM(UPPER(UAT.DIRECCIONTITINPUT)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONTITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DIRECCIONTITVALUE))!=TRIM(UPPER(UAT.DIRECCIONTITVALUE)) THEN 1 ELSE 0 END) AS DIFF_DIRECCIONTITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADINDDPSINPUT))!=TRIM(UPPER(UAT.EDADINDDPSINPUT)) THEN 1 ELSE 0 END) AS DIFF_EDADINDDPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EDADINDDPSVALUE))!=TRIM(UPPER(UAT.EDADINDDPSVALUE)) THEN 1 ELSE 0 END) AS DIFF_EDADINDDPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMADPSINPUT))!=TRIM(UPPER(UAT.SOBREPRIMADPSINPUT)) THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMADPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMADPSVALUE))!=TRIM(UPPER(UAT.SOBREPRIMADPSVALUE)) THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMADPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMADPSINPUT))!=TRIM(UPPER(UAT.EXTRAPRIMADPSINPUT)) THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMADPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMADPSVALUE))!=TRIM(UPPER(UAT.EXTRAPRIMADPSVALUE)) THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMADPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DEPARTAMENTOTITINPUT))!=TRIM(UPPER(UAT.DEPARTAMENTOTITINPUT)) THEN 1 ELSE 0 END) AS DIFF_DEPARTAMENTOTITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DEPARTAMENTOTITVALUE))!=TRIM(UPPER(UAT.DEPARTAMENTOTITVALUE)) THEN 1 ELSE 0 END) AS DIFF_DEPARTAMENTOTITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVINCIATITINPUT))!=TRIM(UPPER(UAT.PROVINCIATITINPUT)) THEN 1 ELSE 0 END) AS DIFF_PROVINCIATITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PROVINCIATITVALUE))!=TRIM(UPPER(UAT.PROVINCIATITVALUE)) THEN 1 ELSE 0 END) AS DIFF_PROVINCIATITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRITOTITINPUT))!=TRIM(UPPER(UAT.DISTRITOTITINPUT)) THEN 1 ELSE 0 END) AS DIFF_DISTRITOTITINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.DISTRITOTITVALUE))!=TRIM(UPPER(UAT.DISTRITOTITVALUE)) THEN 1 ELSE 0 END) AS DIFF_DISTRITOTITVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMATRAMAINPUT))!=TRIM(UPPER(UAT.SOBREPRIMATRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMATRAMAVALUE))!=TRIM(UPPER(UAT.SOBREPRIMATRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMATRAMAINPUT))!=TRIM(UPPER(UAT.EXTRAPRIMATRAMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMATRAMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMATRAMAVALUE))!=TRIM(UPPER(UAT.EXTRAPRIMATRAMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMATRAMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.VALORINPUT))!=TRIM(UPPER(UAT.VALORINPUT)) THEN 1 ELSE 0 END) AS DIFF_VALORINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.VALORVALUE))!=TRIM(UPPER(UAT.VALORVALUE)) THEN 1 ELSE 0 END) AS DIFF_VALORVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.VALORFECNACINPUT))!=TRIM(UPPER(UAT.VALORFECNACINPUT)) THEN 1 ELSE 0 END) AS DIFF_VALORFECNACINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.VALORFECNACVALUE))!=TRIM(UPPER(UAT.VALORFECNACVALUE)) THEN 1 ELSE 0 END) AS DIFF_VALORFECNACVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORDPSINPUT))!=TRIM(UPPER(UAT.INDICADORDPSINPUT)) THEN 1 ELSE 0 END) AS DIFF_INDICADORDPSINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.INDICADORDPSVALUE))!=TRIM(UPPER(UAT.INDICADORDPSVALUE)) THEN 1 ELSE 0 END) AS DIFF_INDICADORDPSVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.ASEGASIGNADOINPUT))!=TRIM(UPPER(UAT.ASEGASIGNADOINPUT)) THEN 1 ELSE 0 END) AS DIFF_ASEGASIGNADOINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.ASEGASIGNADOVALUE))!=TRIM(UPPER(UAT.ASEGASIGNADOVALUE)) THEN 1 ELSE 0 END) AS DIFF_ASEGASIGNADOVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECEXCSOBREPRIMAINPUT))!=TRIM(UPPER(UAT.FECEXCSOBREPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECEXCSOBREPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECEXCSOBREPRIMAVALUE))!=TRIM(UPPER(UAT.FECEXCSOBREPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECEXCSOBREPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECEXCEXTRAPRIMAINPUT))!=TRIM(UPPER(UAT.FECEXCEXTRAPRIMAINPUT)) THEN 1 ELSE 0 END) AS DIFF_FECEXCEXTRAPRIMAINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECEXCEXTRAPRIMAVALUE))!=TRIM(UPPER(UAT.FECEXCEXTRAPRIMAVALUE)) THEN 1 ELSE 0 END) AS DIFF_FECEXCEXTRAPRIMAVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMAORIGINPUT))!=TRIM(UPPER(UAT.SOBREPRIMAORIGINPUT)) THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMAORIGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SOBREPRIMAORIGVALUE))!=TRIM(UPPER(UAT.SOBREPRIMAORIGVALUE)) THEN 1 ELSE 0 END) AS DIFF_SOBREPRIMAORIGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMAORIGINPUT))!=TRIM(UPPER(UAT.EXTRAPRIMAORIGINPUT)) THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMAORIGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.EXTRAPRIMAORIGVALUE))!=TRIM(UPPER(UAT.EXTRAPRIMAORIGVALUE)) THEN 1 ELSE 0 END) AS DIFF_EXTRAPRIMAORIGVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONODESGINPUT))!=TRIM(UPPER(UAT.TELEFONODESGINPUT)) THEN 1 ELSE 0 END) AS DIFF_TELEFONODESGINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.TELEFONODESGVALUE))!=TRIM(UPPER(UAT.TELEFONODESGVALUE)) THEN 1 ELSE 0 END) AS DIFF_TELEFONODESGVALUE
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.OADESGPERSONALIND_raw UAT 
INNER JOIN interseguro-data.acsele_data.OADESGPERSONALIND_raw PROD 
ON UAT.PK = PROD.PK