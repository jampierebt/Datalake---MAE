SELECT 
PROD.NUMERO_POLIZA
,PROD.ID_PRODUCTO
,PROD.ID_ESTADO_CAUSAL
,UAT.ID_ESTADO_CAUSAL
FROM POLIZA_PROD PROD
LEFT JOIN POLIZA_UAT UAT
ON PROD.NUMERO_POLIZA= UAT.NUMERO_POLIZA
AND PROD.ID_PRODUCTO= UAT.ID_PRODUCTO
WHERE (CASE WHEN TRIM(UPPER(PROD.ID_ESTADO_CAUSAL))!=TRIM(UPPER(UAT.ID_ESTADO_CAUSAL)) THEN 1 ELSE 0 END )=1
