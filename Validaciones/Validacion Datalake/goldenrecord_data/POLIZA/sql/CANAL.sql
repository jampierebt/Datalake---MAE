SELECT 
PROD.NUMERO_POLIZA
,PROD.ID_PRODUCTO
,PROD.CANAL
,UAT.CANAL
FROM POLIZA_PROD PROD
LEFT JOIN POLIZA_UAT UAT
ON PROD.NUMERO_POLIZA= UAT.NUMERO_POLIZA
AND PROD.ID_PRODUCTO= UAT.ID_PRODUCTO
WHERE (CASE WHEN TRIM(UPPER(PROD.CANAL))!=TRIM(UPPER(UAT.CANAL)) THEN 1 ELSE 0 END )=1
