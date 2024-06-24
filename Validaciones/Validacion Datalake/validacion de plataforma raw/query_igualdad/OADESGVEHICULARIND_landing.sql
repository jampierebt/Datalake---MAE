SELECT SUM(CASE WHEN PROD.auditdate!=UAT.auditdate THEN 1 ELSE 0 END) AS DIFF_auditdate
,SUM(CASE WHEN PROD.pk!=UAT.pk THEN 1 ELSE 0 END) AS DIFF_pk
,SUM(CASE WHEN TRIM(UPPER(PROD.static))!=TRIM(UPPER(UAT.static)) THEN 1 ELSE 0 END) AS DIFF_static
,SUM(CASE WHEN PROD.status!=UAT.status THEN 1 ELSE 0 END) AS DIFF_status
,SUM(CASE WHEN TRIM(UPPER(PROD.sexoinput))!=TRIM(UPPER(UAT.sexoinput)) THEN 1 ELSE 0 END) AS DIFF_sexoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.sexovalue))!=TRIM(UPPER(UAT.sexovalue)) THEN 1 ELSE 0 END) AS DIFF_sexovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.estadocivilinput))!=TRIM(UPPER(UAT.estadocivilinput)) THEN 1 ELSE 0 END) AS DIFF_estadocivilinput
,SUM(CASE WHEN TRIM(UPPER(PROD.estadocivilvalue))!=TRIM(UPPER(UAT.estadocivilvalue)) THEN 1 ELSE 0 END) AS DIFF_estadocivilvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.monedaprimatramainput))!=TRIM(UPPER(UAT.monedaprimatramainput)) THEN 1 ELSE 0 END) AS DIFF_monedaprimatramainput
,SUM(CASE WHEN TRIM(UPPER(PROD.monedaprimatramavalue))!=TRIM(UPPER(UAT.monedaprimatramavalue)) THEN 1 ELSE 0 END) AS DIFF_monedaprimatramavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.motivosobreprimainput))!=TRIM(UPPER(UAT.motivosobreprimainput)) THEN 1 ELSE 0 END) AS DIFF_motivosobreprimainput
,SUM(CASE WHEN TRIM(UPPER(PROD.motivosobreprimavalue))!=TRIM(UPPER(UAT.motivosobreprimavalue)) THEN 1 ELSE 0 END) AS DIFF_motivosobreprimavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.motivoextraprimainput))!=TRIM(UPPER(UAT.motivoextraprimainput)) THEN 1 ELSE 0 END) AS DIFF_motivoextraprimainput
,SUM(CASE WHEN TRIM(UPPER(PROD.motivoextraprimavalue))!=TRIM(UPPER(UAT.motivoextraprimavalue)) THEN 1 ELSE 0 END) AS DIFF_motivoextraprimavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.tipodoctramainput))!=TRIM(UPPER(UAT.tipodoctramainput)) THEN 1 ELSE 0 END) AS DIFF_tipodoctramainput
,SUM(CASE WHEN TRIM(UPPER(PROD.tipodoctramavalue))!=TRIM(UPPER(UAT.tipodoctramavalue)) THEN 1 ELSE 0 END) AS DIFF_tipodoctramavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.numerodoctramainput))!=TRIM(UPPER(UAT.numerodoctramainput)) THEN 1 ELSE 0 END) AS DIFF_numerodoctramainput
,SUM(CASE WHEN TRIM(UPPER(PROD.numerodoctramavalue))!=TRIM(UPPER(UAT.numerodoctramavalue)) THEN 1 ELSE 0 END) AS DIFF_numerodoctramavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.nombreunoaseginput))!=TRIM(UPPER(UAT.nombreunoaseginput)) THEN 1 ELSE 0 END) AS DIFF_nombreunoaseginput
,SUM(CASE WHEN TRIM(UPPER(PROD.nombreunoasegvalue))!=TRIM(UPPER(UAT.nombreunoasegvalue)) THEN 1 ELSE 0 END) AS DIFF_nombreunoasegvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.nombredosaseginput))!=TRIM(UPPER(UAT.nombredosaseginput)) THEN 1 ELSE 0 END) AS DIFF_nombredosaseginput
,SUM(CASE WHEN TRIM(UPPER(PROD.nombredosasegvalue))!=TRIM(UPPER(UAT.nombredosasegvalue)) THEN 1 ELSE 0 END) AS DIFF_nombredosasegvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidopaternoaseginput))!=TRIM(UPPER(UAT.apellidopaternoaseginput)) THEN 1 ELSE 0 END) AS DIFF_apellidopaternoaseginput
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidopaternoasegvalue))!=TRIM(UPPER(UAT.apellidopaternoasegvalue)) THEN 1 ELSE 0 END) AS DIFF_apellidopaternoasegvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidomaternoaseginput))!=TRIM(UPPER(UAT.apellidomaternoaseginput)) THEN 1 ELSE 0 END) AS DIFF_apellidomaternoaseginput
,SUM(CASE WHEN TRIM(UPPER(PROD.apellidomaternoasegvalue))!=TRIM(UPPER(UAT.apellidomaternoasegvalue)) THEN 1 ELSE 0 END) AS DIFF_apellidomaternoasegvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.inddpsinput))!=TRIM(UPPER(UAT.inddpsinput)) THEN 1 ELSE 0 END) AS DIFF_inddpsinput
,SUM(CASE WHEN TRIM(UPPER(PROD.inddpsvalue))!=TRIM(UPPER(UAT.inddpsvalue)) THEN 1 ELSE 0 END) AS DIFF_inddpsvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.direcciontitinput))!=TRIM(UPPER(UAT.direcciontitinput)) THEN 1 ELSE 0 END) AS DIFF_direcciontitinput
,SUM(CASE WHEN TRIM(UPPER(PROD.direcciontitvalue))!=TRIM(UPPER(UAT.direcciontitvalue)) THEN 1 ELSE 0 END) AS DIFF_direcciontitvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.edadinddpsinput))!=TRIM(UPPER(UAT.edadinddpsinput)) THEN 1 ELSE 0 END) AS DIFF_edadinddpsinput
,SUM(CASE WHEN TRIM(UPPER(PROD.edadinddpsvalue))!=TRIM(UPPER(UAT.edadinddpsvalue)) THEN 1 ELSE 0 END) AS DIFF_edadinddpsvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.sobreprimadpsinput))!=TRIM(UPPER(UAT.sobreprimadpsinput)) THEN 1 ELSE 0 END) AS DIFF_sobreprimadpsinput
,SUM(CASE WHEN TRIM(UPPER(PROD.sobreprimadpsvalue))!=TRIM(UPPER(UAT.sobreprimadpsvalue)) THEN 1 ELSE 0 END) AS DIFF_sobreprimadpsvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.extraprimadpsinput))!=TRIM(UPPER(UAT.extraprimadpsinput)) THEN 1 ELSE 0 END) AS DIFF_extraprimadpsinput
,SUM(CASE WHEN TRIM(UPPER(PROD.extraprimadpsvalue))!=TRIM(UPPER(UAT.extraprimadpsvalue)) THEN 1 ELSE 0 END) AS DIFF_extraprimadpsvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.departamentotitinput))!=TRIM(UPPER(UAT.departamentotitinput)) THEN 1 ELSE 0 END) AS DIFF_departamentotitinput
,SUM(CASE WHEN TRIM(UPPER(PROD.departamentotitvalue))!=TRIM(UPPER(UAT.departamentotitvalue)) THEN 1 ELSE 0 END) AS DIFF_departamentotitvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.provinciatitinput))!=TRIM(UPPER(UAT.provinciatitinput)) THEN 1 ELSE 0 END) AS DIFF_provinciatitinput
,SUM(CASE WHEN TRIM(UPPER(PROD.provinciatitvalue))!=TRIM(UPPER(UAT.provinciatitvalue)) THEN 1 ELSE 0 END) AS DIFF_provinciatitvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.distritotitinput))!=TRIM(UPPER(UAT.distritotitinput)) THEN 1 ELSE 0 END) AS DIFF_distritotitinput
,SUM(CASE WHEN TRIM(UPPER(PROD.distritotitvalue))!=TRIM(UPPER(UAT.distritotitvalue)) THEN 1 ELSE 0 END) AS DIFF_distritotitvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.sobreprimatramainput))!=TRIM(UPPER(UAT.sobreprimatramainput)) THEN 1 ELSE 0 END) AS DIFF_sobreprimatramainput
,SUM(CASE WHEN TRIM(UPPER(PROD.sobreprimatramavalue))!=TRIM(UPPER(UAT.sobreprimatramavalue)) THEN 1 ELSE 0 END) AS DIFF_sobreprimatramavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.extraprimatramainput))!=TRIM(UPPER(UAT.extraprimatramainput)) THEN 1 ELSE 0 END) AS DIFF_extraprimatramainput
,SUM(CASE WHEN TRIM(UPPER(PROD.extraprimatramavalue))!=TRIM(UPPER(UAT.extraprimatramavalue)) THEN 1 ELSE 0 END) AS DIFF_extraprimatramavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.valorinput))!=TRIM(UPPER(UAT.valorinput)) THEN 1 ELSE 0 END) AS DIFF_valorinput
,SUM(CASE WHEN TRIM(UPPER(PROD.valorvalue))!=TRIM(UPPER(UAT.valorvalue)) THEN 1 ELSE 0 END) AS DIFF_valorvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.valorfecnacinput))!=TRIM(UPPER(UAT.valorfecnacinput)) THEN 1 ELSE 0 END) AS DIFF_valorfecnacinput
,SUM(CASE WHEN TRIM(UPPER(PROD.valorfecnacvalue))!=TRIM(UPPER(UAT.valorfecnacvalue)) THEN 1 ELSE 0 END) AS DIFF_valorfecnacvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.indicadordpsinput))!=TRIM(UPPER(UAT.indicadordpsinput)) THEN 1 ELSE 0 END) AS DIFF_indicadordpsinput
,SUM(CASE WHEN TRIM(UPPER(PROD.indicadordpsvalue))!=TRIM(UPPER(UAT.indicadordpsvalue)) THEN 1 ELSE 0 END) AS DIFF_indicadordpsvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.asegasignadoinput))!=TRIM(UPPER(UAT.asegasignadoinput)) THEN 1 ELSE 0 END) AS DIFF_asegasignadoinput
,SUM(CASE WHEN TRIM(UPPER(PROD.asegasignadovalue))!=TRIM(UPPER(UAT.asegasignadovalue)) THEN 1 ELSE 0 END) AS DIFF_asegasignadovalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fecexcsobreprimainput))!=TRIM(UPPER(UAT.fecexcsobreprimainput)) THEN 1 ELSE 0 END) AS DIFF_fecexcsobreprimainput
,SUM(CASE WHEN TRIM(UPPER(PROD.fecexcsobreprimavalue))!=TRIM(UPPER(UAT.fecexcsobreprimavalue)) THEN 1 ELSE 0 END) AS DIFF_fecexcsobreprimavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.fecexcextraprimainput))!=TRIM(UPPER(UAT.fecexcextraprimainput)) THEN 1 ELSE 0 END) AS DIFF_fecexcextraprimainput
,SUM(CASE WHEN TRIM(UPPER(PROD.fecexcextraprimavalue))!=TRIM(UPPER(UAT.fecexcextraprimavalue)) THEN 1 ELSE 0 END) AS DIFF_fecexcextraprimavalue
,SUM(CASE WHEN TRIM(UPPER(PROD.sobreprimaoriginput))!=TRIM(UPPER(UAT.sobreprimaoriginput)) THEN 1 ELSE 0 END) AS DIFF_sobreprimaoriginput
,SUM(CASE WHEN TRIM(UPPER(PROD.sobreprimaorigvalue))!=TRIM(UPPER(UAT.sobreprimaorigvalue)) THEN 1 ELSE 0 END) AS DIFF_sobreprimaorigvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.extraprimaoriginput))!=TRIM(UPPER(UAT.extraprimaoriginput)) THEN 1 ELSE 0 END) AS DIFF_extraprimaoriginput
,SUM(CASE WHEN TRIM(UPPER(PROD.extraprimaorigvalue))!=TRIM(UPPER(UAT.extraprimaorigvalue)) THEN 1 ELSE 0 END) AS DIFF_extraprimaorigvalue
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonodesginput))!=TRIM(UPPER(UAT.telefonodesginput)) THEN 1 ELSE 0 END) AS DIFF_telefonodesginput
,SUM(CASE WHEN TRIM(UPPER(PROD.telefonodesgvalue))!=TRIM(UPPER(UAT.telefonodesgvalue)) THEN 1 ELSE 0 END) AS DIFF_telefonodesgvalue