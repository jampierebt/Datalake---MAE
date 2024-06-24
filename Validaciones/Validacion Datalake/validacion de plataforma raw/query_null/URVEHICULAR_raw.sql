SELECT SUM(CASE WHEN TRIM(UPPER(PROD.SUMAASEGURADAVEHICULARINPUT)) IS NULL AND TRIM(UPPER(UAT.SUMAASEGURADAVEHICULARINPUT))="" THEN 1 ELSE 0 END) AS DIFF_SUMAASEGURADAVEHICULARINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.SUMAASEGURADAVEHICULARVALUE)) IS NULL AND TRIM(UPPER(UAT.SUMAASEGURADAVEHICULARVALUE))="" THEN 1 ELSE 0 END) AS DIFF_SUMAASEGURADAVEHICULARVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMATOTALVEHICULARINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMATOTALVEHICULARINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMATOTALVEHICULARINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMATOTALVEHICULARVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMATOTALVEHICULARVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMATOTALVEHICULARVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAVEHICULARINPUT)) IS NULL AND TRIM(UPPER(UAT.PRIMAVEHICULARINPUT))="" THEN 1 ELSE 0 END) AS DIFF_PRIMAVEHICULARINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.PRIMAVEHICULARVALUE)) IS NULL AND TRIM(UPPER(UAT.PRIMAVEHICULARVALUE))="" THEN 1 ELSE 0 END) AS DIFF_PRIMAVEHICULARVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAIINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAIVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAIIINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAIIVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAIVINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAIVVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAVINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAVVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAVIINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAVIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAVIVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAVIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAVIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAVIIINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAVIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAVIIVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAVIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAVIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAVIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAVIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAVIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAVIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAVIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAIXINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAIXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAIXVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAIXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAIXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAXINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAXVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOIVINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOIVVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOVINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOVVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOVIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOVIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOVIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOVIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOVIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOVIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOVIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOVIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOVIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOVIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOVIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOVIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOVIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOVIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOVIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOIXINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOIXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOIXVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOIXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOIXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOXINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOXVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINIVINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINIVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINIVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINIVVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINIVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINIVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINVINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINVINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINVINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINVVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINVVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINVVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINVIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINVIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINVIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINVIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINVIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINVIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINVIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINVIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINVIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINVIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINVIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINVIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINVIIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINVIIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINVIIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINVIIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINVIIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINVIIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINIXINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINIXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINIXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINIXVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINIXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINIXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINXINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINXINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINXINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINXVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINXVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINXVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAXIINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAXIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAXIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAXIVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAXIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAXIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAXIIINPUT)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAXIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAXIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.MONTOCUOTAXIIVALUE)) IS NULL AND TRIM(UPPER(UAT.MONTOCUOTAXIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_MONTOCUOTAXIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOXIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOXIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOXIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOXIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOXIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOXIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOXIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOXIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOXIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAINICIOXIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAINICIOXIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAINICIOXIIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINXIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINXIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINXIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINXIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINXIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINXIVALUE
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINXIIINPUT)) IS NULL AND TRIM(UPPER(UAT.FECHAFINXIIINPUT))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINXIIINPUT
,SUM(CASE WHEN TRIM(UPPER(PROD.FECHAFINXIIVALUE)) IS NULL AND TRIM(UPPER(UAT.FECHAFINXIIVALUE))="" THEN 1 ELSE 0 END) AS DIFF_FECHAFINXIIVALUE
FROM iter-data-storage-pv-uat.acsele_data.URVEHICULAR_raw UAT 
INNER JOIN interseguro-data.acsele_data.URVEHICULAR_raw PROD 
ON UAT.PK = PROD.PK