SELECT SUM(CASE WHEN TRIM(UPPER(PROD.productid))!=TRIM(UPPER(UAT.productid)) THEN 1 ELSE 0 END) AS DIFF_productid
,SUM(CASE WHEN TRIM(UPPER(PROD.description))!=TRIM(UPPER(UAT.description)) THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN PROD.claimid!=UAT.claimid THEN 1 ELSE 0 END) AS DIFF_claimid
,SUM(CASE WHEN PROD.claimdate!=UAT.claimdate THEN 1 ELSE 0 END) AS DIFF_claimdate
,SUM(CASE WHEN PROD.policyid!=UAT.policyid THEN 1 ELSE 0 END) AS DIFF_policyid
,SUM(CASE WHEN PROD.policydate!=UAT.policydate THEN 1 ELSE 0 END) AS DIFF_policydate
,SUM(CASE WHEN PROD.totalamount!=UAT.totalamount THEN 1 ELSE 0 END) AS DIFF_totalamount
,SUM(CASE WHEN PROD.state!=UAT.state THEN 1 ELSE 0 END) AS DIFF_state
,SUM(CASE WHEN PROD.eventclaimid!=UAT.eventclaimid THEN 1 ELSE 0 END) AS DIFF_eventclaimid
,SUM(CASE WHEN TRIM(UPPER(PROD.claimnumber))!=TRIM(UPPER(UAT.claimnumber)) THEN 1 ELSE 0 END) AS DIFF_claimnumber
,SUM(CASE WHEN PROD.claimnotificationid!=UAT.claimnotificationid THEN 1 ELSE 0 END) AS DIFF_claimnotificationid
,SUM(CASE WHEN PROD.excessclaimeventid!=UAT.excessclaimeventid THEN 1 ELSE 0 END) AS DIFF_excessclaimeventid
,SUM(CASE WHEN PROD.substate!=UAT.substate THEN 1 ELSE 0 END) AS DIFF_substate
,SUM(CASE WHEN PROD.bof_id!=UAT.bof_id THEN 1 ELSE 0 END) AS DIFF_bof_id
,SUM(CASE WHEN PROD.operationpk!=UAT.operationpk THEN 1 ELSE 0 END) AS DIFF_operationpk
,SUM(CASE WHEN TRIM(UPPER(PROD.usc_login))!=TRIM(UPPER(UAT.usc_login)) THEN 1 ELSE 0 END) AS DIFF_usc_login
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.CLAIM_raw UAT 
INNER JOIN interseguro-data.acsele_data.CLAIM_raw PROD 
ON UAT.CLAIMID = PROD.CLAIMID