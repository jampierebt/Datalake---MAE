SELECT 
PROD.NUMERO_POLIZA
,PROD.ID_PRODUCTO
,PROD.NUMERO_PLAN
,UAT.NUMERO_PLAN
FROM POLIZA_PROD PROD
LEFT JOIN POLIZA_UAT UAT
ON PROD.NUMERO_POLIZA= UAT.NUMERO_POLIZA
AND PROD.ID_PRODUCTO= UAT.ID_PRODUCTO
WHERE (CASE WHEN TRIM(UPPER(PROD.NUMERO_PLAN))!=TRIM(UPPER(UAT.NUMERO_PLAN)) THEN 1 ELSE 0 END )=1
