SELECT SUM(CASE WHEN PROD.claimreserveadjustid!=UAT.claimreserveadjustid THEN 1 ELSE 0 END) AS DIFF_claimreserveadjustid
,SUM(CASE WHEN PROD.claimreserveid!=UAT.claimreserveid THEN 1 ELSE 0 END) AS DIFF_claimreserveid
,SUM(CASE WHEN PROD.dateclaimreserveadjustid!=UAT.dateclaimreserveadjustid THEN 1 ELSE 0 END) AS DIFF_dateclaimreserveadjustid
,SUM(CASE WHEN TRIM(UPPER(PROD.description))!=TRIM(UPPER(UAT.description)) THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN TRIM(UPPER(PROD.reason))!=TRIM(UPPER(UAT.reason)) THEN 1 ELSE 0 END) AS DIFF_reason
,SUM(CASE WHEN TRIM(UPPER(PROD.type))!=TRIM(UPPER(UAT.type)) THEN 1 ELSE 0 END) AS DIFF_type
,SUM(CASE WHEN PROD.cra_status!=UAT.cra_status THEN 1 ELSE 0 END) AS DIFF_cra_status
,SUM(CASE WHEN PROD.amount!=UAT.amount THEN 1 ELSE 0 END) AS DIFF_amount
,SUM(CASE WHEN TRIM(UPPER(PROD.doneby))!=TRIM(UPPER(UAT.doneby)) THEN 1 ELSE 0 END) AS DIFF_doneby
,SUM(CASE WHEN PROD.ccy_id!=UAT.ccy_id THEN 1 ELSE 0 END) AS DIFF_ccy_id
,SUM(CASE WHEN PROD.cra_exchangeamount!=UAT.cra_exchangeamount THEN 1 ELSE 0 END) AS DIFF_cra_exchangeamount
,SUM(CASE WHEN PROD.cra_originadjust!=UAT.cra_originadjust THEN 1 ELSE 0 END) AS DIFF_cra_originadjust
,SUM(CASE WHEN PROD.endorsementletterid!=UAT.endorsementletterid THEN 1 ELSE 0 END) AS DIFF_endorsementletterid
,SUM(CASE WHEN PROD.item!=UAT.item THEN 1 ELSE 0 END) AS DIFF_item
,SUM(CASE WHEN TRIM(UPPER(PROD.type_abbr))!=TRIM(UPPER(UAT.type_abbr)) THEN 1 ELSE 0 END) AS DIFF_type_abbr
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.CLAIMRESERVEADJUST_raw UAT 
INNER JOIN interseguro-data.acsele_data.CLAIMRESERVEADJUST_raw PROD 
ON UAT.CLAIMRESERVEADJUSTID = PROD.CLAIMRESERVEADJUSTID