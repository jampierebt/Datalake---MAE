SELECT SUM(CASE WHEN PROD.propertyid!=UAT.propertyid THEN 1 ELSE 0 END) AS DIFF_propertyid
,SUM(CASE WHEN PROD.cotpropertyid!=UAT.cotpropertyid THEN 1 ELSE 0 END) AS DIFF_cotpropertyid
,SUM(CASE WHEN PROD.numasociation!=UAT.numasociation THEN 1 ELSE 0 END) AS DIFF_numasociation
,SUM(CASE WHEN PROD.ttloption!=UAT.ttloption THEN 1 ELSE 0 END) AS DIFF_ttloption