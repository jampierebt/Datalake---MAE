SELECT SUM(CASE WHEN PROD.claimpaymentid!=UAT.claimpaymentid THEN 1 ELSE 0 END) AS DIFF_claimpaymentid
,SUM(CASE WHEN PROD.claimid!=UAT.claimid THEN 1 ELSE 0 END) AS DIFF_claimid
,SUM(CASE WHEN PROD.claimpaymentdate!=UAT.claimpaymentdate THEN 1 ELSE 0 END) AS DIFF_claimpaymentdate
,SUM(CASE WHEN TRIM(UPPER(PROD.coveragedescription))!=TRIM(UPPER(UAT.coveragedescription)) THEN 1 ELSE 0 END) AS DIFF_coveragedescription
,SUM(CASE WHEN PROD.reservetype!=UAT.reservetype THEN 1 ELSE 0 END) AS DIFF_reservetype
,SUM(CASE WHEN PROD.thirdpartyid!=UAT.thirdpartyid THEN 1 ELSE 0 END) AS DIFF_thirdpartyid
,SUM(CASE WHEN TRIM(UPPER(PROD.beneficiary))!=TRIM(UPPER(UAT.beneficiary)) THEN 1 ELSE 0 END) AS DIFF_beneficiary
,SUM(CASE WHEN PROD.state!=UAT.state THEN 1 ELSE 0 END) AS DIFF_state
,SUM(CASE WHEN PROD.amount!=UAT.amount THEN 1 ELSE 0 END) AS DIFF_amount
,SUM(CASE WHEN PROD.paidamount!=UAT.paidamount THEN 1 ELSE 0 END) AS DIFF_paidamount
,SUM(CASE WHEN TRIM(UPPER(PROD.doneby))!=TRIM(UPPER(UAT.doneby)) THEN 1 ELSE 0 END) AS DIFF_doneby
,SUM(CASE WHEN PROD.reservecurrencyid!=UAT.reservecurrencyid THEN 1 ELSE 0 END) AS DIFF_reservecurrencyid
,SUM(CASE WHEN PROD.paidcurrencyid!=UAT.paidcurrencyid THEN 1 ELSE 0 END) AS DIFF_paidcurrencyid
,SUM(CASE WHEN PROD.exchangerate!=UAT.exchangerate THEN 1 ELSE 0 END) AS DIFF_exchangerate
,SUM(CASE WHEN PROD.deductiblepercentage!=UAT.deductiblepercentage THEN 1 ELSE 0 END) AS DIFF_deductiblepercentage
,SUM(CASE WHEN TRIM(UPPER(PROD.deductiblereference))!=TRIM(UPPER(UAT.deductiblereference)) THEN 1 ELSE 0 END) AS DIFF_deductiblereference
,SUM(CASE WHEN PROD.isdeductibleapplied!=UAT.isdeductibleapplied THEN 1 ELSE 0 END) AS DIFF_isdeductibleapplied
,SUM(CASE WHEN PROD.deductibleamount!=UAT.deductibleamount THEN 1 ELSE 0 END) AS DIFF_deductibleamount
,SUM(CASE WHEN PROD.ispenaltyapplied!=UAT.ispenaltyapplied THEN 1 ELSE 0 END) AS DIFF_ispenaltyapplied
,SUM(CASE WHEN PROD.penaltypercentage!=UAT.penaltypercentage THEN 1 ELSE 0 END) AS DIFF_penaltypercentage
,SUM(CASE WHEN PROD.isrefundapplied!=UAT.isrefundapplied THEN 1 ELSE 0 END) AS DIFF_isrefundapplied
,SUM(CASE WHEN PROD.refundpercentage!=UAT.refundpercentage THEN 1 ELSE 0 END) AS DIFF_refundpercentage
,SUM(CASE WHEN PROD.istotalpayment!=UAT.istotalpayment THEN 1 ELSE 0 END) AS DIFF_istotalpayment
,SUM(CASE WHEN PROD.cpy_franchiseamount!=UAT.cpy_franchiseamount THEN 1 ELSE 0 END) AS DIFF_cpy_franchiseamount
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.CLAIMPAYMENT_raw UAT 
INNER JOIN interseguro-data.acsele_data.CLAIMPAYMENT_raw PROD 
ON UAT.CLAIMPAYMENTID = PROD.CLAIMPAYMENTID