SELECT 
PROD.NUMERO_POLIZA
,PROD.ID_PRODUCTO
,PROD.TIPO_PENSION
,UAT.TIPO_PENSION
FROM POLIZA_PROD PROD
LEFT JOIN POLIZA_UAT UAT
ON PROD.NUMERO_POLIZA= UAT.NUMERO_POLIZA
AND PROD.ID_PRODUCTO= UAT.ID_PRODUCTO
WHERE (CASE WHEN TRIM(UPPER(PROD.TIPO_PENSION))!=TRIM(UPPER(UAT.TIPO_PENSION)) THEN 1 ELSE 0 END )=1
