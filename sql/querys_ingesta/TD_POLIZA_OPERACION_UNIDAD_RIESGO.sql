WITH TMP_UNIDAD_RIESGO AS
(
SELECT
 PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URDOTALDOBLECAPITAL
UNION ALL
SELECT 
 PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URDOTALDOBLECREC
UNION ALL
SELECT 
 PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URDOTALDOBLEPROTEC
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URDOTALSIMPLESURA
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URDOTALTRIPLECREC
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URDOTALTRIPLEPROTEC
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.UREDUCACIONALSURA
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URSEGUNDOASEGURADOSURA
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URTEMPGARANTIZADO100
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URTEMPGARANTIZADO75
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URTEMPORALSURA
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URVIDAENTERABENEFANT
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,CAPITALASEGURADOINPUT
,PERIODOPAGOBENEFINPUT
,CAPITALASEGANTSURAINPUT
,CAPITALASEGCRECANTSURAINPUT
,CAPITALASEGCRECSURAINPUT
,FACTORCRECSURAINPUT
,NUMEROANUALIDADESSURAINPUT
,PERIODOCOBERTURASURAINPUT
,PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URVIDAENTERASURA
UNION ALL
------------AGREGADO
--> EXISTEN MAS UR PERO PARA VIDA NO CUMPLEN
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
--SELECT * 
FROM INTERSEGURO.UREDUCGARANTIZADAPLUS
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
--SELECT * 
FROM INTERSEGURO.UREDUCGARANTIZADAPLUSNEW
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
--SELECT * 
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URVIDAFREE
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
--SELECT * 
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URVIDAPROTEGIDA
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URSEGUROACCIDENTES
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URVIDACASH
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URPLANGARANTIZADO
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URVIDATOTALPROTEGIDA
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URVIDAINVERSION
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URDOTALSIMPLE
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URVIDACASHSTOCK
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URSEGUROTEMPDEVPRIMAS
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URVIDALEYCESANTE
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URSIEMPRESEGURO
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URVIDATEMPORAL
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.UREDUCGARANTIZADA
UNION ALL 
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAVEINPUT AS PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
--SELECT * 
FROM INTERSEGURO.URVIDAENTERA
UNION ALL 
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
--SELECT * 
FROM INTERSEGURO.URVDLCESANTESURA

UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URFLEX65
UNION ALL
SELECT  PK
,STATIC
,STATUS
,PERIODOPAGOPRIMAINPUT
,NULL AS CAPITALASEGURADOINPUT
,NULL AS PERIODOPAGOBENEFINPUT
,NULL AS CAPITALASEGANTSURAINPUT
,NULL AS CAPITALASEGCRECANTSURAINPUT
,NULL AS CAPITALASEGCRECSURAINPUT
,NULL AS FACTORCRECSURAINPUT
,NULL AS NUMEROANUALIDADESSURAINPUT
,NULL AS PERIODOCOBERTURASURAINPUT
,NULL AS PERIODOPAGOPRIMASURAINPUT
FROM INTERSEGURO.URFLEX80
 
)
    SELECT
    PRE.NUMEROPOLIZAINPUT AS NUMERO_POLIZA,
    PLO.OPERATIONPK AS OPERACION,
    TO_CHAR(COT.AUDITDATE, 'YYYY-MM-DD HH24:MI:SS') AS AUDITDATE_SYSTEM_DATE,
    TO_CHAR(COT.TIME_STAMP, 'YYYY-MM-DD HH24:MI:SS') AS FECHA_OPERACION,
    CASE 
        WHEN COT.STATUS = 1 THEN 'Not applied operation'
        WHEN COT.STATUS = 2 THEN 'Applied operation'
        ELSE '' || COT.STATUS
    END AS STATUS_OPERATION,
    UNR.PK,
    UNR.STATIC,
    UNR.PERIODOPAGOPRIMAINPUT,
    UNR.CAPITALASEGURADOINPUT,
    UNR.PERIODOPAGOBENEFINPUT,
    UNR.CAPITALASEGANTSURAINPUT,
    UNR.CAPITALASEGCRECANTSURAINPUT,
    UNR.CAPITALASEGCRECSURAINPUT,
    UNR.FACTORCRECSURAINPUT,
    UNR.NUMEROANUALIDADESSURAINPUT,
    UNR.PERIODOCOBERTURASURAINPUT,
    UNR.PERIODOPAGOPRIMASURAINPUT
FROM
    INTERSEGURO.PREPOLICY PRE
INNER JOIN INTERSEGURO.POLICYDCO PLO ON PLO.DCOID = PRE.PK
INNER JOIN INTERSEGURO.CONTEXTOPERATION COT ON COT.ID = PLO.OPERATIONPK
INNER JOIN INTERSEGURO.RISKUNITDCO RIS ON RIS.OPERATIONPK = COT.ID
INNER JOIN TMP_UNIDAD_RIESGO UNR ON UNR.PK = RIS.DCOID
WHERE
    PRE.NUMEROPOLIZAINPUT IS NOT NULL
    AND EXTRACT(YEAR FROM COT.AUDITDATE) * 100 + EXTRACT(MONTH FROM COT.AUDITDATE) >= EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '2 months') * 100 + EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '2 months');