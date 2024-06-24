SELECT SUM(CASE WHEN PROD.policyid!=UAT.policyid THEN 1 ELSE 0 END) AS DIFF_policyid
,SUM(CASE WHEN PROD.policy_height!=UAT.policy_height THEN 1 ELSE 0 END) AS DIFF_policy_height
,SUM(CASE WHEN PROD.ref_percentage!=UAT.ref_percentage THEN 1 ELSE 0 END) AS DIFF_ref_percentage