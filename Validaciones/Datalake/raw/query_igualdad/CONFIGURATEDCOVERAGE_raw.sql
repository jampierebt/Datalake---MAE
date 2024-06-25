SELECT SUM(CASE WHEN PROD.configuratedcoverageid!=UAT.configuratedcoverageid THEN 1 ELSE 0 END) AS DIFF_configuratedcoverageid
,SUM(CASE WHEN PROD.agregatedinsuranceobjecttypeid!=UAT.agregatedinsuranceobjecttypeid THEN 1 ELSE 0 END) AS DIFF_agregatedinsuranceobjecttypeid
,SUM(CASE WHEN PROD.coveragetytleid!=UAT.coveragetytleid THEN 1 ELSE 0 END) AS DIFF_coveragetytleid
,SUM(CASE WHEN PROD.templateid!=UAT.templateid THEN 1 ELSE 0 END) AS DIFF_templateid
,SUM(CASE WHEN TRIM(UPPER(PROD.description))!=TRIM(UPPER(UAT.description)) THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN TRIM(UPPER(PROD.mandatory))!=TRIM(UPPER(UAT.mandatory)) THEN 1 ELSE 0 END) AS DIFF_mandatory
,SUM(CASE WHEN PROD.ccv_parentid!=UAT.ccv_parentid THEN 1 ELSE 0 END) AS DIFF_ccv_parentid
,SUM(CASE WHEN PROD.pro_id!=UAT.pro_id THEN 1 ELSE 0 END) AS DIFF_pro_id
,SUM(CASE WHEN PROD.ccv_hierarchystate!=UAT.ccv_hierarchystate THEN 1 ELSE 0 END) AS DIFF_ccv_hierarchystate
,SUM(CASE WHEN PROD.gct_id!=UAT.gct_id THEN 1 ELSE 0 END) AS DIFF_gct_id
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.CONFIGURATEDCOVERAGE_raw UAT 
INNER JOIN interseguro-data.acsele_data.CONFIGURATEDCOVERAGE_raw PROD 
ON UAT.CONFIGURATEDCOVERAGEID = PROD.CONFIGURATEDCOVERAGEID