SELECT SUM(CASE WHEN PROD.dty_id!=UAT.dty_id THEN 1 ELSE 0 END) AS DIFF_dty_id
,SUM(CASE WHEN TRIM(UPPER(PROD.dty_isdebit))!=TRIM(UPPER(UAT.dty_isdebit)) THEN 1 ELSE 0 END) AS DIFF_dty_isdebit
,SUM(CASE WHEN TRIM(UPPER(PROD.dty_description))!=TRIM(UPPER(UAT.dty_description)) THEN 1 ELSE 0 END) AS DIFF_dty_description
,SUM(CASE WHEN TRIM(UPPER(PROD.dty_ismanual))!=TRIM(UPPER(UAT.dty_ismanual)) THEN 1 ELSE 0 END) AS DIFF_dty_ismanual
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.STCA_DOCTYPE_raw UAT 
INNER JOIN interseguro-data.acsele_data.STCA_DOCTYPE_raw PROD 
ON UAT.DTY_ID = PROD.DTY_ID