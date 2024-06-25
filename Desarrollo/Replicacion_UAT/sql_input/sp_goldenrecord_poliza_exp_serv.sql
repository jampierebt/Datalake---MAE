CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_goldenrecord_poliza_exp_serv()
BEGIN
/********************************************************************
* Proyecto		    : GOLDEN RECORD
* Fecha			    : 03 / 05 / 2022
* Autor			    : Geraldidne Jayo                               
* Descripción       : Migración de pólizas - exp_serv                  
*********************************************************************
*                       MODIFICACIONES POSTERIORES                  *
*===================================================================*
*=  Fecha   | Persona |           Modificación Realizada           =*
*===================================================================*
* 
*********************************************************************/
-- ----------------------------------------------------------------------
-- Paso A10: TABLA POLIZA
-- ----------------------------------------------------------------------
-----------------------EXP_SERV -- LEGACY
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.POLIZA_EXP_SERV`
AS
WITH TMP_CONTRATANTE AS (
   SELECT 
        TRIM(ID_PERSONA) AS ID_PERSONA, 
        NUMERO_DOCUMENTO 
   FROM `iter-data-storage-pv-uat.goldenrecord_data.CONTRATANTE` 
   WHERE NUMERO_DOCUMENTO<>''
   QUALIFY (ROW_NUMBER()OVER(PARTITION BY TRIM(NUMERO_DOCUMENTO) ORDER BY (CASE WHEN ID_TIPO_DOCUMENTO='01' THEN 0
    WHEN ID_TIPO_DOCUMENTO='02' THEN 1
    WHEN ID_TIPO_DOCUMENTO='03' THEN 2
    WHEN ID_TIPO_DOCUMENTO='04' THEN 3
    WHEN ID_TIPO_DOCUMENTO='05' THEN 4
    WHEN ID_TIPO_DOCUMENTO='06' THEN 5
    WHEN ID_TIPO_DOCUMENTO='07' THEN 6
    ELSE 7 END) ASC, FECHA_MODIFICACION DESC))=1
)
SELECT * FROM (
    SELECT DISTINCT
    '80' AS ID_FUENTE, 
    CAST(P.num_poliza AS STRING) AS NUMERO_POLIZA,
    DATE(P.fec_emision_poliza,'America/Lima') AS FECHA_EMISION, 
    TRIM(P.cod_producto) AS ID_PRODUCTO,
    PR.NOMBRE_PRODUCTO,
    PR.ID_GRUPO_PRODUCTO,
    PR.NOMBRE_GRUPO_PRODUCTO,
    EG1.CODIGO_GLOBAL AS ID_MONEDA,
    EG1.NOMBRE_GLOBAL AS MONEDA,
    CAST(P.val_prima_neta AS NUMERIC) AS PRIMA_NETA,
    CAST(P.val_prima_bruta AS NUMERIC) AS PRIMA_TOTAL,
    CAST(P.val_capitalizado AS NUMERIC) AS MONTO_COBERTURA_PRINCIPAL,
    DATE(P.fec_inicio_vigencia,'America/Lima') AS FECHA_INICIO,
    DATE(P.fec_fin_vigencia,'America/Lima') AS FECHA_FIN,
    CAST(fec_pagado_hasta AS DATE) FECHA_PAGADO_HASTA ,
    P.cod_causal_estado_poliza ID_ESTADO_CAUSAL	,
    CASE WHEN TRIM(P.rut_contratante) IS NULL OR TRIM(P.rut_contratante)='' THEN ''
    ELSE COALESCE(CG.ID_PERSONA,CONCAT('01-80-',TRIM(P.rut_contratante))) END AS ID_PERSONA,
     CAST(DATE(P.fec_cierre_poliza ,'America/Lima') AS STRING) AS FECHA_VENTA,
    DATE(P.fec_pagado_hasta,'America/Lima') AS FECHA_ULTIMA_OPERACION,
    CURRENT_DATETIME('America/Lima') AS FECHA_CREACION,
    CURRENT_DATETIME('America/Lima') AS FECHA_MODIFICACION,
    MIN(CASE WHEN P.cod_estado_poliza='04' THEN DATE(P.fec_inicio_estado,'America/Lima')  END)OVER(PARTITION BY P.num_poliza) AS  FECHA_ANULADA,
    MIN(CASE WHEN P.cod_estado_poliza='02'  THEN DATE(P.fec_inicio_estado,'America/Lima')  END)OVER(PARTITION BY P.num_poliza) AS  FECHA_SUSPENDIDA,
    MIN(CASE WHEN P.cod_estado_poliza='03'  THEN DATE(P.fec_inicio_estado,'America/Lima') END )OVER(PARTITION BY P.num_poliza) FECHA_TERMINADO,
    PR.RAMO,
    PR.SUB_RAMO AS SUBRAMO,
    PR.ID_RAMO,
    PR.ID_SUBRAMO,
    -----NUEVOS CAMPOS
    P.cod_periodo_pago ID_PERIODO_PAGO,
    upper(E.gls_corta) FRECUENCIA_PAGO,
   ---  upper(M.gls_corta) MONEDA_V1,
    P.cod_estado_poliza ID_ESTADO_POLIZA,
    upper(T.gls_corta) ESTADO,
    upper(C.gls_larga) ESTADO_CAUSAL,
    CAST(p.num_plan AS STRING) NUMERO_PLAN,
    P.val_periodo_pago_prima AS PERIODO_PAGO,
    'LEGACY' BASE,
    CASE
        WHEN ID_PRODUCTO in 
        ('69343','69344','69345','69346','69347','69348','69349','69350','69351','69352','69353','69354','69355') THEN 'SURA'
        ELSE 'INTER'  END AS COMPANIA
FROM `iter-data-storage-pv-uat.raw_vesta_exp_serv.POLIZA_raw` P
LEFT JOIN TMP_CONTRATANTE CG ON TRIM(P.rut_contratante)=TRIM(CG.NUMERO_DOCUMENTO)
LEFT JOIN `iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL` EG1 
          ON EG1.VALOR_ORIGEN        = TRIM(P.mon_poliza)
         AND EG1.ID_FUENTE           = '02'
         AND EG1.CODIGO_TIPO         = 'MONEDA'
LEFT JOIN `iter-data-storage-pv-uat.config_data.CNF_EQUIVALENCIA_GLOBAL` EG2 
          ON EG2.VALOR_ORIGEN       =  TRIM(P.cod_periodo_pago)
         AND EG2.CODIGO_TIPO        = 'FRECUENCIAPAGO'	 
LEFT JOIN `iter-data-storage-pv-uat.config_data.CNF_AGRUPACION_PRODUCTO_RAMO` PR 
          ON PR.ID_PRODUCTO=TRIM(P.cod_producto) 
          AND PR.ID_FUENTE='80' 
          AND PR.ID_SUBRAMO=TRIM(P.cod_subramo) 
LEFT JOIN  `iter-data-storage-pv-uat.raw_vesta_exp_serv.TAB_CODIGO_raw` E
          ON E.cod_codigo=TRIM(P.cod_periodo_pago) 
          AND lower(E.nom_tabla)='perpag'
LEFT JOIN  `iter-data-storage-pv-uat.raw_vesta_exp_serv.TAB_CODIGO_raw` C
          ON C.cod_codigo=TRIM(P.cod_causal_estado_poliza) 
          AND lower(C.nom_tabla)='caupol'
LEFT JOIN  `iter-data-storage-pv-uat.raw_vesta_exp_serv.TAB_CODIGO_raw` T
          ON T.cod_codigo=TRIM(P.cod_estado_poliza) 
          AND lower(T.nom_tabla)='estpol'
LEFT JOIN  `iter-data-storage-pv-uat.raw_vesta_exp_serv.TAB_CODIGO_raw` M
          ON M.cod_codigo=TRIM(P.mon_poliza) 
          AND lower(M.nom_tabla)='moneda'

WHERE P.cod_causal_estado_poliza <>'26'

)
WHERE NUMERO_POLIZA NOT IN (SELECT NUMERO_POLIZA FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA` WHERE ID_FUENTE<>'80')

