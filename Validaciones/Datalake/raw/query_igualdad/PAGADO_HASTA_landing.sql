SELECT SUM(CASE WHEN TRIM(UPPER(PROD.numero_poliza))!=TRIM(UPPER(UAT.numero_poliza)) THEN 1 ELSE 0 END) AS DIFF_numero_poliza
,SUM(CASE WHEN TRIM(UPPER(PROD.id_producto))!=TRIM(UPPER(UAT.id_producto)) THEN 1 ELSE 0 END) AS DIFF_id_producto
,SUM(CASE WHEN PROD.fecha_pagado_hasta!=UAT.fecha_pagado_hasta THEN 1 ELSE 0 END) AS DIFF_fecha_pagado_hasta
,SUM(CASE WHEN PROD.fecha_proceso!=UAT.fecha_proceso THEN 1 ELSE 0 END) AS DIFF_fecha_proceso