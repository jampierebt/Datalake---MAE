SELECT SUM(CASE WHEN PROD.configurableobjecttypeid!=UAT.configurableobjecttypeid THEN 1 ELSE 0 END) AS DIFF_configurableobjecttypeid
,SUM(CASE WHEN TRIM(UPPER(PROD.description))!=TRIM(UPPER(UAT.description)) THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN PROD.type!=UAT.type THEN 1 ELSE 0 END) AS DIFF_type
,SUM(CASE WHEN TRIM(UPPER(PROD.state))!=TRIM(UPPER(UAT.state)) THEN 1 ELSE 0 END) AS DIFF_state
,SUM(CASE WHEN PROD.FECHA_PROCESO!=UAT.FECHA_PROCESO THEN 1 ELSE 0 END) AS DIFF_FECHA_PROCESO
FROM iter-data-storage-pv-uat.acsele_data.CONFIGURABLEOBJECTTYPE_raw UAT 
INNER JOIN interseguro-data.acsele_data.CONFIGURABLEOBJECTTYPE_raw PROD 
ON UAT.CONFIGURABLEOBJECTTYPEID = PROD.CONFIGURABLEOBJECTTYPEID