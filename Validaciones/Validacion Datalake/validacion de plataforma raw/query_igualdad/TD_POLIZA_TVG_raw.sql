SELECT SUM(CASE WHEN TRIM(UPPER(PROD.numero_poliza))!=TRIM(UPPER(UAT.numero_poliza)) THEN 1 ELSE 0 END) AS DIFF_numero_poliza
,SUM(CASE WHEN PROD.numero_operacion!=UAT.numero_operacion THEN 1 ELSE 0 END) AS DIFF_numero_operacion
,SUM(CASE WHEN PROD.anio!=UAT.anio THEN 1 ELSE 0 END) AS DIFF_anio
,SUM(CASE WHEN PROD.mes!=UAT.mes THEN 1 ELSE 0 END) AS DIFF_mes
,SUM(CASE WHEN PROD.rescate!=UAT.rescate THEN 1 ELSE 0 END) AS DIFF_rescate
,SUM(CASE WHEN PROD.saldo!=UAT.saldo THEN 1 ELSE 0 END) AS DIFF_saldo
,SUM(CASE WHEN PROD.suma_asegurada!=UAT.suma_asegurada THEN 1 ELSE 0 END) AS DIFF_suma_asegurada
,SUM(CASE WHEN PROD.anios_prorrogados!=UAT.anios_prorrogados THEN 1 ELSE 0 END) AS DIFF_anios_prorrogados
,SUM(CASE WHEN PROD.meses_prorrogados!=UAT.meses_prorrogados THEN 1 ELSE 0 END) AS DIFF_meses_prorrogados
,SUM(CASE WHEN PROD.beneficio_supervivencia!=UAT.beneficio_supervivencia THEN 1 ELSE 0 END) AS DIFF_beneficio_supervivencia
FROM iter-data-storage-pv-uat.acsele_data.TD_POLIZA_TVG_raw UAT 
INNER JOIN interseguro-data.acsele_data.TD_POLIZA_TVG_raw PROD 
ON UAT.ANIO = PROD.ANIO 
AND UAT.MES = PROD.MES 
AND UAT.NUMERO_OPERACION = PROD.NUMERO_OPERACION 
AND UAT.NUMERO_POLIZA = PROD.NUMERO_POLIZA