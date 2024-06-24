SELECT 
PROD.NUMERO_POLIZA
,PROD.ID_PRODUCTO
,PROD.NUMERO_SOLICITUD_COTIZACION
,UAT.NUMERO_SOLICITUD_COTIZACION
FROM POLIZA_PROD PROD
LEFT JOIN POLIZA_UAT UAT
ON PROD.NUMERO_POLIZA= UAT.NUMERO_POLIZA
AND PROD.ID_PRODUCTO= UAT.ID_PRODUCTO
WHERE (CASE WHEN TRIM(UPPER(PROD.NUMERO_SOLICITUD_COTIZACION))!=TRIM(UPPER(UAT.NUMERO_SOLICITUD_COTIZACION)) THEN 1 ELSE 0 END )=1
