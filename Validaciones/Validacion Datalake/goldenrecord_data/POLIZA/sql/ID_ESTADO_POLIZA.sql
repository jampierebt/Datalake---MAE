SELECT 
PROD.NUMERO_POLIZA
,PROD.ID_PRODUCTO
,PROD.ID_ESTADO_POLIZA
,UAT.ID_ESTADO_POLIZA
FROM POLIZA_PROD PROD
LEFT JOIN POLIZA_UAT UAT
ON PROD.NUMERO_POLIZA= UAT.NUMERO_POLIZA
AND PROD.ID_PRODUCTO= UAT.ID_PRODUCTO
WHERE (CASE WHEN TRIM(UPPER(PROD.ID_ESTADO_POLIZA))!=TRIM(UPPER(UAT.ID_ESTADO_POLIZA)) THEN 1 ELSE 0 END )=1
