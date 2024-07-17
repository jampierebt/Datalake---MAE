WITH TMP_DATA AS (
SELECT 
'ANULAR' AS ESTADO
,STATUS
,STATIC
,PK
,OBSERVACIONANULACIONVALUE
,OBSERVACIONANULACIONINPUT
,NULL AS MOTIVOANULACIONVLCVALUE
,NULL AS MOTIVOANULACIONVLCINPUT
,NULL AS MOTIVOANULACIONVEHVALUE
,NULL AS MOTIVOANULACIONVEHINPUT
,MOTIVOANULACIONPTVALUE
,MOTIVOANULACIONPTINPUT
,GASTOSADMINVALUE
,GASTOSADMININPUT
,FECHASOLANULACIONVALUE
,FECHASOLANULACIONINPUT
,FECHAMOVIMIENTOVALUE
,FECHAMOVIMIENTOINPUT
,CANCELREASONBANVALUE
,CANCELREASONBANINPUT
FROM INTERSEGURO.ANULAR
UNION ALL
SELECT 
'ANULARVEH' AS ESTADO
,STATUS
,STATIC
,PK
,NULL AS OBSERVACIONANULACIONVALUE
,NULL AS OBSERVACIONANULACIONINPUT
,NULL AS MOTIVOANULACIONVLCVALUE
,NULL AS MOTIVOANULACIONVLCINPUT
,MOTIVOANULACIONVEHVALUE
,MOTIVOANULACIONVEHINPUT
,NULL AS MOTIVOANULACIONPTVALUE
,NULL AS MOTIVOANULACIONPTINPUT
,NULL AS GASTOSADMINVALUE
,NULL AS GASTOSADMININPUT
,NULL AS FECHASOLANULACIONVALUE
,NULL AS FECHASOLANULACIONINPUT
,FECHAMOVIMIENTOVALUE
,FECHAMOVIMIENTOINPUT
,NULL AS CANCELREASONBANVALUE
,NULL AS CANCELREASONBANINPUT
FROM INTERSEGURO.ANULARVEH
--<Inicio Cambios para agregar anulaciones SOAT (ML) 24/04/2024>
UNION ALL
SELECT  'ANULARSOAT' AS ESTADO
        ,STATUS
        ,STATIC
        ,PK
        ,NULL AS OBSERVACIONANULACIONVALUE
        ,NULL AS OBSERVACIONANULACIONINPUT
        ,NULL AS MOTIVOANULACIONVLCVALUE
        ,NULL AS MOTIVOANULACIONVLCINPUT
        ,MOTIVOANULACIONSOATVALUE
        ,MOTIVOANULACIONSOATINPUT
        ,MOTIVOANULACIONSOATVALUE AS MOTIVOANULACIONPTVALUE
        ,MOTIVOANULACIONSOATINPUT AS MOTIVOANULACIONPTINPUT
        ,NULL AS GASTOSADMINVALUE
        ,NULL AS GASTOSADMININPUT
        ,NULL AS FECHASOLANULACIONVALUE
        ,NULL AS FECHASOLANULACIONINPUT
        ,FECHAMOVIMIENTOVALUE
        ,FECHAMOVIMIENTOINPUT
        ,NULL AS CANCELREASONBANVALUE
        ,NULL AS CANCELREASONBANINPUT
FROM    INTERSEGURO.ANULARSOAT
--<Fin Cambios para agregar anulaciones SOAT (ML) 24/04/2024>

)
SELECT   /*+ PARALLEL(2) */
       PRE.NUMEROPOLIZAINPUT            AS NUMERO_POLIZA
      ,PLO.OPERATIONPK                  AS NUMERO_OPERACION
      ,PRE.STATIC                       AS ID_POLIZA
      ,AGR.PRODUCTID
   --   ,TO_CHAR(TO_DATE(PRE.FECHAEMISIONINPUT,'YYYY-MM-DD'),'YYYY-MM-DD')    AS FECHA_EMISION
      ,UPPER(POR.DESCRIPTION )               AS NOMBRE_PRODUCTO
    --  ,TO_CHAR(COT.AUDITDATE,'YYYY-MM-DD HH24:MI:SS AM') AS AUDITDATE_SYSTEM_DATE
   --   ,TO_CHAR(COT.TIME_STAMP ,'YYYY-MM-DD') AS OPERATION_DATE
    --  ,TO_CHAR(COT.TIME_STAMP ,'YYYY-MM-DD HH24:MI:SS') AS OPERATION_DATETIME
      ,EVE.DESCRIPTION AS EVENT
   -- ,BAJ.FECHAMOVIMIENTOINPUT AS FECHA_MOVIMIENTO
    --,BAJ.ESTADO AS TABLA_ORIGEN
    ,BAJ.FECHASOLANULACIONINPUT AS FECHA_SOLICITUD
    ,BAJ.FECHAMOVIMIENTOINPUT AS FECHA_MOVIMIENTO
   -- ,BAJ.FECHASOLANULACIONINPUT AS FECHA_ANULACION
   -- ,BAJ.FECHAEFECTIVAINPUT AS FECHA_EFECTIVA
  --  ,BAJ.FRECUENCIAPAGOENDOSOINPUT AS FRECUENCIA_PAGO_ENDOSO
  --  ,BAJ.PERIODODEVTOTALCANCINPUT AS PERIODO_TOTAL_CANCELACION
  --  ,BAJ.FECHARECEPCARTAINPUT AS FECHA_RECEPCION
    ,BAJ.OBSERVACIONANULACIONINPUT AS OBSERVACION
    ,COALESCE(BAJ.MOTIVOANULACIONPTINPUT,BAJ.MOTIVOANULACIONVEHINPUT) AS  MOTIVO_MOVIMIENTO
  --  ,BAJ.GASTOSADMININPUT AS GASTOS_ADMINISTRATIVOS
 --   ,BAJ.CANCELREASONBANINPUT
 ,BAJ.ESTADO AS MOVIMIENTO
    FROM INTERSEGURO.PREPOLICY PRE
 INNER JOIN INTERSEGURO.POLICYDCO PLO
         ON PLO.DCOID = PRE.PK
 INNER JOIN INTERSEGURO.CONTEXTOPERATION COT
         ON COT.ID =PLO.OPERATIONPK
 INNER JOIN INTERSEGURO.AGREGATEDPOLICY AGR
         ON AGR.AGREGATEDPOLICYID = PLO.AGREGATEDOBJECTID
        -- AND AGR.OPERATIONPK = COT.ID
 INNER JOIN INTERSEGURO.PRODUCT POR
         ON POR.PRODUCTID = AGR.PRODUCTID
 INNER JOIN INTERSEGURO.EVENTDCO EVD
         ON EVD.OPERATIONPK = PLO.OPERATIONPK
 INNER JOIN TMP_DATA BAJ
         ON BAJ.PK = EVD.IDDCOEVENT
 LEFT JOIN INTERSEGURO.EVENTTYPE EVE
         ON EVE.EVENTTYPEID= EVD.EVENTTYPEID
 --INNER JOIN INTERSEGURO.STATE STA
 --       ON STA.STATEID = PLO.STATEID
     WHERE PRE.NUMEROPOLIZAINPUT IS NOT NULL
  --   AND COT.STATUS=2
   --  AND PRE.NUMEROPOLIZAINPUT='29640'
     
     --> POLIZA OPERACION REVISAR QUERY 
     
     AND DATE_TRUNC('day', COT.AUDITDATE) BETWEEN TO_DATE('${v_FechaInicioYYYYMMDD}', 'YYYYMMDD') AND TO_DATE('${v_FechaFinYYYYMMDD}', 'YYYYMMDD');

     --POLIZA_OPERACION_EVENT_raw
     --AND EVE.DESCRIPTION='RehabSaldadoEfectivo' 
     --RehabilitarSaldado
     --SolicitarRehabSaldado
     
     
     