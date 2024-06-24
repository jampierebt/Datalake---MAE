CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.sp_goldenrecord_plnt_operaciones_masivos_certificado()
OPTIONS(
  strict_mode=true)
BEGIN
CREATE OR REPLACE TABLE `iter-data-storage-pv-uat.master_transaction.PLNT_OPERACIONES_MASIVOS_CERTIFICADO` 
AS
WITH TBL_PRODUCTO AS 
(
  SELECT CAST(PRD.ID_PRODUCTO AS STRING) ID_PRODUCTO, PRD.NOMBRE_PRODUCTO
  FROM `iter-data-storage-pv-uat.acsele_data.TD_PRODUCTO_raw` PRD 
  WHERE PRD.ID_PRODUCTO IN (
    69747, --PTINDIVIDUALOH
    56757, --EXTRACASHFUNO
    68939, --PTINDIVIDUALIBK
    69545, --PROTECCIONCREDITOSSCC
    77869, --PTDIGITALOH
    77989, --NUEVODESEMPLEO
    78029, --BETTERFLYCOLECTIVO
    31401, --EXTRACASH
    31404, --VIDALEYTTL
    69141, --PROTECCIONCREDITOS
    77929, --RENTAHOSPITALARIA
    31403, --EXTRACASHSCC
    78049, --SEGUROTARJETA360
    28037, --VEAVIDA
    24917, --PROTECCIONFAMILIAR
    26437, --PROTECCIONDEBITO
    24877, --PROTECCIONBLINDAJE
    44739, --PROTBLINDAJEINDIVIDUALPLUS
    48779, --PROTBLINDAJEINDIVIPLUSFUNO
    28837, --PROTECCIONBLINDAJEPLUS
    30437, --TARJETADEDEBITO
    29637, --TARJETADECREDITO
    27277, --ACCIDENTEASISTENCIAOH
    35440, --INTERBANKACCIDENTES
    27237,  --VEAACCIDENTES    
    --
    78029, --BETTERFLYCOLECTIVO
    60859, --DESGHIPOTECARIOINDIVIDUAL
    61263, --DESGPERSONALINDIVIDUAL
    35442, --DESGRAVAMENHIPOTECARIO
    35450, --DESGRAVAMENPERSONAL
    35447, --DESGRAVAMENTARJETAS
    35445, --DESGRAVAMENVEHICULAR
    73585, --DESGTARJETASINDIVIDUAL
    61061, --DESGVEHICULARINDIVIDUAL
    77827, --REFINANCIADO
    73989, --SEGUROVEHICULAR
    77849, --SEGUROVEHICULARMODULAR
    78009, --DESGPERSONALFACTINDIVIDUAL
    35448  --SOAT   
)),
TBL_PRIMERA AS
(
  SELECT OPE.NUMERO_POLIZA, OPE.USUARIO_COT, OPE.FECHA_MOVIMIENTO, OPE.FECHA_PROCESO, CAST(OPE.FECHA_CARGA_SISTEMA_PREPO AS DATE) FECHA_CARGA_SISTEMA_PREPO
  FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION` OPE
  INNER JOIN TBL_PRODUCTO PRD ON OPE.ID_PRODUCTO = PRD.ID_PRODUCTO
  WHERE OPE.DESCRIPCION_EVENTO = 'EMITIR'
  AND OPE.ESTADO_OPERACION='Applied operation'
),
TBL_TOTAL_OI AS
(
  SELECT OPE.NUMERO_POLIZA, MAX(OPENITEMID) ULT_OPENITEMID, SUM(CAST(OI.AMOUNT AS NUMERIC)) AMOUNT
  FROM `iter-data-storage-pv-uat.acsele_data.OPENITEM_raw` OI
  INNER JOIN `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION` OPE ON OI.OPERATIONPK = OPE.NUMERO_OPERACION
  INNER JOIN TBL_PRODUCTO PRD ON OPE.ID_PRODUCTO = PRD.ID_PRODUCTO
  WHERE OI.STATUS = 'applied'
  AND OI.DTY_ID = 7572   --PimaEmitida
  AND OPE.ESTADO_OPERACION='Applied operation'
  GROUP BY OPE.NUMERO_POLIZA
),
TBL_ULTIMO_OI AS
(
  SELECT TOI.NUMERO_POLIZA, OPENITEMID, CAST(OI.AMOUNT AS NUMERIC) AMOUNT, OI.OPENITEMDATE, OI.DOCDATE, OI.DATEUSERECIPENT
  FROM `iter-data-storage-pv-uat.acsele_data.OPENITEM_raw` OI
  INNER JOIN TBL_TOTAL_OI TOI ON OI.OPENITEMID = TOI.ULT_OPENITEMID
),
TBL_DEVUELTO_OI AS
(
  SELECT OPE.NUMERO_POLIZA, SUM(CAST(OI.AMOUNT AS NUMERIC)) AMOUNT
  FROM `iter-data-storage-pv-uat.acsele_data.OPENITEM_raw` OI
  INNER JOIN `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION` OPE ON OI.OPERATIONPK = OPE.NUMERO_OPERACION
  INNER JOIN TBL_PRODUCTO PRD ON OPE.ID_PRODUCTO = PRD.ID_PRODUCTO
  WHERE OI.STATUS = 'applied'
  AND OI.DTY_ID = 7612 --PrimaDevuelta
  AND OPE.ESTADO_OPERACION='Applied operation'
  GROUP BY OPE.NUMERO_POLIZA
)
SELECT OPE.NUMERO_POLIZA NUMEROCERTIFICADO,
  CASE WHEN STRPOS(OPE.NUMERO_POLIZA, '-') > 0 THEN LEFT(OPE.NUMERO_POLIZA, (STRPOS(OPE.NUMERO_POLIZA, '-') - 1)) ELSE OPE.NUMERO_POLIZA END NUMERO_POLIZA,
  POL.ID_RAMO CODIGORAMO,
  POL.RAMO RAMO,
  POL.ID_SUBRAMO CODIGOOSUBRAMO,
  POL.SUBRAMO SUBRAMO,
  POL.ID_PRODUCTO IDPRODUCTO,
  POL.NOMBRE_PRODUCTO PRODUCTO,
  OPE.NUMERO_PLAN NUMEROPLAN,
  OPE.MONEDA MONEDA,
  POL.ESTADO ESTADO,
  FORMAT_DATE("%d/%m/%Y", POL.FECHA_EMISION) FECHAVENTA,
  --
  POL.FECHA_HORA_VENTA OIH_AUDITDATE,
  POL.FECHA_EMISION,
  --
  FORMAT_DATE("%d/%m/%Y", CAST(OPE.FECHA_CARGA_SISTEMA_PREPO AS DATE)) FECHAEMISIONACSELE,
  FORMAT_DATE("%d/%m/%Y", OPE.FECHA_VIGENCIA_INICIO) INICIOVIGENCIA,
  FORMAT_DATE("%d/%m/%Y", OPE.FECHA_VIGENCIA_FIN) FINVIGENCIA,
  CASE WHEN CURRENT_DATE() BETWEEN CAST(UOI.DOCDATE AS DATE) AND CAST(UOI.DATEUSERECIPENT AS DATE) THEN 'applied' ELSE '' END SITUACION_COBRANZA,
  NULL VIACOBRO,
  NULL NUMCUENTACOBRO,
  FORMAT_DATE("%d", UOI.OPENITEMDATE) NUMDIACOBRO,
  COALESCE(OPE.PRIMA_NETA, POL.PRIMA_NETA) PRIMANETA,
  --CASE WHEN POL.VIGENCIA='MENSUAL' THEN COALESCE(OPE.PRIMA_NETA, 0) ELSE COALESCE(OPE.PRIMA_NETA_ANUAL, 0) END PRIMANETA,
  0 PRIMAEMISION,
  COALESCE(OPE.IGV, 0) IGV,
  --CASE WHEN POL.VIGENCIA='MENSUAL' THEN COALESCE(OPE.IGV, 0) ELSE COALESCE(OPE.IGV_ANUAL, 0) END IGV,
  CASE WHEN OPE.PRIMA_TOTAL > 0 THEN OPE.PRIMA_TOTAL ELSE POL.PRIMA_TOTAL END PRIMABRUTA,
  --CASE WHEN POL.VIGENCIA='MENSUAL' THEN CASE WHEN COALESCE(OPE.PRIMA_TOTAL, 0) > 0 THEN COALESCE(OPE.PRIMA_TOTAL, 0) ELSE COALESCE(POL.PRIMA_TOTAL, 0) END ELSE COALESCE(OPE.PRIMA_TOTAL_ANUAL, 0) END PRIMABRUTA,
  OPE.FRECUENCIA_POLIZA FRECUENCIAPAGO,
  FORMAT_DATE("%d/%m/%Y", UOI.DATEUSERECIPENT) PAGADOHASTA,
  OPE.FRECUENCIA_POLIZA PERIODOCOBERTURA,
  CASE 
    WHEN OPE.FRECUENCIA_POLIZA = 'PagoUnico' THEN CAST(OPE.PRIMA_TOTAL AS FLOAT64)
    WHEN OPE.ID_PRODUCTO IN ('77989','69141','69545','56757','31401','31403') THEN CAST(OPE.PRIMA_TOTAL AS FLOAT64) 
    ELSE CAST(0 AS FLOAT64)
  END PRIMAPAGOUNICO,
  0 PORCENTAJETASAVENTA,
  FORMAT_DATE("%d/%m/%Y", OPE.FECHA_OPERACION) FECHAINICIOESTADO,
  CON.TIPO_DOCUMENTO CONTRATANTE_TIPODOCUMENTO,
  CON.NUMERO_DOCUMENTO CONTRATANTE_RUT,
  CASE WHEN CON.TIPO_DOCUMENTO = 'REGISTRO UNICO DE CONTRIBUYENTE' AND SUBSTR(CON.NUMERO_DOCUMENTO, 1, 2) = '20' THEN CON.RAZON_SOCIAL ELSE CONCAT(COALESCE(CON.NOMBRE, ''), ' ', COALESCE(CON.APELLIDO_PATERNO, ''), ' ',COALESCE(CON.APELLIDO_MATERNO, '')) END CONTRATANTE_NOMBRE,
  COALESCE(PER.CELULAR, PER.TELEFONO) TELEFONO,
  --
  PER.DIRECCION,
  PER.DISTRITO,
  PER.PROVINCIA,
  PER.DEPARTAMENTO,
  --
  CASE WHEN OPE.PRIMA_TOTAL > 0 THEN OPE.PRIMA_TOTAL ELSE POL.PRIMA_TOTAL END PRIMAFORMAPAGO,
  OPE.OFICINA AGENCIA,
  --
  AGE.NOM_AGENCIA, 
  AGE.COD_CANAL CANAL,
  --
  ASE.TIPO_DOCUMENTO ASEGURADO_TIPODOCUMENTO,
  ASE.NUMERO_DOCUMENTO ASEGURADO_RUT,
  CONCAT(COALESCE(ASE.NOMBRE, ''), ' ', COALESCE(ASE.APELLIDO_PATERNO, ''), ' ',COALESCE(ASE.APELLIDO_MATERNO, '')) ASEGURADO_NOMBRE,
  FORMAT_DATE("%d/%m/%Y", ASE.FECHA_NACIMIENTO) ASEGURADO_FECHANACIMIENTO,
  PRI.USUARIO_COT USUARIOCREACION,
  CASE WHEN OPE.ID_PRODUCTO = '78029' THEN FORMAT_DATE("%d/%m/%Y", PRI.FECHA_CARGA_SISTEMA_PREPO) ELSE FORMAT_DATE("%d/%m/%Y", PRI.FECHA_MOVIMIENTO) END FECHACREACION,
  OPE.USUARIO_COT USUARIOMODIFICACION,
  CASE WHEN OPE.ID_PRODUCTO = '78029' THEN FORMAT_DATE("%d/%m/%Y", OPE.FECHA_HORA_OPERACION) ELSE FORMAT_DATE("%d/%m/%Y", OPE.FECHA_MOVIMIENTO) END FECHAMODIFICACION,
  OPE.MOTIVO_MOVIMIENTO MOTIVOANULACION,
  POL.NOMBRE_ARCHIVO_TRAMA ARCHIVOULTIMACARGA,
  CASE WHEN OPE.DESCRIPCION_EVENTO = 'ANULAR' THEN (CASE WHEN OPE.ID_PRODUCTO = '78029' THEN FORMAT_DATE("%d/%m/%Y", OPE.FECHA_OPERACION_REG_SISTEMA) ELSE FORMAT_DATE("%d/%m/%Y", OPE.FECHA_OPERACION) END) ELSE NULL END FECHACARGATRAMABAJA,
  COALESCE(UOI.AMOUNT, 0) MONTOULTIMAPRIMAPAGADA, 
  COALESCE(TOI.AMOUNT, 0) MONTOTOTALPRIMASPAGADAS,
  FORMAT_DATE("%d/%m/%Y", UOI.OPENITEMDATE) FECHASINCRONIZACIONULTIMAPRIMA, 
  CASE WHEN OPE.DESCRIPCION_EVENTO = 'ANULAR' THEN COALESCE(CAST(UOI.AMOUNT AS FLOAT64), CAST(0 AS FLOAT64)) ELSE CAST(0 AS FLOAT64) END MONTOOISINCRONIZADOPOSTCANCELACION,
  CASE WHEN OPE.DESCRIPCION_EVENTO = 'ANULAR' THEN COALESCE(CAST(DOI.AMOUNT AS FLOAT64), CAST(0 AS FLOAT64)) ELSE CAST(0 AS FLOAT64) END MONTOPRIMADEVUELTA,
  NULL IDCERTIFICADO,  --PREPOLICY
  POL.NUMERO_OPERACION IDOPERACION,
  --
  DES.PRESTAMOINICIALTRAMAVALUE PRESTAMOINICIAL,
  DES.PLAZOTRAMAINPUT PLAZODELCREDITO,
  VEH.TIPO_USO USOVEHICULO,
  VEH.NUMERO_PLACA PLACAVEHICULO, 
  VEH.MARCA_VEHICULO MARCAVEHICULO, 
  VEH.MODELO_VEHICULO MODELOVEHICULO, 
  VEH.CLASE_VEHICULO CLASEVEHICULO,
  VEH.NUMERO_ASIENTO ASIENTOS, 
  VEH.NUMERO_MOTOR MOTOR, 
  --
FROM `iter-data-storage-pv-uat.goldenrecord_data.POLIZA` POL
INNER JOIN TBL_PRODUCTO PRD ON POL.ID_PRODUCTO = PRD.ID_PRODUCTO
INNER JOIN `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_OPERACION` OPE ON POL.NUMERO_POLIZA = OPE.NUMERO_POLIZA AND POL.NUMERO_OPERACION = OPE.NUMERO_OPERACION
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.ASEGURADO` ASE ON OPE.NUMERO_POLIZA = ASE.NUMERO_POLIZA
INNER JOIN `iter-data-storage-pv-uat.goldenrecord_data.CONTRATANTE` CON ON POL.ID_PERSONA = CON.ID_PERSONA
--
INNER JOIN `iter-data-storage-pv-uat.master_party.V_MD_PERSONA` PER ON CON.NUMERO_DOCUMENTO = PER.NUMERO_DOCUMENTO AND CON.TIPO_DOCUMENTO = PER.TIPO_DOCUMENTO
LEFT JOIN `iter-data-storage-pv-uat.goldenrecord_data.POLIZA_VEHICULO` VEH ON POL.NUMERO_POLIZA = VEH.NUMERO_POLIZA
LEFT JOIN `iter-data-storage-pv-uat.exp_serv_data.AGENCI_raw` AGE ON VEH.CODIGO_AGENCIA = AGE.COD_AGENCIA
LEFT JOIN `iter-data-storage-pv-uat.acsele_data.TD_POLIZA_ASEGURADO_DESGTARJETASIND_raw` DES ON POL.NUMERO_POLIZA = DES.NUMERO_POLIZA AND POL.NUMERO_OPERACION = DES.NUMERO_OPERACION
--
LEFT JOIN TBL_PRIMERA PRI ON OPE.NUMERO_POLIZA = PRI.NUMERO_POLIZA
LEFT JOIN TBL_TOTAL_OI TOI ON OPE.NUMERO_POLIZA = TOI.NUMERO_POLIZA
LEFT JOIN TBL_ULTIMO_OI UOI ON OPE.NUMERO_POLIZA = UOI.NUMERO_POLIZA
LEFT JOIN TBL_DEVUELTO_OI DOI ON OPE.NUMERO_POLIZA = DOI.NUMERO_POLIZA
WHERE OPE.ESTADO_OPERACION='Applied operation';

SELECT 'OK' AS EJECUCION;

END;