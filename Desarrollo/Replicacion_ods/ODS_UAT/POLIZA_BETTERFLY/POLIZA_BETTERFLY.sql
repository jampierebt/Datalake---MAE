CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.temp.TMP_POLIZA_BETTERFLY_UNIVERSO_GCP`
AS
WITH TMP_COBERTURA AS (
SELECT 
numero_poliza
,MAX(CASE WHEN NOMBRE_COBERTURA='FALLECIMIENTO ACCIDENTAL' THEN SUMA_ASEGURADA END) AS capital_muerte_accidental
,MAX(CASE WHEN NOMBRE_COBERTURA='INVALIDEZ ACCIDENTAL' THEN SUMA_ASEGURADA END) AS capital_invalidez_accidental
FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_COBERTURA` POL
GROUP BY NUMERO_POLIZA
)
SELECT  
ASE.tipo_documento
, ASE.numero_documento
, POL.numero_poliza
, ASE.nombre as nombres
, ASE.apellido_paterno
, ASE.apellido_materno
, ASE.genero AS sexo
, ASE.fecha_nacimiento
, POL.monto_cobertura_principal AS capital_vida
, COB.capital_muerte_accidental
, COB.capital_invalidez_accidental
, POL.fecha_inicio
, POL.fecha_fin
, DP.correo_acsele AS correo_electronico
, DP.celular_acsele AS celular
, 'Perú' AS pais
, POL.plan
FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA` POL
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.ASEGURADO` ASE
       ON POL.NUMERO_POLIZA = ASE.NUMERO_POLIZA
LEFT JOIN `iter-data-storage-pv.master_party.V_MD_PERSONA` DP
       ON DP.HASH_ID = ASE.HASH_ID
LEFT JOIN TMP_COBERTURA COB
       ON POL.NUMERO_POLIZA = COB.NUMERO_POLIZA
WHERE POL.NOMBRE_PRODUCTO='BETTERFLYCOLECTIVO';

-- ------------------------------------------------------------------------------------
-- Paso 4: Exportar los archivos que sufrieron un cambio o son nuevos
-- ------------------------------------------------------------------------------------
EXPORT DATA OPTIONS(
URI='gs://interseguro-datalake-prd-landing/UAT/ODS/POLIZA_BETTERFLY/POLIZA_BETTERFLY-*.csv.gz',
FORMAT='CSV',
COMPRESSION='GZIP',
overwrite=true,
header=false,
field_delimiter='~'
) 
AS 
SELECT 
tipo_documento
,numero_documento
,numero_poliza
,nombres
,apellido_paterno
,apellido_materno
,genero
,fecha_nacimiento
,capital_vida
,capital_muerte_accidental
,capital_invalidez_accidental
,fecha_inicio
,fecha_fin
,correo_electronico
,celular
,pais
,plan
---FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA`
-- from `iter-data-storage-pv-uat.goldenrecord_data.POLIZA`
FROM `iter-data-storage-pv-uat.temp.TMP_POLIZA_BETTERFLY_UNIVERSO_GCP`
;


DROP TABLE IF EXISTS `iter-data-storage-pv-uat.temp.TMP_POLIZA_BETTERFLY_UNIVERSO_GCP` ;
