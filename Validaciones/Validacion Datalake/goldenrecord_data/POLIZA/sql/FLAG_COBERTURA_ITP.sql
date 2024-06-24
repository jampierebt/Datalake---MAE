SELECT 
PROD.NUMERO_POLIZA
,PROD.ID_PRODUCTO
,PROD.FLAG_COBERTURA_ITP
,UAT.FLAG_COBERTURA_ITP
FROM POLIZA_PROD PROD
LEFT JOIN POLIZA_UAT UAT
ON PROD.NUMERO_POLIZA= UAT.NUMERO_POLIZA
AND PROD.ID_PRODUCTO= UAT.ID_PRODUCTO
WHERE (CASE WHEN PROD.FLAG_COBERTURA_ITP!=UAT.FLAG_COBERTURA_ITP THEN 1 ELSE 0 END )=1
