SELECT 
PROD.NUMERO_POLIZA
,PROD.ID_PRODUCTO
,PROD.MONTO_BASE
,UAT.MONTO_BASE
FROM POLIZA_PROD PROD
LEFT JOIN POLIZA_UAT UAT
ON PROD.NUMERO_POLIZA= UAT.NUMERO_POLIZA
AND PROD.ID_PRODUCTO= UAT.ID_PRODUCTO
WHERE (CASE WHEN PROD.MONTO_BASE!=UAT.MONTO_BASE THEN 1 ELSE 0 END )=1
