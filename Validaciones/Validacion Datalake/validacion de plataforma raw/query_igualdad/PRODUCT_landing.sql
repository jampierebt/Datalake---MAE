SELECT SUM(CASE WHEN PROD.PRODUCTID!=UAT.PRODUCTID THEN 1 ELSE 0 END) AS DIFF_PRODUCTID
,SUM(CASE WHEN PROD.PRODUCTTYPE!=UAT.PRODUCTTYPE THEN 1 ELSE 0 END) AS DIFF_PRODUCTTYPE
,SUM(CASE WHEN PROD.COTRISKUNITID!=UAT.COTRISKUNITID THEN 1 ELSE 0 END) AS DIFF_COTRISKUNITID
,SUM(CASE WHEN TRIM(UPPER(PROD.DESCRIPTION))!=TRIM(UPPER(UAT.DESCRIPTION)) THEN 1 ELSE 0 END) AS DIFF_DESCRIPTION
,SUM(CASE WHEN PROD.PRO_PUBLISHEDDATE!=UAT.PRO_PUBLISHEDDATE THEN 1 ELSE 0 END) AS DIFF_PRO_PUBLISHEDDATE
,SUM(CASE WHEN PROD.PRO_CLOSEDDATE!=UAT.PRO_CLOSEDDATE THEN 1 ELSE 0 END) AS DIFF_PRO_CLOSEDDATE
,SUM(CASE WHEN PROD.PRO_VERSIONID!=UAT.PRO_VERSIONID THEN 1 ELSE 0 END) AS DIFF_PRO_VERSIONID
,SUM(CASE WHEN PROD.PRO_DCOID!=UAT.PRO_DCOID THEN 1 ELSE 0 END) AS DIFF_PRO_DCOID
,SUM(CASE WHEN PROD.PRO_PARENTID!=UAT.PRO_PARENTID THEN 1 ELSE 0 END) AS DIFF_PRO_PARENTID
,SUM(CASE WHEN PROD.PRO_RUHIERARCHYSTATE!=UAT.PRO_RUHIERARCHYSTATE THEN 1 ELSE 0 END) AS DIFF_PRO_RUHIERARCHYSTATE
,SUM(CASE WHEN PROD.PRO_HIERARCHYSTATE!=UAT.PRO_HIERARCHYSTATE THEN 1 ELSE 0 END) AS DIFF_PRO_HIERARCHYSTATE
,SUM(CASE WHEN PROD.PRO_ISACTIVE!=UAT.PRO_ISACTIVE THEN 1 ELSE 0 END) AS DIFF_PRO_ISACTIVE
,SUM(CASE WHEN PROD.PRO_ISCOMMERCIAL!=UAT.PRO_ISCOMMERCIAL THEN 1 ELSE 0 END) AS DIFF_PRO_ISCOMMERCIAL
,SUM(CASE WHEN PROD.PRO_ISVISIBLE!=UAT.PRO_ISVISIBLE THEN 1 ELSE 0 END) AS DIFF_PRO_ISVISIBLE