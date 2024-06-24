SELECT SUM(CASE WHEN PROD.claimdate!=UAT.claimdate THEN 1 ELSE 0 END) AS DIFF_claimdate
,SUM(CASE WHEN PROD.claimnormalreservedid!=UAT.claimnormalreservedid THEN 1 ELSE 0 END) AS DIFF_claimnormalreservedid
,SUM(CASE WHEN PROD.evaluatedcoverageid!=UAT.evaluatedcoverageid THEN 1 ELSE 0 END) AS DIFF_evaluatedcoverageid
,SUM(CASE WHEN PROD.claiminsuranceobjectid!=UAT.claiminsuranceobjectid THEN 1 ELSE 0 END) AS DIFF_claiminsuranceobjectid
,SUM(CASE WHEN PROD.currencyid!=UAT.currencyid THEN 1 ELSE 0 END) AS DIFF_currencyid
,SUM(CASE WHEN PROD.dateclaimnormalreserve!=UAT.dateclaimnormalreserve THEN 1 ELSE 0 END) AS DIFF_dateclaimnormalreserve
,SUM(CASE WHEN TRIM(UPPER(PROD.description))!=TRIM(UPPER(UAT.description)) THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN TRIM(UPPER(PROD.deductiblereference))!=TRIM(UPPER(UAT.deductiblereference)) THEN 1 ELSE 0 END) AS DIFF_deductiblereference
,SUM(CASE WHEN TRIM(UPPER(PROD.legacytype))!=TRIM(UPPER(UAT.legacytype)) THEN 1 ELSE 0 END) AS DIFF_legacytype
,SUM(CASE WHEN PROD.isdeductibleapplied!=UAT.isdeductibleapplied THEN 1 ELSE 0 END) AS DIFF_isdeductibleapplied
,SUM(CASE WHEN PROD.deductibleamount!=UAT.deductibleamount THEN 1 ELSE 0 END) AS DIFF_deductibleamount
,SUM(CASE WHEN PROD.isrefundapplied!=UAT.isrefundapplied THEN 1 ELSE 0 END) AS DIFF_isrefundapplied
,SUM(CASE WHEN PROD.refundpercentage!=UAT.refundpercentage THEN 1 ELSE 0 END) AS DIFF_refundpercentage
,SUM(CASE WHEN PROD.reservelimit!=UAT.reservelimit THEN 1 ELSE 0 END) AS DIFF_reservelimit
,SUM(CASE WHEN PROD.deductiblepercentage!=UAT.deductiblepercentage THEN 1 ELSE 0 END) AS DIFF_deductiblepercentage
,SUM(CASE WHEN PROD.ispenaltyapplied!=UAT.ispenaltyapplied THEN 1 ELSE 0 END) AS DIFF_ispenaltyapplied
,SUM(CASE WHEN PROD.penaltypercentage!=UAT.penaltypercentage THEN 1 ELSE 0 END) AS DIFF_penaltypercentage
,SUM(CASE WHEN PROD.restituted!=UAT.restituted THEN 1 ELSE 0 END) AS DIFF_restituted
,SUM(CASE WHEN TRIM(UPPER(PROD.doneby))!=TRIM(UPPER(UAT.doneby)) THEN 1 ELSE 0 END) AS DIFF_doneby
,SUM(CASE WHEN PROD.cnr_maxpaymentamount!=UAT.cnr_maxpaymentamount THEN 1 ELSE 0 END) AS DIFF_cnr_maxpaymentamount
,SUM(CASE WHEN PROD.cnr_paymentnumber!=UAT.cnr_paymentnumber THEN 1 ELSE 0 END) AS DIFF_cnr_paymentnumber
,SUM(CASE WHEN PROD.cnr_paymentperiod!=UAT.cnr_paymentperiod THEN 1 ELSE 0 END) AS DIFF_cnr_paymentperiod
,SUM(CASE WHEN PROD.cnr_status!=UAT.cnr_status THEN 1 ELSE 0 END) AS DIFF_cnr_status
,SUM(CASE WHEN TRIM(UPPER(PROD.cnr_cause))!=TRIM(UPPER(UAT.cnr_cause)) THEN 1 ELSE 0 END) AS DIFF_cnr_cause
,SUM(CASE WHEN TRIM(UPPER(PROD.cnr_detail))!=TRIM(UPPER(UAT.cnr_detail)) THEN 1 ELSE 0 END) AS DIFF_cnr_detail
,SUM(CASE WHEN TRIM(UPPER(PROD.cnr_pathologies))!=TRIM(UPPER(UAT.cnr_pathologies)) THEN 1 ELSE 0 END) AS DIFF_cnr_pathologies
,SUM(CASE WHEN PROD.cnr_analysisdcoid!=UAT.cnr_analysisdcoid THEN 1 ELSE 0 END) AS DIFF_cnr_analysisdcoid
,SUM(CASE WHEN PROD.cnr_refusaldcoid!=UAT.cnr_refusaldcoid THEN 1 ELSE 0 END) AS DIFF_cnr_refusaldcoid
,SUM(CASE WHEN PROD.cnr_startdate!=UAT.cnr_startdate THEN 1 ELSE 0 END) AS DIFF_cnr_startdate
,SUM(CASE WHEN PROD.cnr_enddate!=UAT.cnr_enddate THEN 1 ELSE 0 END) AS DIFF_cnr_enddate
,SUM(CASE WHEN PROD.cnr_controllevel!=UAT.cnr_controllevel THEN 1 ELSE 0 END) AS DIFF_cnr_controllevel
,SUM(CASE WHEN PROD.cnr_isautomatic!=UAT.cnr_isautomatic THEN 1 ELSE 0 END) AS DIFF_cnr_isautomatic
,SUM(CASE WHEN PROD.cnr_previousstatus!=UAT.cnr_previousstatus THEN 1 ELSE 0 END) AS DIFF_cnr_previousstatus
,SUM(CASE WHEN PROD.cnr_paymentcount!=UAT.cnr_paymentcount THEN 1 ELSE 0 END) AS DIFF_cnr_paymentcount
,SUM(CASE WHEN PROD.operationpk!=UAT.operationpk THEN 1 ELSE 0 END) AS DIFF_operationpk
,SUM(CASE WHEN PROD.cnr_migrated!=UAT.cnr_migrated THEN 1 ELSE 0 END) AS DIFF_cnr_migrated
,SUM(CASE WHEN PROD.cnr_itemreserve!=UAT.cnr_itemreserve THEN 1 ELSE 0 END) AS DIFF_cnr_itemreserve
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.CLAIMNORMALRESERVE_raw UAT 
INNER JOIN interseguro-data.acsele_data.CLAIMNORMALRESERVE_raw PROD 
ON UAT.CLAIMNORMALRESERVEDID = PROD.CLAIMNORMALRESERVEDID