SELECT SUM(CASE WHEN PROD.configurableobjecttypeid!=UAT.configurableobjecttypeid THEN 1 ELSE 0 END) AS DIFF_configurableobjecttypeid
,SUM(CASE WHEN TRIM(UPPER(PROD.description))!=TRIM(UPPER(UAT.description)) THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN PROD.type!=UAT.type THEN 1 ELSE 0 END) AS DIFF_type
,SUM(CASE WHEN TRIM(UPPER(PROD.state))!=TRIM(UPPER(UAT.state)) THEN 1 ELSE 0 END) AS DIFF_state