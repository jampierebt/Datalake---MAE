SELECT SUM(CASE WHEN TRIM(UPPER(PROD.coveragedescription)) IS NULL AND TRIM(UPPER(UAT.coveragedescription))="" THEN 1 ELSE 0 END) AS DIFF_coveragedescription
,SUM(CASE WHEN TRIM(UPPER(PROD.beneficiary)) IS NULL AND TRIM(UPPER(UAT.beneficiary))="" THEN 1 ELSE 0 END) AS DIFF_beneficiary
,SUM(CASE WHEN TRIM(UPPER(PROD.doneby)) IS NULL AND TRIM(UPPER(UAT.doneby))="" THEN 1 ELSE 0 END) AS DIFF_doneby
,SUM(CASE WHEN TRIM(UPPER(PROD.deductiblereference)) IS NULL AND TRIM(UPPER(UAT.deductiblereference))="" THEN 1 ELSE 0 END) AS DIFF_deductiblereference
FROM iter-data-storage-pv-uat.acsele_data.CLAIMPAYMENT_raw UAT 
INNER JOIN interseguro-data.acsele_data.CLAIMPAYMENT_raw PROD 
ON UAT.CLAIMPAYMENTID = PROD.CLAIMPAYMENTID