;

----------------------------------------------------------------------------
--ACTUALIZACION
---------------------------------------------------------------------------


 UPDATE `iter-data-storage-pv-uat.temp.POLIZA_EXP_SERV` A
 SET  A.Estado = 'ANULADA', A.ESTADO_CAUSAL = 'DESISTIMIENTO CLIENTE'
 WHERE A.Estado = 'SUSPENDIDA' and A.ESTADO_CAUSAL = 'ANULADA A PEDIDO';



 UPDATE `iter-data-storage-pv-uat.temp.POLIZA_EXP_SERV` 
 SET  Estado = 'PRORROGADA', ESTADO_CAUSAL = 'PRORROGADA'
 WHERE Estado = 'VIGENTE' and ESTADO_CAUSAL = 'PRORROGADA';




 UPDATE `iter-data-storage-pv-uat.temp.POLIZA_EXP_SERV` 
 SET  Estado = 'RESCATADA', ESTADO_CAUSAL = 'RESCATADA'
 WHERE Estado = 'TERMINADA' and ESTADO_CAUSAL = 'RESCATADA';




 UPDATE `iter-data-storage-pv-uat.temp.POLIZA_EXP_SERV` 
 SET Estado = 'SALDADO', ESTADO_CAUSAL = 'SALDADA A PEDIDO'
 WHERE  Estado = 'VIGENTE' and ESTADO_CAUSAL = 'SALDADA A PEDIDO';

    ---QUINTA ACTUALIZACION:


 UPDATE `iter-data-storage-pv-uat.temp.POLIZA_EXP_SERV` 
 SET Estado = 'TERMINADA', ESTADO_CAUSAL = 'TERMINO VIGENCIA'
 WHERE  Estado = 'SUSPENDIDA' and ESTADO_CAUSAL = 'TERMINO VIGENCIA';


