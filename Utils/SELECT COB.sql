-------------------------------------------------------------
-- Validacion de los casos encontrados con diferencias
-------------------------------------------------------------
    SELECT   COB.NUMERO_POLIZA
    ,COB.OPERATIONPK
    , COB.CODIGO_COBERTURA
    , COB.NOMBRE_COBERTURA
    , COB.ID_PRODUCTO
    , COB.COBERTURA_PRIMA_NETA AS UAT
    , TD. COBERTURA_PRIMA_NETA AS PROD
    , COB.COBERTURA_PRIMA
    , COB.PAGO
    ,CASE WHEN MAX(COB.OPERATIONPK) 
        OVER(
            PARTITION BY  COB.NUMERO_POLIZA
            )=COB.OPERATIONPK 
        THEN 1
        ELSE 0 
    END AS NUM_FIL
    FROM `iter-data-storage-pv-uat.acsele_data.PRIMA_OPERACION_COBERTURA_raw` COB 
    LEFT JOIN `interseguro-data.acsele_data.PRIMA_OPERACION_COBERTURA_raw` TD
            ON COB.NUMERO_POLIZA = TD.NUMERO_POLIZA
           AND COB.OPERATIONPK = TD.OPERATIONPK 
    WHERE COB.COBERTURA_PRIMA_NETA='' 

