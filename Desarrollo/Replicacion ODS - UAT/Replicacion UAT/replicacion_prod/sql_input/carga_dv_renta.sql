CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.carga_dv_renta()
OPTIONS(
  strict_mode=true)
BEGIN
/********************************************************************
* Proyecto		  : iter-data-storage-pv-uat
* Fecha			  : 23 / 12 / 2020
* Autor			  : Bluetab - Edson Huerta G.                               
* Descripción     : Vista de presupuesto de mercado y emision interseguro para RENTAS
*********************************************************************
*                       MODIFICACIONES POSTERIORES                  *
*===================================================================*
*=  Fecha   | Persona |           Modificación Realizada           =*
*===================================================================*                                    
*2021/01/18 |T.Ramirez| En caso el Presupuesto de Mercado y Represupuesto es NULL considerar 0. 
*********************************************************************/

CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.bi_finanzas.DV_RENTA` AS (

/*****DATAENTRY: temporal del presupuesto mercado*****/
with tmp_presupuesto_mercado AS (
SELECT * 
  FROM `iter-data-storage-pv-uat.external_data.DE_PRESUPUESTO_MERCADO` 
  WHERE RRVV='PPTO'
),
/*****DATAENTRY: temporal del represupuesto mercado*****/
tmp_represupuesto_mercado AS(
SELECT * 
  FROM `iter-data-storage-pv-uat.external_data.DE_PRESUPUESTO_MERCADO` 
 WHERE RRVV='RPPTO'
)
,
/**********TABLA TEMPORAL: Temporal que contiene las rentas de mercado a partir de MELER*************/
tmp_rentas_mercado as(
SELECT DISTINCT
A.*,
COALESCE(CAST(PM.MERCADO_2020 AS FLOAT64),0)   AS PPTO_RRVV,
COALESCE(CAST(RPM.MERCADO_2020 AS FLOAT64),0)  AS RPPTO_RVV,
FROM (
select DISTINCT
	'DAILY' DASHBOARD,
	'MERCADO' VISTA,
	(case sdpm.cod_modalidad
 	   when 'RP' then (select (CASE WHEN t.gls_corta_afp = 'INT' THEN 'INTERSEGURO' ELSE t.gls_corta_afp END) from `iter-data-storage-pv-uat.raw_vesta_exp_serv.T_AFP` t where t.cod_afp_sbs = ssm.cod_afp)
 	   else (select (CASE WHEN t.gls_corta_compania='INT' THEN 'INTERSEGURO' ELSE t.gls_corta_compania END) from `iter-data-storage-pv-uat.raw_vesta_exp_serv.T_CIASEG` t where t.cod_cia_sbs = sdpm.cod_afp_eess)
	end) AS COMPANIA,
	(case dpt.cod_depart when '15' then dpt.gls_depart else 'PROVINCIA' end) ZONA,
	dpt.gls_depart DEPARTAMENTO,
	sdpm.cod_modalidad MODALIDAD,
	CAST(p.fec_cierre_comercial AS DATE) FECHA_EMISION,
	CAST(FORMAT_DATE("%Y%m", CAST(p.fec_cierre_comercial AS DATE)) AS INT64) PERIODO_FECHA_EMISION,
	FORMAT_DATE("%Y-%m", CAST(p.fec_cierre_comercial AS DATE)) PERIODO_EMISION,
	FORMAT_DATE("%Y-%b", CAST(p.fec_cierre_comercial AS DATE)) ANIO_MES_EMISION,
	EXTRACT(MONTH FROM CAST(p.fec_cierre_comercial AS DATE)) NRO_MES_EMISION,
	FORMAT_DATETIME("%B", CAST(p.fec_cierre_comercial AS DATETIME)) MES_LARGO_EMISION,
	'' ID_MONEDA,
	(CASE UPPER(sdpm.cod_moneda) WHEN 'S/.AJ.' THEN 2123 WHEN 'S/.' THEN 2123 WHEN 'US$AJ.' THEN 2163 WHEN 'US$' THEN 2123 END) CURRENCYTARGETID,
	UPPER(sdpm.cod_moneda) MONEDA,
	sdpm.num_operacion SOLICITUD,
 	(case sdpm.cod_modalidad
 	   when 'RP' then 'AFP'
 	   else 'CIA_SEGURO'
 	end) RUBRO,
	'RENTA MERCADO' ID_PRODUCTO,
	'RENTA MERCADO' NOMBRE_PRODUCTO,
	pen.gls_tipo_pension TIPO_PENSION,
	(CASE  WHEN pen.gls_tipo_pension IN ('JUBILACION ANTICIPADA','JUBILACION') THEN 'JUBILACIÓN' WHEN pen.gls_tipo_pension='INVALIDEZ CON COBERTURA' THEN 'INVALIDEZ' WHEN pen.gls_tipo_pension='INVALIDEZ SIN COBERTURA' THEN 'INVALIDEZ' ELSE pen.gls_tipo_pension END) TIPO_RENTA,
	'' ID_GRUPO_PRODUCTO,
	'RENTA' NOMBRE_GRUPO_PRODUCTO,
	'' ESTADO_POLIZA,
	NULL CANTIDAD_POLIZA,
	CAST((case sdpm.cod_modalidad
           when 'RP' then ssm.val_saldo_cic
           else sdpm.val_monto_transferido
    end) AS FLOAT64) PRIMA_NETA,
	CAST(ssm.val_capital_pension AS FLOAT64) PRIMA_TOTAL,
	NULL CANTIDAD_POLIZA_PROYECCION,
	'REPLICA MELER' ID_FUENTE,
	'REPLICA MELER' NOMBRE_FUENTE,
	CURRENT_TIMESTAMP FECHA_CREACION_REGISTRO,
	SESSION_USER() USUARIO_CREACION
      from `iter-data-storage-pv-uat.raw_vesta_exp_serv.SBS_DET_PRODUC_MELER` sdpm 
inner join `iter-data-storage-pv-uat.raw_vesta_exp_serv.SBS_SOLICI_MELER` ssm 
		on sdpm.num_operacion = ssm.num_operacion 
inner join `iter-data-storage-pv-uat.raw_vesta_exp_serv.RVI_PROPUE_raw` p 
		on sdpm.num_operacion = p.num_solicitud 
 left join `iter-data-storage-pv-uat.raw_vesta_exp_serv.AGENTE` a 
		on p.num_vendedor = a.num_agente 
 left join `iter-data-storage-pv-uat.raw_vesta_exp_serv.AGENCI` ag 
	on a.cod_agencia = ag.cod_agencia 
 left join `iter-data-storage-pv-uat.raw_vesta_exp_serv.T_COMUNA` dis 
		on ag.cod_comuna = dis.cod_comuna 
 left join `iter-data-storage-pv-uat.raw_vesta_exp_serv.T_CIUDAD` prv 
		on dis.cod_ciudad = prv.cod_ciudad 
 left join  `iter-data-storage-pv-uat.raw_vesta_exp_serv.T_DEPART` dpt 
		on prv.cod_depart = dpt.cod_depart 
 left join `iter-data-storage-pv-uat.raw_vesta_exp_serv.T_TIPENS` pen 
		on p.cod_tipo_pension = pen.cod_tipo_pension
     where sdpm.ind_gana_no_gana = 'S'
       and p.fec_cierre_comercial < CURRENT_TIMESTAMP() -- EVALUAR SI SE CAMBIA POR UNA VARIABLE DE FECHA DE PROCESO (CONSULTAR CON LUIS)
) A 
left join tmp_presupuesto_mercado PM 
       on FORMAT_DATE('%m',A.FECHA_EMISION) = PM.MES 
      AND FORMAT_DATE('%Y',A.FECHA_EMISION) = PM.ANIO 
      AND A.COMPANIA='INTERSEGURO' 
LEFT JOIN tmp_represupuesto_mercado RPM 
       ON FORMAT_DATE('%m',A.FECHA_EMISION) = RPM.MES 
      AND FORMAT_DATE('%Y',A.FECHA_EMISION) = RPM.ANIO 
      AND A.COMPANIA='INTERSEGURO'
),

/**************Tipo de cambio || TOMA EL PRIMER DIA DEL MES(LOGICA PROPORCIONADA POR FREDDY)***************/
tmp_currency_final AS (
SELECT DISTINCT
	format_date('%Y-%m',cast(fec_inicial_rango as date)) PERIODO
	, VAL_DATO
 FROM `iter-data-storage-pv-uat.raw_vesta_exp_serv.VAL_RANFEC_raw` 
WHERE  cod_codigo = '010'
)

/***************Unificacion de las emisiones de interseguro(DV_EMISION) con el mercado(tmp_rentas_mercado). SE DIFERENCIA POR EL CAMPO VISTA*****************/
(
		SELECT
				'DAILY' DASHBOARD,
				'INTERSEGURO' VISTA,
				'INTERSEGURO' COMPANIA,
				'' ZONA,
				'' DEPARTAMENTO,
				'' MODALIDAD,
				POL.FECHA_EMISION,
				TIM.day_number DIA_CALENDARIO, 
				TIM.month_total_days DIAS_CALENDARIO_TOTAL,
				TIM.working_day_acum_date DIA_HABIL,
				TIM.working_day_acum_month DIAS_HABILES_TOTAL,
				POL.PERIODO_FECHA_EMISION,
				POL.ANIO_MES_EMISION,
				POL.NRO_MES_EMISION,
				POL.MES_LARGO_EMISION,
				POL.ID_MONEDA,
				POL.MONEDA,
				POL.TIPO_CAMBIO,
				'' SOLICITUD,
				'' RUBRO,
				POL.ID_PRODUCTO,
				POL.NOMBRE_PRODUCTO,
				POL.TIPO_PENSION,
				POL.TIPO_RENTA,
				POL.ID_GRUPO_PRODUCTO,
				POL.NOMBRE_GRUPO_PRODUCTO,
				CNFE.ESTADO_HOMOLOGADO ESTADO_POLIZA,
				COUNT(*) CANTIDAD_POLIZA,
				CAST(SUM(POL.PRIMA_NETA) AS FLOAT64) PRIMA_NETA,
				CAST(SUM(POL.PRIMA_NETA_SOLES) AS FLOAT64) PRIMA_NETA_SOLES,
				CAST(DEVRPP.PRESUPUESTO AS FLOAT64) AS PPTO_RRVV,
				CAST(DEVRPP.REPRESUPUESTO AS FLOAT64) AS RPPTO_RRVV,
				0 CANTIDAD_POLIZA_PROYECCION,
				POL.ID_FUENTE,
				UPPER(CNFF.NOMBRE_FUENTE) NOMBRE_FUENTE,
				CURRENT_TIMESTAMP FECHA_CREACION_REGISTRO,
				SESSION_USER() USUARIO_CREACION
			FROM `iter-data-storage-pv-uat.bi_finanzas.DV_EMISION` POL 
		LEFT JOIN `iter-data-storage-pv-uat.config_data.CNF_FUENTES` CNFF 
				ON POL.ID_FUENTE = CNFF.ID_FUENTE 
		LEFT JOIN `iter-data-storage-pv-uat.config_data.CNF_BI_ESTADOS` CNFE 
				ON POL.ESTADO = CNFE.ESTADO 
		LEFT JOIN `iter-data-storage-pv-uat.external_data.DE_PPTO_RRPTO_RENTAS` DEVRPP 
				ON TRIM(POL.NOMBRE_PRODUCTO) = TRIM(UPPER(DEVRPP.SUBRAMO)) 
			AND FORMAT_DATE("%Y", POL.FECHA_EMISION) = DEVRPP.ANIO 
			AND FORMAT_DATE("%m", POL.FECHA_EMISION) = DEVRPP.MES 
		LEFT JOIN `iter-data-storage-pv-uat.bi_finanzas.DIM_TIEMPO` TIM 
				ON POL.FECHA_EMISION = TIM.DATE
			WHERE POL.NOMBRE_GRUPO_PRODUCTO = 'RENTA'
		GROUP BY
				NOMBRE_GRUPO_PRODUCTO,
				DEVRPP.PRESUPUESTO,
				DEVRPP.REPRESUPUESTO,
				FECHA_EMISION,
				TIM.day_number, 
				TIM.month_total_days,
				TIM.working_day_acum_date,
				TIM.working_day_acum_month,
				POL.PERIODO_FECHA_EMISION,
				POL.ANIO_MES_EMISION,
				POL.NRO_MES_EMISION,
				POL.MES_LARGO_EMISION,
				ID_MONEDA,
				MONEDA,
				TIPO_CAMBIO,
				ID_PRODUCTO,
				NOMBRE_PRODUCTO,
				TIPO_PENSION,
				TIPO_RENTA,
				ID_GRUPO_PRODUCTO,
				CNFE.ESTADO_HOMOLOGADO,
				FRECUENCIA_PAGO,
				ID_FUENTE,
				CNFF.NOMBRE_FUENTE
		UNION ALL
		SELECT DISTINCT
				RM.DASHBOARD,
				RM.VISTA,
				RM.COMPANIA,
				RM.ZONA,
				RM.DEPARTAMENTO,
				RM.MODALIDAD,
				RM.FECHA_EMISION,
				TIM.day_number DIA_CALENDARIO, 
				TIM.month_total_days DIAS_CALENDARIO_TOTAL,
				TIM.working_day_acum_date DIA_HABIL,
				TIM.working_day_acum_month DIAS_HABILES_TOTAL,
				RM.PERIODO_FECHA_EMISION,
				RM.ANIO_MES_EMISION,
				RM.NRO_MES_EMISION,
				RM.MES_LARGO_EMISION,
				RM.ID_MONEDA,
				RM.MONEDA,
				CR.VAL_DATO TIPO_CAMBIO,
				RM.SOLICITUD,
				RM.RUBRO,
				RM.ID_PRODUCTO,
				RM.NOMBRE_PRODUCTO,
				RM.TIPO_PENSION,
				RM.TIPO_RENTA,
				RM.ID_GRUPO_PRODUCTO,
				RM.NOMBRE_GRUPO_PRODUCTO,
				RM.ESTADO_POLIZA,
				RM.CANTIDAD_POLIZA,
				RM.PRIMA_NETA,
				CAST((CASE WHEN RM.MONEDA IN ('S/.AJ.','S/.') THEN RM.PRIMA_NETA ELSE (RM.PRIMA_NETA*CR.VAL_DATO) END) AS FLOAT64) PRIMA_NETA_SOLES,
				RM.PPTO_RRVV,
				RM.RPPTO_RVV,
				RM.CANTIDAD_POLIZA_PROYECCION,
				RM.ID_FUENTE,
				RM.NOMBRE_FUENTE,
				RM.FECHA_CREACION_REGISTRO,
				RM.USUARIO_CREACION
			FROM tmp_rentas_mercado RM
		LEFT JOIN tmp_currency_final CR 
				ON RM.PERIODO_EMISION = CR.PERIODO 
		LEFT JOIN `iter-data-storage-pv-uat.bi_finanzas.DIM_TIEMPO` TIM 
				ON RM.FECHA_EMISION = TIM.DATE
UNION ALL 
-- ----------------------------------------------------------------------
-- Paso A10: DataEntry APESEG con información de MERCADO - RENTA PARTICULAR de las COMPANIAS - Rimac,Positiva,Crecer,Camara ,etc.
-- ----------------------------------------------------------------------
SELECT DISTINCT
         'DAILY'                           AS DASHBOARD
        ,'MERCADO'                         AS VISTA
        ,DE.COD_COMPANIA                AS COMPANIA 
        ,''                             AS ZONA
        ,''                             AS DEPARTAMENTO
        ,''                             AS MODALIDAD
        ,PARSE_DATE("%Y%m%d",CONCAT(TRIM(DE.CODMES),'01')) AS FECHA_EMISION
        ,TIM.day_number                            AS DIA_CALENDARIO
        ,TIM.month_total_days                      AS DIAS_CALENDARIO_TOTAL
        ,TIM.working_day_acum_date                 AS DIA_HABIL
        ,TIM.working_day_acum_month                AS DIAS_HABILES_TOTAL
        ,CAST(DE.CODMES AS INT64)                  AS PERIODO_FECHA_EMISION
        ,DE.ANIO                                   AS ANIO_MES_EMISION 
        ,EXTRACT(MONTH FROM PARSE_DATE("%Y%m%d",CONCAT(TRIM(CODMES),'01')))   AS NRO_MES_EMISION
        ,FORMAT_DATETIME("%B",PARSE_DATE("%Y%m%d",CONCAT(TRIM(CODMES),'01'))) AS MES_LARGO_EMISION
        ,''                                 AS ID_MONEDA
        ,''                                 AS MONEDA
        ,CAST(NULL AS FLOAT64)                 AS TIPO_CAMBIO
        ,''                                 AS SOLICITUD
        ,''                                 AS RUBRO
        ,'RPP'                 AS ID_PRODUCTO
        ,'RENTA PARTICULAR'    AS NOMBRE_PRODUCTO
        ,'TITULARES'           AS TIPO_PENSION
        ,'RENTA PRIVADA'       AS TIPO_RENTA
        ,'RENTA MERCADO'       AS ID_GRUPO_PRODUCTO
        ,'RENTA MERCADO'       AS NOMBRE_GRUPO_PRODUCTO
        ,''                    AS ESTADO_POLIZA
        ,CAST(NULL AS INT64)   AS CANTIDAD_POLIZA
        ,DE.MONTO              AS PRIMA_NETA
        ,CAST(0 AS FLOAT64) AS PRIMA_NETA_SOLES
        ,CAST(0 AS FLOAT64) AS PPTO_RVRV
        ,CAST(0 AS FLOAT64) AS RPPTO_RRVV
        ,CAST(NULL AS INT64) AS CANTIDAD_POLIZA_PROYECCION
        ,'F0011'                  AS ID_FUENTE
        ,'DATAENTRY APESEG'       AS NOMBRE_FUENTE
        ,CURRENT_TIMESTAMP     AS FECHA_CREACION_REGISTRO
        ,SESSION_USER()        AS USUARIO_CREACION
      FROM `iter-data-storage-pv-uat.inputfiles.DE_APESEG` DE
INNER JOIN `iter-data-storage-pv-uat.bi_finanzas.DIM_TIEMPO` TIM 
        ON PARSE_DATE("%Y%m%d",CONCAT(TRIM(DE.CODMES),'01')) = TIM.DATE
   --  WHERE DE.COD_COMPANIA <> 'INTERSEGURO'
)

);

SELECT 'OK' ESTADO_EJECUCION;

END;