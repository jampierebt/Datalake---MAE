CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_goldenrecord_poliza_traspaso()
BEGIN


CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_TRASPASO`
PARTITION BY DATE_TRUNC(FECHA_INICIO_OPENITEM,MONTH)
CLUSTER BY ESTADO
AS
SELECT DISTINCT 
 REF.OPR_POLICYNUMBER AS NUMERO_POLIZA
,OPE.OPENITEMID
,OPE.OPERATIONPK AS NUMERO_OPERACION
,OPE.APPLIEDTO AS OPENITEMID_APLICADO
--,OPE.THIRDPARTYID
,OPE.DTY_ID AS ID_TIPO_TRASPASO
,STC.DTY_DESCRIPTION AS TIPO_TRASPASO
,DATE(OPE.OPENITEMDATE,'America/Lima') AS FECHA_INICIO_OPENITEM
,DATE(OPE.DOCDATE,'America/Lima') AS FECHA_DOCUMENTO 
,DATE(OPE.DATEUSERECIPENT,'America/Lima') AS FECHA_USO_RECIBIDO
,DATE(OPE.DUEDATE,'America/Lima') AS FECHA_VENCIMIENTO
-- ,OPE.CURRENCYID
,OPE.AMOUNT           AS MONTO
,OPE.BALANCE          AS MONTO_BALANCE
,TRIM(LOWER(OPE.STATUS))        AS ESTADO
,TRIM(LOWER(OPE.OPM_SUBSTATUS)) AS SUBESTADO
--,OPE.REFERENCETYPE
--,OPE.SAPCURRENCYID
,MON.CCY_ISOCODE AS MONEDA_ISO
--,MON.DESCRIPTION AS MONEDA
--,OPE.ROL_ID
--,DATE(REF.OPENITEMDATE,'America/Lima') AS OPENITEMDATE
--,REF.OPENITEMREFERENCEID
--,REF.OPENITEMID
--,REF.POLICYID
--,REF.REFERENCE
--,REF.ADDITIONALREFERENCE
--,REF.PAYMENTSEQUENCE
--,REF.OPR_PRODUCTPK
,CURRENT_DATE('America/Lima') AS FECHA_PROCESO
      FROM `iter-data-storage-pv-uat.acsele_data.OPENITEM_raw` OPE
INNER JOIN `iter-data-storage-pv-uat.acsele_data.OPENITEMREFERENCE_raw` REF
        ON REF.OPENITEMID = OPE.OPENITEMID
INNER JOIN `iter-data-storage-pv-uat.acsele_data.STCA_DOCTYPE_raw`   STC
        ON STC.DTY_ID = OPE.DTY_ID
INNER JOIN `iter-data-storage-pv-uat.acsele_data.CURRENCY_raw`  MON
        ON MON.CURRENCYID = OPE.CURRENCYID
     WHERE OPE.DTY_ID in (45052,45053)
;


SELECT 'OK' AS ESTADO_EJECUCION;


END;