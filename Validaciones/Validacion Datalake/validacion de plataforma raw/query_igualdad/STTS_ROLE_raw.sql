SELECT SUM(CASE WHEN PROD.ROL_ID!=UAT.ROL_ID THEN 1 ELSE 0 END) AS DIFF_ROL_ID
,SUM(CASE WHEN TRIM(UPPER(PROD.ROL_DESCRIPTION))!=TRIM(UPPER(UAT.ROL_DESCRIPTION)) THEN 1 ELSE 0 END) AS DIFF_ROL_DESCRIPTION
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.STTS_ROLE_raw UAT 
INNER JOIN interseguro-data.acsele_data.STTS_ROLE_raw PROD 
ON UAT.ROL_ID = PROD.ROL_ID