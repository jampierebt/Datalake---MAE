SELECT SUM(CASE WHEN PROD.currencyoriginid!=UAT.currencyoriginid THEN 1 ELSE 0 END) AS DIFF_currencyoriginid
,SUM(CASE WHEN PROD.currencytargetid!=UAT.currencytargetid THEN 1 ELSE 0 END) AS DIFF_currencytargetid
,SUM(CASE WHEN PROD.daterate!=UAT.daterate THEN 1 ELSE 0 END) AS DIFF_daterate
,SUM(CASE WHEN TRIM(UPPER(PROD.rate))!=TRIM(UPPER(UAT.rate)) THEN 1 ELSE 0 END) AS DIFF_rate