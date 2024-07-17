SELECT /*+ PARALLEL(2) */
    PRE.NUMEROPOLIZAINPUT AS NUMERO_POLIZA,
    PDC.OPERATIONPK AS NUMERO_OPERACION,
    TO_CHAR(COT.AUDITDATE, 'YYYY-MM-DD HH24:MI:SS') AS AUDITDATE_SYSTEM_DATE,
    TO_CHAR(COT.TIME_STAMP, 'YYYY-MM-DD HH24:MI:SS') AS OPERATION_DATETIME,
    AGE.PRODUCTID AS ID_PRODUCTO,
    TRIM(UPPER(POR.DESCRIPTION)) AS NOMBRE_PRODUCTO,
    CASE
        WHEN COT.STATUS = 1 THEN 'Not applied operation'
        WHEN COT.STATUS = 2 THEN 'Applied operation'
        ELSE '' || COT.STATUS
    END AS STATUS_OPERATION,
    POLD.PK,
    POLD.STATIC,
    POLD.STATUS,
    POLD.NIVELAGRUPREASEGINPUT,
    POLD.CODINTERMEDIARIOINPUT,
    POLD.GASADMINCANPINPUT,
    POLD.FECHAVENTAINPUT,
    POLD.CODAGENTIENOFIINPUT,
    POLD.PROVEEDORDIGITINPUT,
    POLD.FECHANACIMIENTOASISTINPUT,
    POLD.FECHAANULFUTUROINPUT,
    POLD.CODVENDEDORINPUT,
    POLD.SIMBOLOMONEDASININPUT,
    POLD.SIMBOLOMONEDAPLSININPUT,
    POLD.TIPOASEGURADOINPUT,
    POLD.CODIGOUNICOCLIENTEINPUT,
    POLD.NUMEROCREDITOTRAMAINPUT,
    POLD.NUMEROCUOTATRAMAINPUT,
    POLD.NOMBREUNOTRAMAINPUT,
    POLD.NOMBREDOSTRAMAINPUT,
    POLD.APELLIDOUNOTRAMAINPUT,
    POLD.APELLIDODOSTRAMAINPUT,
    POLD.TIPODOCTRAMAINPUT,
    POLD.NUMERODOCTRAMAINPUT,
    POLD.FNACTRAMAINPUT,
    POLD.PERIODOBASEINPUT,
    POLD.DIRECCIONTRAMAINPUT,
    POLD.PRODUCTOSMASIVOINPUT,
    POLD.PLANMASIVOSINPUT,
    POLD.IDBETTERFLYINPUT,
    POLD.BUSINESSPARTNERINPUT,
    POLD.SPONSORINPUT,
    POLD.EDADTRAMAINPUT,
    POLD.SEXOTRAMAINPUT,
    POLD.TELEFONOTRAMAINPUT,
    POLD.ACCIONTRAMAINPUT,
    POLD.TIPOENDOSOBCSOLINPUT,
    POLD.FECHAFINVIGPOLINPUT,
    PRE.EMAILENVIOPOLIZAINPUT
FROM
    INTERSEGURO.PREPOLICY PRE
INNER JOIN INTERSEGURO.POLBETTERFLYCOLECTIVO POLD ON PRE.PK = POLD.PK
INNER JOIN INTERSEGURO.POLICYDCO PDC ON PDC.DCOID = PRE.PK
INNER JOIN INTERSEGURO.CONTEXTOPERATION COT ON COT.ID = PDC.OPERATIONPK
INNER JOIN INTERSEGURO.AGREGATEDPOLICY AGE ON AGE.AGREGATEDPOLICYID = PDC.AGREGATEDOBJECTID
INNER JOIN INTERSEGURO.PRODUCT POR ON POR.PRODUCTID = AGE.PRODUCTID AND POR.PRODUCTID = 78029
INNER JOIN INTERSEGURO.STATE STA ON STA.STATEID = PDC.STATEID
WHERE NULLIF(TRIM(PRE.NUMEROPOLIZAINPUT), '') IS NOT NULL;
