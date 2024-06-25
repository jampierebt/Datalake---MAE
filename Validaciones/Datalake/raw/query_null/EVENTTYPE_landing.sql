SELECT SUM(CASE WHEN TRIM(UPPER(PROD.description)) IS NULL AND TRIM(UPPER(UAT.description))="" THEN 1 ELSE 0 END) AS DIFF_description
,SUM(CASE WHEN TRIM(UPPER(PROD.automaticdate)) IS NULL AND TRIM(UPPER(UAT.automaticdate))="" THEN 1 ELSE 0 END) AS DIFF_automaticdate
,SUM(CASE WHEN TRIM(UPPER(PROD.effectivedate)) IS NULL AND TRIM(UPPER(UAT.effectivedate))="" THEN 1 ELSE 0 END) AS DIFF_effectivedate
,SUM(CASE WHEN TRIM(UPPER(PROD.ett_collection)) IS NULL AND TRIM(UPPER(UAT.ett_collection))="" THEN 1 ELSE 0 END) AS DIFF_ett_collection
,SUM(CASE WHEN TRIM(UPPER(PROD.ett_commission)) IS NULL AND TRIM(UPPER(UAT.ett_commission))="" THEN 1 ELSE 0 END) AS DIFF_ett_commission