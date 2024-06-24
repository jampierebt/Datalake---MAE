SELECT SUM(CASE WHEN TRIM(UPPER(PROD.productid)) IS NULL AND TRIM(UPPER(UAT.productid))="" THEN 1 ELSE 0 END) AS DIFF_productid
,SUM(CASE WHEN TRIM(UPPER(PROD.description)) IS NULL AND TRIM(UPPER(UAT.description))="" THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN TRIM(UPPER(PROD.claimnumber)) IS NULL AND TRIM(UPPER(UAT.claimnumber))="" THEN 1 ELSE 0 END) AS DIFF_claimnumber
,SUM(CASE WHEN TRIM(UPPER(PROD.usc_login)) IS NULL AND TRIM(UPPER(UAT.usc_login))="" THEN 1 ELSE 0 END) AS DIFF_usc_login
FROM iter-data-storage-pv-uat.acsele_data.CLAIM_raw UAT 
INNER JOIN interseguro-data.acsele_data.CLAIM_raw PROD 
ON UAT.CLAIMID = PROD.CLAIMID