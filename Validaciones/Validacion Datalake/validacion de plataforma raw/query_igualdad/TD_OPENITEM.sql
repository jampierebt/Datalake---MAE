SELECT SUM(CASE WHEN PROD.OPENITEMID!=UAT.OPENITEMID THEN 1 ELSE 0 END) AS DIFF_OPENITEMID
,SUM(CASE WHEN PROD.THIRDPARTYID!=UAT.THIRDPARTYID THEN 1 ELSE 0 END) AS DIFF_THIRDPARTYID
,SUM(CASE WHEN PROD.DTY_ID!=UAT.DTY_ID THEN 1 ELSE 0 END) AS DIFF_DTY_ID
,SUM(CASE WHEN PROD.OPENITEMDATE!=UAT.OPENITEMDATE THEN 1 ELSE 0 END) AS DIFF_OPENITEMDATE
,SUM(CASE WHEN PROD.DOCDATE!=UAT.DOCDATE THEN 1 ELSE 0 END) AS DIFF_DOCDATE
,SUM(CASE WHEN PROD.DATEUSERECIPENT!=UAT.DATEUSERECIPENT THEN 1 ELSE 0 END) AS DIFF_DATEUSERECIPENT
,SUM(CASE WHEN PROD.DUEDATE!=UAT.DUEDATE THEN 1 ELSE 0 END) AS DIFF_DUEDATE
,SUM(CASE WHEN PROD.APPLIEDTO!=UAT.APPLIEDTO THEN 1 ELSE 0 END) AS DIFF_APPLIEDTO
,SUM(CASE WHEN PROD.PARENTOPENITEMID!=UAT.PARENTOPENITEMID THEN 1 ELSE 0 END) AS DIFF_PARENTOPENITEMID
,SUM(CASE WHEN PROD.CURRENCYID!=UAT.CURRENCYID THEN 1 ELSE 0 END) AS DIFF_CURRENCYID
,SUM(CASE WHEN PROD.AMOUNT!=UAT.AMOUNT THEN 1 ELSE 0 END) AS DIFF_AMOUNT
,SUM(CASE WHEN PROD.BALANCE!=UAT.BALANCE THEN 1 ELSE 0 END) AS DIFF_BALANCE
,SUM(CASE WHEN TRIM(UPPER(PROD.STATUS))!=TRIM(UPPER(UAT.STATUS)) THEN 1 ELSE 0 END) AS DIFF_STATUS
,SUM(CASE WHEN PROD.OPERATIONPK!=UAT.OPERATIONPK THEN 1 ELSE 0 END) AS DIFF_OPERATIONPK
,SUM(CASE WHEN PROD.REFERENCETYPE!=UAT.REFERENCETYPE THEN 1 ELSE 0 END) AS DIFF_REFERENCETYPE
,SUM(CASE WHEN PROD.SAPCURRENCYID!=UAT.SAPCURRENCYID THEN 1 ELSE 0 END) AS DIFF_SAPCURRENCYID
,SUM(CASE WHEN TRIM(UPPER(PROD.OPM_SUBSTATUS))!=TRIM(UPPER(UAT.OPM_SUBSTATUS)) THEN 1 ELSE 0 END) AS DIFF_OPM_SUBSTATUS
,SUM(CASE WHEN PROD.OPM_MASTEROPENITEMID!=UAT.OPM_MASTEROPENITEMID THEN 1 ELSE 0 END) AS DIFF_OPM_MASTEROPENITEMID
,SUM(CASE WHEN PROD.ROL_ID!=UAT.ROL_ID THEN 1 ELSE 0 END) AS DIFF_ROL_ID
,SUM(CASE WHEN TRIM(UPPER(PROD.DTY_DESCRIPTION))!=TRIM(UPPER(UAT.DTY_DESCRIPTION)) THEN 1 ELSE 0 END) AS DIFF_DTY_DESCRIPTION
,SUM(CASE WHEN PROD.OPENITEMREFERENCEID!=UAT.OPENITEMREFERENCEID THEN 1 ELSE 0 END) AS DIFF_OPENITEMREFERENCEID
,SUM(CASE WHEN PROD.POLICYID!=UAT.POLICYID THEN 1 ELSE 0 END) AS DIFF_POLICYID
,SUM(CASE WHEN PROD.RISKUNITID!=UAT.RISKUNITID THEN 1 ELSE 0 END) AS DIFF_RISKUNITID
,SUM(CASE WHEN PROD.REFERENCE!=UAT.REFERENCE THEN 1 ELSE 0 END) AS DIFF_REFERENCE
,SUM(CASE WHEN PROD.ADDITIONALREFERENCE!=UAT.ADDITIONALREFERENCE THEN 1 ELSE 0 END) AS DIFF_ADDITIONALREFERENCE
,SUM(CASE WHEN TRIM(UPPER(PROD.PAYMENTSEQUENCE))!=TRIM(UPPER(UAT.PAYMENTSEQUENCE)) THEN 1 ELSE 0 END) AS DIFF_PAYMENTSEQUENCE
,SUM(CASE WHEN TRIM(UPPER(PROD.OPR_POLICYNUMBER))!=TRIM(UPPER(UAT.OPR_POLICYNUMBER)) THEN 1 ELSE 0 END) AS DIFF_OPR_POLICYNUMBER
,SUM(CASE WHEN TRIM(UPPER(PROD.OPR_RISKUNITNUMBER))!=TRIM(UPPER(UAT.OPR_RISKUNITNUMBER)) THEN 1 ELSE 0 END) AS DIFF_OPR_RISKUNITNUMBER
,SUM(CASE WHEN TRIM(UPPER(PROD.OPR_CLAIMNUMBER))!=TRIM(UPPER(UAT.OPR_CLAIMNUMBER)) THEN 1 ELSE 0 END) AS DIFF_OPR_CLAIMNUMBER
,SUM(CASE WHEN TRIM(UPPER(PROD.OPR_RECOVERYNUMBER))!=TRIM(UPPER(UAT.OPR_RECOVERYNUMBER)) THEN 1 ELSE 0 END) AS DIFF_OPR_RECOVERYNUMBER
,SUM(CASE WHEN TRIM(UPPER(PROD.PGC_CATEGORY))!=TRIM(UPPER(UAT.PGC_CATEGORY)) THEN 1 ELSE 0 END) AS DIFF_PGC_CATEGORY
,SUM(CASE WHEN TRIM(UPPER(PROD.OPR_PRODUCTPK))!=TRIM(UPPER(UAT.OPR_PRODUCTPK)) THEN 1 ELSE 0 END) AS DIFF_OPR_PRODUCTPK
,SUM(CASE WHEN PROD.CIOP_ID!=UAT.CIOP_ID THEN 1 ELSE 0 END) AS DIFF_CIOP_ID
,SUM(CASE WHEN PROD.OPR_COMPONENTID!=UAT.OPR_COMPONENTID THEN 1 ELSE 0 END) AS DIFF_OPR_COMPONENTID
,SUM(CASE WHEN PROD.AGV_ID!=UAT.AGV_ID THEN 1 ELSE 0 END) AS DIFF_AGV_ID
,SUM(CASE WHEN PROD.OPR_RCIN_ID!=UAT.OPR_RCIN_ID THEN 1 ELSE 0 END) AS DIFF_OPR_RCIN_ID
,SUM(CASE WHEN PROD.RCO_ID!=UAT.RCO_ID THEN 1 ELSE 0 END) AS DIFF_RCO_ID
,SUM(CASE WHEN PROD.ROP_ID!=UAT.ROP_ID THEN 1 ELSE 0 END) AS DIFF_ROP_ID