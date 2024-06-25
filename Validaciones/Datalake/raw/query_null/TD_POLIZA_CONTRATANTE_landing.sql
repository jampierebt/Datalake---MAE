SELECT SUM(CASE WHEN TRIM(UPPER(PROD.numero_poliza)) IS NULL AND TRIM(UPPER(UAT.numero_poliza))="" THEN 1 ELSE 0 END) AS DIFF_numero_poliza
,SUM(CASE WHEN TRIM(UPPER(PROD.auditdate_system_date)) IS NULL AND TRIM(UPPER(UAT.auditdate_system_date))="" THEN 1 ELSE 0 END) AS DIFF_auditdate_system_date
,SUM(CASE WHEN TRIM(UPPER(PROD.operation_datetime)) IS NULL AND TRIM(UPPER(UAT.operation_datetime))="" THEN 1 ELSE 0 END) AS DIFF_operation_datetime
,SUM(CASE WHEN TRIM(UPPER(PROD.id_producto)) IS NULL AND TRIM(UPPER(UAT.id_producto))="" THEN 1 ELSE 0 END) AS DIFF_id_producto
,SUM(CASE WHEN TRIM(UPPER(PROD.nombre_producto)) IS NULL AND TRIM(UPPER(UAT.nombre_producto))="" THEN 1 ELSE 0 END) AS DIFF_nombre_producto
,SUM(CASE WHEN TRIM(UPPER(PROD.status_operation)) IS NULL AND TRIM(UPPER(UAT.status_operation))="" THEN 1 ELSE 0 END) AS DIFF_status_operation
,SUM(CASE WHEN TRIM(UPPER(PROD.description)) IS NULL AND TRIM(UPPER(UAT.description))="" THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN TRIM(UPPER(PROD.estado_poliza)) IS NULL AND TRIM(UPPER(UAT.estado_poliza))="" THEN 1 ELSE 0 END) AS DIFF_estado_poliza