-- ----------------------------------------------------------------------
-- Eliminar polizas
-- ----------------------------------------------------------------------

DELETE FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA` A
      WHERE EXISTS (
        SELECT 1 
         FROM `iter-data-storage-pv-uat.temp.POLIZA_EXP_SERV` B 
         WHERE A.NUMERO_POLIZA   =B.NUMERO_POLIZA
         AND A.ID_FUENTE='80'
);

-- ----------------------------------------------------------------------
-- Agregar nuevas polizas
-- ----------------------------------------------------------------------
INSERT INTO `iter-data-storage-pv-uat.goldenrecord_data.POLIZA`
 (
ID_FUENTE
,NUMERO_POLIZA
,FECHA_EMISION
,ID_PRODUCTO
,NOMBRE_PRODUCTO
,ID_GRUPO_PRODUCTO
,NOMBRE_GRUPO_PRODUCTO
,ID_MONEDA
,MONEDA
,PRIMA_NETA
,PRIMA_TOTAL
,MONTO_COBERTURA_PRINCIPAL
,FECHA_INICIO
,FECHA_FIN
--,FECHA_PAGADO_HASTA
,ID_ESTADO_CAUSAL	
,ID_PERSONA
,FECHA_VENTA
,FECHA_ULTIMA_OPERACION
,FECHA_CREACION
,FECHA_MODIFICACION
,FECHA_ANULADA
,FECHA_SUSPENDIDA
,FECHA_TERMINADO
,RAMO
,SUBRAMO
,ID_RAMO
,ID_SUBRAMO
,ID_PERIODO_PAGO
,FRECUENCIA_PAGO
,ID_ESTADO_POLIZA
,ESTADO
,ESTADO_CAUSAL
,NUMERO_PLAN
,PERIODO_PAGO
,BASE
,COMPANIA
) 
SELECT
ID_FUENTE
,NUMERO_POLIZA
,FECHA_EMISION
,ID_PRODUCTO
,NOMBRE_PRODUCTO
,ID_GRUPO_PRODUCTO
,NOMBRE_GRUPO_PRODUCTO
,ID_MONEDA
,MONEDA
,PRIMA_NETA
,PRIMA_TOTAL
,MONTO_COBERTURA_PRINCIPAL
,FECHA_INICIO
,FECHA_FIN
---,FECHA_PAGADO_HASTA
,ID_ESTADO_CAUSAL	
,ID_PERSONA
,FECHA_VENTA
,FECHA_ULTIMA_OPERACION
,FECHA_CREACION
,FECHA_MODIFICACION
,FECHA_ANULADA
,FECHA_SUSPENDIDA
,FECHA_TERMINADO
,RAMO
,SUBRAMO
,ID_RAMO
,ID_SUBRAMO
,ID_PERIODO_PAGO
,FRECUENCIA_PAGO
,ID_ESTADO_POLIZA
,ESTADO
,ESTADO_CAUSAL
,NUMERO_PLAN
,PERIODO_PAGO
,BASE
,COMPANIA
FROM `iter-data-storage-pv-uat.temp.POLIZA_EXP_SERV`
;




 
-- ----------------------------------------------------------------------
-- Eliminar tablas Temporales
-- ----------------------------------------------------------------------
DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.POLIZA_EXP_SERV`;

SELECT 'OK' AS EJECUCION;

END;