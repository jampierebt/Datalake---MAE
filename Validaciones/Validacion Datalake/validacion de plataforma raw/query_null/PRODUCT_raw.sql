SELECT SUM(CASE WHEN TRIM(UPPER(PROD.DESCRIPTION)) IS NULL AND TRIM(UPPER(UAT.DESCRIPTION))="" THEN 1 ELSE 0 END) AS DIFF_DESCRIPTION
FROM iter-data-storage-pv-uat.acsele_data.PRODUCT_raw UAT 
INNER JOIN interseguro-data.acsele_data.PRODUCT_raw PROD 
ON UAT.PRODUCTID = PROD.PRODUCTID