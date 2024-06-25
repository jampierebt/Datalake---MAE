

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/PRD/ODS/CANAL/CANAL-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 


select cod_codigo codigo,
gls_larga nombre from `iter-data-storage-pv.raw_vesta_exp_serv.TAB_CODIGO_raw` 
WHERE upper(nom_tabla) = 'CANAL';
