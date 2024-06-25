SELECT SUM(CASE WHEN PROD.agregatedpolicyid!=UAT.agregatedpolicyid THEN 1 ELSE 0 END) AS DIFF_agregatedpolicyid
,SUM(CASE WHEN TRIM(UPPER(PROD.productid))!=TRIM(UPPER(UAT.productid)) THEN 1 ELSE 0 END) AS DIFF_productid
,SUM(CASE WHEN PROD.policytypeid!=UAT.policytypeid THEN 1 ELSE 0 END) AS DIFF_policytypeid
,SUM(CASE WHEN PROD.lifecycleid!=UAT.lifecycleid THEN 1 ELSE 0 END) AS DIFF_lifecycleid
,SUM(CASE WHEN TRIM(UPPER(PROD.description))!=TRIM(UPPER(UAT.description)) THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN PROD.apt_publisheddate!=UAT.apt_publisheddate THEN 1 ELSE 0 END) AS DIFF_apt_publisheddate
,SUM(CASE WHEN PROD.apt_closeddate!=UAT.apt_closeddate THEN 1 ELSE 0 END) AS DIFF_apt_closeddate
,SUM(CASE WHEN PROD.apt_versionid!=UAT.apt_versionid THEN 1 ELSE 0 END) AS DIFF_apt_versionid
,SUM(CASE WHEN PROD.apt_parentid!=UAT.apt_parentid THEN 1 ELSE 0 END) AS DIFF_apt_parentid
,SUM(CASE WHEN PROD.apt_hierarchystate!=UAT.apt_hierarchystate THEN 1 ELSE 0 END) AS DIFF_apt_hierarchystate
,SUM(CASE WHEN PROD.apt_lcyhierarchystate!=UAT.apt_lcyhierarchystate THEN 1 ELSE 0 END) AS DIFF_apt_lcyhierarchystate
,SUM(CASE WHEN PROD.apt_parentlifecycleid!=UAT.apt_parentlifecycleid THEN 1 ELSE 0 END) AS DIFF_apt_parentlifecycleid
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.AGREGATEDPOLICYTYPE_raw UAT 
INNER JOIN interseguro-data.acsele_data.AGREGATEDPOLICYTYPE_raw PROD 
ON UAT.AGREGATEDPOLICYID = PROD.AGREGATEDPOLICYID