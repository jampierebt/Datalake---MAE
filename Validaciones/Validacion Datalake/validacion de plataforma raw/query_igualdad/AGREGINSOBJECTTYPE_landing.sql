SELECT SUM(CASE WHEN PROD.agregatedinsuranceobjectypeid!=UAT.agregatedinsuranceobjectypeid THEN 1 ELSE 0 END) AS DIFF_agregatedinsuranceobjectypeid
,SUM(CASE WHEN PROD.planpk!=UAT.planpk THEN 1 ELSE 0 END) AS DIFF_planpk
,SUM(CASE WHEN PROD.templatepk!=UAT.templatepk THEN 1 ELSE 0 END) AS DIFF_templatepk
,SUM(CASE WHEN TRIM(UPPER(PROD.description))!=TRIM(UPPER(UAT.description)) THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN PROD.ait_parentid!=UAT.ait_parentid THEN 1 ELSE 0 END) AS DIFF_ait_parentid
,SUM(CASE WHEN PROD.pro_id!=UAT.pro_id THEN 1 ELSE 0 END) AS DIFF_pro_id
,SUM(CASE WHEN PROD.ait_hierarchystate!=UAT.ait_hierarchystate THEN 1 ELSE 0 END) AS DIFF_ait_hierarchystate