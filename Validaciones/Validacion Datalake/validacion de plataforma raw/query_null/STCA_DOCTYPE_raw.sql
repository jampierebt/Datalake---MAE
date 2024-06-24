SELECT SUM(CASE WHEN TRIM(UPPER(PROD.dty_isdebit)) IS NULL AND TRIM(UPPER(UAT.dty_isdebit))="" THEN 1 ELSE 0 END) AS DIFF_dty_isdebit
,SUM(CASE WHEN TRIM(UPPER(PROD.dty_description)) IS NULL AND TRIM(UPPER(UAT.dty_description))="" THEN 1 ELSE 0 END) AS DIFF_dty_description
,SUM(CASE WHEN TRIM(UPPER(PROD.dty_ismanual)) IS NULL AND TRIM(UPPER(UAT.dty_ismanual))="" THEN 1 ELSE 0 END) AS DIFF_dty_ismanual
FROM iter-data-storage-pv-uat.acsele_data.STCA_DOCTYPE_raw UAT 
INNER JOIN interseguro-data.acsele_data.STCA_DOCTYPE_raw PROD 
ON UAT.DTY_ID = PROD.DTY_ID