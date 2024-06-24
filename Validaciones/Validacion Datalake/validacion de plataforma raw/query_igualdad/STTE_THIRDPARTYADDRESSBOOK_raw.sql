SELECT SUM(CASE WHEN PROD.tab_id!=UAT.tab_id THEN 1 ELSE 0 END) AS DIFF_tab_id
,SUM(CASE WHEN PROD.tpt_id!=UAT.tpt_id THEN 1 ELSE 0 END) AS DIFF_tpt_id
,SUM(CASE WHEN PROD.cot_id!=UAT.cot_id THEN 1 ELSE 0 END) AS DIFF_cot_id
,SUM(CASE WHEN PROD.iddco!=UAT.iddco THEN 1 ELSE 0 END) AS DIFF_iddco
,SUM(CASE WHEN PROD.tab_type!=UAT.tab_type THEN 1 ELSE 0 END) AS DIFF_tab_type
,SUM(CASE WHEN PROD.tab_status!=UAT.tab_status THEN 1 ELSE 0 END) AS DIFF_tab_status
,SUM(CASE WHEN PROD.isdefaultaddress!=UAT.isdefaultaddress THEN 1 ELSE 0 END) AS DIFF_isdefaultaddress
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.STTE_THIRDPARTYADDRESSBOOK_raw UAT 
INNER JOIN interseguro-data.acsele_data.STTE_THIRDPARTYADDRESSBOOK_raw PROD 
ON UAT.TAB_ID = PROD.TAB_ID