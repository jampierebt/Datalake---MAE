SELECT 
PROD.NUMERO_POLIZA
,PROD.ID_PRODUCTO
,PROD.DIFERIDO_PERIODO_PAGO
,UAT.DIFERIDO_PERIODO_PAGO
FROM POLIZA_PROD PROD
LEFT JOIN POLIZA_UAT UAT
ON PROD.NUMERO_POLIZA= UAT.NUMERO_POLIZA
AND PROD.ID_PRODUCTO= UAT.ID_PRODUCTO
WHERE (CASE WHEN PROD.DIFERIDO_PERIODO_PAGO!=UAT.DIFERIDO_PERIODO_PAGO THEN 1 ELSE 0 END )=1
