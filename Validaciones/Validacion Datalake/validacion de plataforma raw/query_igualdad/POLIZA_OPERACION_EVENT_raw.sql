SELECT SUM(CASE WHEN TRIM(UPPER(PROD.numero_poliza))!=TRIM(UPPER(UAT.numero_poliza)) THEN 1 ELSE 0 END) AS DIFF_numero_poliza
,SUM(CASE WHEN PROD.operacion!=UAT.operacion THEN 1 ELSE 0 END) AS DIFF_operacion
,SUM(CASE WHEN TRIM(UPPER(PROD.id_poliza))!=TRIM(UPPER(UAT.id_poliza)) THEN 1 ELSE 0 END) AS DIFF_id_poliza
,SUM(CASE WHEN TRIM(UPPER(PROD.fecha_vigencia_inicio))!=TRIM(UPPER(UAT.fecha_vigencia_inicio)) THEN 1 ELSE 0 END) AS DIFF_fecha_vigencia_inicio
,SUM(CASE WHEN TRIM(UPPER(PROD.fecha_vigencia_fin))!=TRIM(UPPER(UAT.fecha_vigencia_fin)) THEN 1 ELSE 0 END) AS DIFF_fecha_vigencia_fin
,SUM(CASE WHEN TRIM(UPPER(PROD.frecuencia_poliza))!=TRIM(UPPER(UAT.frecuencia_poliza)) THEN 1 ELSE 0 END) AS DIFF_frecuencia_poliza
,SUM(CASE WHEN TRIM(UPPER(PROD.productid))!=TRIM(UPPER(UAT.productid)) THEN 1 ELSE 0 END) AS DIFF_productid
,SUM(CASE WHEN TRIM(UPPER(PROD.fecha_emision))!=TRIM(UPPER(UAT.fecha_emision)) THEN 1 ELSE 0 END) AS DIFF_fecha_emision
,SUM(CASE WHEN TRIM(UPPER(PROD.nombre_producto))!=TRIM(UPPER(UAT.nombre_producto)) THEN 1 ELSE 0 END) AS DIFF_nombre_producto
,SUM(CASE WHEN TRIM(UPPER(PROD.auditdate_system_date))!=TRIM(UPPER(UAT.auditdate_system_date)) THEN 1 ELSE 0 END) AS DIFF_auditdate_system_date
,SUM(CASE WHEN TRIM(UPPER(PROD.operation_date))!=TRIM(UPPER(UAT.operation_date)) THEN 1 ELSE 0 END) AS DIFF_operation_date
,SUM(CASE WHEN TRIM(UPPER(PROD.operation_datetime))!=TRIM(UPPER(UAT.operation_datetime)) THEN 1 ELSE 0 END) AS DIFF_operation_datetime
,SUM(CASE WHEN TRIM(UPPER(PROD.estado_poliza))!=TRIM(UPPER(UAT.estado_poliza)) THEN 1 ELSE 0 END) AS DIFF_estado_poliza
,SUM(CASE WHEN TRIM(UPPER(PROD.Effective_Date_From))!=TRIM(UPPER(UAT.Effective_Date_From)) THEN 1 ELSE 0 END) AS DIFF_Effective_Date_From
,SUM(CASE WHEN TRIM(UPPER(PROD.Effective_Date_To))!=TRIM(UPPER(UAT.Effective_Date_To)) THEN 1 ELSE 0 END) AS DIFF_Effective_Date_To
,SUM(CASE WHEN TRIM(UPPER(PROD.PROCESS_TYPE))!=TRIM(UPPER(UAT.PROCESS_TYPE)) THEN 1 ELSE 0 END) AS DIFF_PROCESS_TYPE
,SUM(CASE WHEN TRIM(UPPER(PROD.STATUS_OPERATION))!=TRIM(UPPER(UAT.STATUS_OPERATION)) THEN 1 ELSE 0 END) AS DIFF_STATUS_OPERATION
,SUM(CASE WHEN TRIM(UPPER(PROD.event))!=TRIM(UPPER(UAT.event)) THEN 1 ELSE 0 END) AS DIFF_event
,SUM(CASE WHEN TRIM(UPPER(PROD.validationerror))!=TRIM(UPPER(UAT.validationerror)) THEN 1 ELSE 0 END) AS DIFF_validationerror
,SUM(CASE WHEN TRIM(UPPER(PROD.concept_neta))!=TRIM(UPPER(UAT.concept_neta)) THEN 1 ELSE 0 END) AS DIFF_concept_neta
,SUM(CASE WHEN PROD.prima_neta!=UAT.prima_neta THEN 1 ELSE 0 END) AS DIFF_prima_neta
,SUM(CASE WHEN TRIM(UPPER(PROD.concept_total))!=TRIM(UPPER(UAT.concept_total)) THEN 1 ELSE 0 END) AS DIFF_concept_total
,SUM(CASE WHEN PROD.prima_total!=UAT.prima_total THEN 1 ELSE 0 END) AS DIFF_prima_total
,SUM(CASE WHEN PROD.igv!=UAT.igv THEN 1 ELSE 0 END) AS DIFF_igv
,SUM(CASE WHEN PROD.prima_total_anual!=UAT.prima_total_anual THEN 1 ELSE 0 END) AS DIFF_prima_total_anual
,SUM(CASE WHEN PROD.prima_neta_anual!=UAT.prima_neta_anual THEN 1 ELSE 0 END) AS DIFF_prima_neta_anual
,SUM(CASE WHEN PROD.prima_bruta_anual!=UAT.prima_bruta_anual THEN 1 ELSE 0 END) AS DIFF_prima_bruta_anual
,SUM(CASE WHEN PROD.igv_anual!=UAT.igv_anual THEN 1 ELSE 0 END) AS DIFF_igv_anual
,SUM(CASE WHEN PROD.devolucion!=UAT.devolucion THEN 1 ELSE 0 END) AS DIFF_devolucion
,SUM(CASE WHEN TRIM(UPPER(PROD.moneda))!=TRIM(UPPER(UAT.moneda)) THEN 1 ELSE 0 END) AS DIFF_moneda
,SUM(CASE WHEN TRIM(UPPER(PROD.tipo_producto))!=TRIM(UPPER(UAT.tipo_producto)) THEN 1 ELSE 0 END) AS DIFF_tipo_producto
,SUM(CASE WHEN TRIM(UPPER(PROD.oficina))!=TRIM(UPPER(UAT.oficina)) THEN 1 ELSE 0 END) AS DIFF_oficina
,SUM(CASE WHEN TRIM(UPPER(PROD.indicador_renovacion))!=TRIM(UPPER(UAT.indicador_renovacion)) THEN 1 ELSE 0 END) AS DIFF_indicador_renovacion
,SUM(CASE WHEN TRIM(UPPER(PROD.tipo_moneda))!=TRIM(UPPER(UAT.tipo_moneda)) THEN 1 ELSE 0 END) AS DIFF_tipo_moneda
,SUM(CASE WHEN TRIM(UPPER(PROD.tipo_vigencia))!=TRIM(UPPER(UAT.tipo_vigencia)) THEN 1 ELSE 0 END) AS DIFF_tipo_vigencia
,SUM(CASE WHEN TRIM(UPPER(PROD.vigencia))!=TRIM(UPPER(UAT.vigencia)) THEN 1 ELSE 0 END) AS DIFF_vigencia
,SUM(CASE WHEN TRIM(UPPER(PROD.fecha_proxima_facturacion))!=TRIM(UPPER(UAT.fecha_proxima_facturacion)) THEN 1 ELSE 0 END) AS DIFF_fecha_proxima_facturacion
,SUM(CASE WHEN TRIM(UPPER(PROD.canal_venta))!=TRIM(UPPER(UAT.canal_venta)) THEN 1 ELSE 0 END) AS DIFF_canal_venta
,SUM(CASE WHEN TRIM(UPPER(PROD.fecha_proxima_imagen_prima))!=TRIM(UPPER(UAT.fecha_proxima_imagen_prima)) THEN 1 ELSE 0 END) AS DIFF_fecha_proxima_imagen_prima
,SUM(CASE WHEN TRIM(UPPER(PROD.fecha_evento_anterior))!=TRIM(UPPER(UAT.fecha_evento_anterior)) THEN 1 ELSE 0 END) AS DIFF_fecha_evento_anterior
,SUM(CASE WHEN TRIM(UPPER(PROD.tipo_poliza))!=TRIM(UPPER(UAT.tipo_poliza)) THEN 1 ELSE 0 END) AS DIFF_tipo_poliza
,SUM(CASE WHEN TRIM(UPPER(PROD.fecha_suspension_cancelacion))!=TRIM(UPPER(UAT.fecha_suspension_cancelacion)) THEN 1 ELSE 0 END) AS DIFF_fecha_suspension_cancelacion
,SUM(CASE WHEN TRIM(UPPER(PROD.flag_suspension_cancelacion))!=TRIM(UPPER(UAT.flag_suspension_cancelacion)) THEN 1 ELSE 0 END) AS DIFF_flag_suspension_cancelacion
,SUM(CASE WHEN TRIM(UPPER(PROD.nombre_archivo_trama))!=TRIM(UPPER(UAT.nombre_archivo_trama)) THEN 1 ELSE 0 END) AS DIFF_nombre_archivo_trama
,SUM(CASE WHEN TRIM(UPPER(PROD.numero_plan))!=TRIM(UPPER(UAT.numero_plan)) THEN 1 ELSE 0 END) AS DIFF_numero_plan
,SUM(CASE WHEN TRIM(UPPER(PROD.nombre_asegurado))!=TRIM(UPPER(UAT.nombre_asegurado)) THEN 1 ELSE 0 END) AS DIFF_nombre_asegurado
,SUM(CASE WHEN TRIM(UPPER(PROD.nombre_beneficiario))!=TRIM(UPPER(UAT.nombre_beneficiario)) THEN 1 ELSE 0 END) AS DIFF_nombre_beneficiario
,SUM(CASE WHEN TRIM(UPPER(PROD.prima_trama))!=TRIM(UPPER(UAT.prima_trama)) THEN 1 ELSE 0 END) AS DIFF_prima_trama
,SUM(CASE WHEN TRIM(UPPER(PROD.fecha_carga_sistema_prepo))!=TRIM(UPPER(UAT.fecha_carga_sistema_prepo)) THEN 1 ELSE 0 END) AS DIFF_fecha_carga_sistema_prepo
,SUM(CASE WHEN TRIM(UPPER(PROD.numero_cotizacion))!=TRIM(UPPER(UAT.numero_cotizacion)) THEN 1 ELSE 0 END) AS DIFF_numero_cotizacion
,SUM(CASE WHEN TRIM(UPPER(PROD.numero_propuesta))!=TRIM(UPPER(UAT.numero_propuesta)) THEN 1 ELSE 0 END) AS DIFF_numero_propuesta
,SUM(CASE WHEN TRIM(UPPER(PROD.numero_solicitud))!=TRIM(UPPER(UAT.numero_solicitud)) THEN 1 ELSE 0 END) AS DIFF_numero_solicitud
,SUM(CASE WHEN TRIM(UPPER(PROD.correo))!=TRIM(UPPER(UAT.correo)) THEN 1 ELSE 0 END) AS DIFF_correo
,SUM(CASE WHEN TRIM(UPPER(PROD.usuario_cot))!=TRIM(UPPER(UAT.usuario_cot)) THEN 1 ELSE 0 END) AS DIFF_usuario_cot
,SUM(CASE WHEN TRIM(UPPER(PROD.id_canal))!=TRIM(UPPER(UAT.id_canal)) THEN 1 ELSE 0 END) AS DIFF_id_canal