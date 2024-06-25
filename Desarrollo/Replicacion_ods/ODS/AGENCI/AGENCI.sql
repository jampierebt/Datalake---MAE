

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/AGENCI/AGENCI-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 

select  distinct 
cod_agencia codigo,
cod_canal cod_canal,
nom_agencia nombre
 from `iter-data-storage-pv.raw_vesta_exp_serv.AGENCI`
;
