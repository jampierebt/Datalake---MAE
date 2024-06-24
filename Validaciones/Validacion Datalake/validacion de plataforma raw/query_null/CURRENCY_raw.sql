SELECT SUM(CASE WHEN TRIM(UPPER(PROD.description)) IS NULL AND TRIM(UPPER(UAT.description))="" THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN TRIM(UPPER(PROD.ccy_isocode)) IS NULL AND TRIM(UPPER(UAT.ccy_isocode))="" THEN 1 ELSE 0 END) AS DIFF_ccy_isocode
,SUM(CASE WHEN TRIM(UPPER(PROD.ccy_symbol)) IS NULL AND TRIM(UPPER(UAT.ccy_symbol))="" THEN 1 ELSE 0 END) AS DIFF_ccy_symbol
FROM iter-data-storage-pv-uat.acsele_data.CURRENCY_raw UAT 
INNER JOIN interseguro-data.acsele_data.CURRENCY_raw PROD 
ON UAT.CURRENCYID = PROD.CURRENCYID