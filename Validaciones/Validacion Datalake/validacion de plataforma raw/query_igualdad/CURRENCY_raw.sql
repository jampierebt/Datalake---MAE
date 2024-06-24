SELECT SUM(CASE WHEN PROD.currencyid!=UAT.currencyid THEN 1 ELSE 0 END) AS DIFF_currencyid
,SUM(CASE WHEN TRIM(UPPER(PROD.description))!=TRIM(UPPER(UAT.description)) THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN TRIM(UPPER(PROD.ccy_isocode))!=TRIM(UPPER(UAT.ccy_isocode)) THEN 1 ELSE 0 END) AS DIFF_ccy_isocode
,SUM(CASE WHEN PROD.ccy_default!=UAT.ccy_default THEN 1 ELSE 0 END) AS DIFF_ccy_default
,SUM(CASE WHEN TRIM(UPPER(PROD.ccy_symbol))!=TRIM(UPPER(UAT.ccy_symbol)) THEN 1 ELSE 0 END) AS DIFF_ccy_symbol
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.CURRENCY_raw UAT 
INNER JOIN interseguro-data.acsele_data.CURRENCY_raw PROD 
ON UAT.CURRENCYID = PROD.CURRENCYID