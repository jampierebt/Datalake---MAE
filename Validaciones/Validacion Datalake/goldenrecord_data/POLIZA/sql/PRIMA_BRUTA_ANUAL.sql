SELECT 
PROD.NUMERO_POLIZA
,PROD.ID_PRODUCTO
,PROD.PRIMA_BRUTA_ANUAL
,UAT.PRIMA_BRUTA_ANUAL
FROM POLIZA_PROD PROD
LEFT JOIN POLIZA_UAT UAT
ON PROD.NUMERO_POLIZA= UAT.NUMERO_POLIZA
AND PROD.ID_PRODUCTO= UAT.ID_PRODUCTO
WHERE (CASE WHEN PROD.PRIMA_BRUTA_ANUAL!=UAT.PRIMA_BRUTA_ANUAL THEN 1 ELSE 0 END )=1
