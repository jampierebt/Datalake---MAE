SELECT specific_name,REPLACE(ddl,'`iter-data-storage-pv`.programs','`iter-data-storage-pv-uat`.programs_bk') AS DDL
FROM `iter-data-storage-pv.programs.INFORMATION_SCHEMA.ROUTINES`
WHERE specific_name LIKE '%goldenrecord%'

;

-- BK
SELECT * FROM `iter-data-storage-pv.master_product.PLNT_STORE_PROCEDURE_HIST` 