
-- FUNCION QUE SE ESTA UTILIZANDO 

 FUNCTION GET_NOMBRE_ENDOSOSSIMPLESSAC(P_ENDOSO VARCHAR2) RETURN VARCHAR2
    IS
    V_QUERY  VARCHAR2(5000);
    V_RPTA  VARCHAR2(5000);
    BEGIN
         V_QUERY := 'SELECT str_concat(TR_DISPLAY) FROM INTERSEGURO.VIEW_PROPIEDAD_VALORES val1
           WHERE UPPER(val1.SIMBOLO) = ''ENDOSOSSIMPLESSAC''
           AND TRDESC IN ('||''''||replace(P_ENDOSO,',',''',''')||''''||')';
    EXECUTE IMMEDIATE V_QUERY INTO V_RPTA;
        RETURN V_RPTA;
    END;

-- PROCESO PARA ANALIZAR CAPA 1 


  PROCEDURE SP_POLIZA_VIDA_ENDOSO_DET
    AS
    BEGIN
        --Nota: Sirve Para Tradicionales y Flex

        --1. Limpiamos la tabla, siempre se toma la ultima version
        INTERSEGUROR.TRUNCATABLA_TMP ('POLIZA_VIDA_ENDOSO_DET');


        --2. Procedemos a llenar la tabla con los diferentes tipos de endosos u eventos que podria tener una poliza.
        INSERT INTO INTERSEGUROR.POLIZA_VIDA_ENDOSO_DET
        WITH TBL_ENDOSOVIDA AS (
         SELECT ed.policypk, ed.iddcoevent,
                to_date(edv.Fechasolicitudinput,'yyyy-mm-dd') AS FECHA,
                edv.Tipoendosopolinput AS TIPOENDOSO,
                edv.TipoendosopolValue AS TIPOENDOSO_COD,
                CASE WHEN edv.TIPOENDOSOPOLVALUE = '1.0' THEN REP_FUNCIONES.GET_NOMBRE_ENDOSOSSIMPLESSAC(edv.ENDOSOSSIMPLESSACINPUT) ELSE val_edv.TR_DISPLAY END CAUSAENDOSO
         FROM INTERSEGURO.ENDOSARVIDA edv
         INNER JOIN interseguro.eventdco ed ON edv.static = ed.policypk AND edv.pk = ed.iddcoevent
         LEFT JOIN INTERSEGURO.VIEW_PROPIEDAD_VALORES val_edv ON UPPER(val_edv.SIMBOLO) = 'ENDOSOSCOMPLEJOSOP' AND edv.ENDOSOSCOMPLEJOSOPINPUT = val_edv.TRDESC
       ),
       TBL_ENDOSOACC AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(eac.Fechasolicitudinput,'yyyy-mm-dd') AS FECHA,
                 eac.Tipoendosopolinput AS TIPOENDOSO,
                 eac.TipoendosopolValue AS TIPOENDOSO_COD,
                 val_eac.TR_DISPLAY AS CAUSAENDOSO
          FROM INTERSEGURO.ENDOSARACC eac
          INNER JOIN interseguro.eventdco ed ON eac.static = ed.policypk and eac.pk = ed.iddcoevent
          INNER JOIN interseguro.VIEW_PROPIEDAD_VALORES val_eac ON UPPER(val_eac.SIMBOLO) = 'ENDOSOSIMPLEACC' AND eac.ENDOSOSIMPLEACCINPUT = val_eac.TRDESC
       ),
       TBL_ENDOSOSURA AS (
         SELECT ed.policypk, ed.iddcoevent,
                to_date(edv.Fechasolicitudinput,'yyyy-mm-dd') AS FECHA,
                edv.Tipoendosopolinput AS TIPOENDOSO,
                edv.TipoendosopolValue AS TIPOENDOSO_COD,
                CASE WHEN edv.TIPOENDOSOPOLVALUE = '1.0' THEN REP_FUNCIONES.GET_NOMBRE_ENDOSOSSIMPLESSAC(edv.EndososSimplesSACSuraINPUT) ELSE val_edv.TR_DISPLAY END CAUSAENDOSO
         FROM INTERSEGURO.ENDOSARSURA edv
         INNER JOIN interseguro.eventdco ed ON edv.static = ed.policypk AND edv.pk = ed.iddcoevent
         LEFT JOIN INTERSEGURO.VIEW_PROPIEDAD_VALORES val_edv ON UPPER(val_edv.SIMBOLO) = UPPER('EndososComplejosOPSura') AND edv.EndososComplejosOPSuraINPUT = val_edv.TRDESC
       ),
       TBL_ENDOSOPMAN AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(EN.FECHAMOVIMIENTOINPUT,'yyyy-mm-dd') AS FECHA,
                 EN.TIPOENDOSOPROPUESTAINPUT AS TIPOENDOSO,
                 EN.TIPOENDOSOPROPUESTAVALUE AS TIPOENDOSO_COD
          FROM INTERSEGURO.EndosarPropuesta EN
          INNER JOIN interseguro.eventdco ed ON EN.static = ed.policypk and EN.pk = ed.iddcoevent
       ),
       TBL_ENDOSOPRAP AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(EN.FECHAMOVIMIENTOINPUT,'yyyy-mm-dd') AS FECHA,
                 EN.TIPOENDOSOPROPRAPIDAVALUE AS TIPOENDOSO,
                 EN.TIPOENDOSOPROPRAPIDAVALUE AS TIPOENDOSO_COD
          FROM interseguro.eventdco ed
          INNER JOIN INTERSEGURO.EndosarPropRapida EN ON EN.static = ed.policypk and EN.pk = ed.iddcoevent
       ),
       TBL_ENDOSODECO AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(EN.FECHAMOVIMIENTOINPUT,'yyyy-mm-dd') AS FECHA,
                 EN.MOTIVODERIVARPROPINPUT    AS MOTIVO,
                 EN.MOTIVODERIVARPROPVALUE    AS MOTIVO_COD,
                 TO_CHAR(EN.OBSERVACIONINPUT) AS CAUSAENDOSO
          FROM INTERSEGURO.DerivarComercial EN
          INNER JOIN interseguro.eventdco ed ON EN.static = ed.policypk and EN.pk = ed.iddcoevent
       ),
       TBL_ENDOSORECD AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(EN.FECHAMOVIMIENTOINPUT,'yyyy-mm-dd') AS FECHA
          FROM INTERSEGURO.RecibirDocumento EN
          INNER JOIN interseguro.eventdco ed ON EN.static = ed.policypk and EN.pk = ed.iddcoevent
       ),
       TBL_ENDOSOCPRO AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(EN.FECHAMOVIMIENTOINPUT,'yyyy-mm-dd') AS FECHA
          FROM INTERSEGURO.CAMBIARPROPUESTA EN
          INNER JOIN interseguro.eventdco ed ON EN.static = ed.policypk and EN.pk = ed.iddcoevent
       ),
       TBL_ENDOSOOBSP AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(EN.FECHAMOVIMIENTOINPUT,'yyyy-mm-dd') AS FECHA
          FROM INTERSEGURO.Observarpropuesta EN
          INNER JOIN interseguro.eventdco ed ON EN.static = ed.policypk and EN.pk = ed.iddcoevent
       ),
       TBL_ENDOSOAPLZ AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(EN.FECHAMOVIMIENTOINPUT,'yyyy-mm-dd') AS FECHA,
                 EN.MOTIVOAPLAZARPROPINPUT  AS MOTIVO,
                 EN.MOTIVOAPLAZARPROPVALUE  AS MOTIVO_COD
          FROM INTERSEGURO.APLAZARPROPUESTA EN
          INNER JOIN interseguro.eventdco ed ON EN.static = ed.policypk and EN.pk = ed.iddcoevent
       ),
       TBL_ENDOSOCADUC AS (
          SELECT ed.policypk, ed.iddcoevent,
               to_date(ca.fechamovimientoinput,'yyyy-mm-dd') AS FECHA,
               ca.mativocaducarinput  AS MOTIVO,
               ca.mativocaducarvalue  AS MOTIVO_COD
          FROM INTERSEGURO.CADUCAR ca
          INNER JOIN interseguro.eventdco ed ON ca.static = ed.policypk and ca.pk = ed.iddcoevent
       ),
       TBL_ENDOSOCADUC_SURA AS (
          SELECT ed.policypk, ed.iddcoevent,
               to_date(ca.fechamovimientoinput,'yyyy-mm-dd') AS FECHA,
               ca.mativocaducarinput  AS MOTIVO,
               ca.mativocaducarvalue  AS MOTIVO_COD
          FROM INTERSEGURO.CADUCARSURA ca
          INNER JOIN interseguro.eventdco ed ON ca.static = ed.policypk and ca.pk = ed.iddcoevent
       ),
       TBL_ENDOSOTERM_VP AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(ter1.fechamovimientoinput,'yyyy-mm-dd') AS FECHA,
                 ter1.motivoterminacionvpinput AS MOTIVO,
                 ter1.motivoterminacionvpvalue AS MOTIVO_COD
          FROM INTERSEGURO.TERMINARVP ter1
          INNER JOIN interseguro.eventdco ed ON ter1.static = ed.policypk and ter1.pk = ed.iddcoevent
       ),
       TBL_ENDOSOTERM_EG AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(ter2.fechamovimientoinput,'yyyy-mm-dd') AS FECHA,
                 ter2.motivoterminacioneginput AS MOTIVO,
                 ter2.motivoterminacionegvalue AS MOTIVO_COD
          FROM INTERSEGURO.TERMINAREG ter2
          INNER JOIN interseguro.eventdco ed ON ter2.static = ed.policypk and ter2.pk = ed.iddcoevent
       ),
       TBL_ENDOSOCANCEL_VP AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(can1.fechamovimientoinput,'yyyy-mm-dd') AS FECHA,
                 can1.motivocancelacionvpinput AS MOTIVO,
                 can1.motivocancelacionvpvalue AS MOTIVO_COD
          FROM INTERSEGURO.CANCELARVP can1
          INNER JOIN interseguro.eventdco ed ON can1.static = ed.policypk and can1.pk = ed.iddcoevent
       ),
       TBL_ENDOSOCANCEL_EG AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(can2.fechamovimientoinput,'yyyy-mm-dd') AS FECHA,
                 can2.motivocancelacioneginput AS MOTIVO,
                 can2.motivocancelacionegvalue AS MOTIVO_COD
          FROM INTERSEGURO.CANCELAREG can2
          INNER JOIN interseguro.eventdco ed ON can2.static = ed.policypk and can2.pk = ed.iddcoevent
       ),
       TBL_ENDOSOCANCEL_SURA AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(can2.fechamovimientoinput,'yyyy-mm-dd') AS FECHA,
                 can2.motivocancelacioninput AS MOTIVO,
                 can2.motivocancelacionvalue AS MOTIVO_COD
          FROM INTERSEGURO.CANCELARSURA can2
          INNER JOIN interseguro.eventdco ed ON can2.static = ed.policypk and can2.pk = ed.iddcoevent
       ),
       TBL_ENDOSOCANCEL_VE AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(can3.fechamovimientoinput,'yyyy-mm-dd') AS FECHA,
                 can3.motivocancelacioneginput AS MOTIVO,
                 can3.motivocancelacionegvalue AS MOTIVO_COD
          FROM INTERSEGURO.CANCELARVE can3
          INNER JOIN interseguro.eventdco ed ON can3.static = ed.policypk and can3.pk = ed.iddcoevent
       ),
       TBL_ENDOSORESCA AS (
          SELECT ed.policypk, ed.iddcoevent,
                 to_date(res.fechamovimientoinput,'yyyy-mm-dd') AS FECHA,
                 res.cancelreasonbaninput AS MOTIVO,
                 res.cancelreasonbaninput AS MOTIVO_COD
          FROM INTERSEGURO.RESCATAR res
          INNER JOIN interseguro.eventdco ed ON res.static = ed.policypk and res.pk = ed.iddcoevent
       )
    SELECT pd.agregatedobjectid                                       AS IDPOLIZA,
           pd.operationpk                                             AS IDOPERACION,
           DECODE(prepol.Numeropolizainput,NULL,'PROPUESTA','POLIZA') AS AMBIENTE,
           ed.iddcoevent                                              AS PK_EVENTO, --FALTA
           ET.DESCRIPTION                                             AS EVENTO,
           STP.DESCRIPTION                                            AS ESTADO,
           nvl(eaSURA.FECHA||canSURA.FECHA||ecaSURA.FECHA||eap.FECHA||ecp.FECHA||eop.FECHA||erd.FECHA||edc.FECHA||epm.FECHA||eac.FECHA||edv.FECHA||epr.FECHA,CTX.EFFECTIVE_DATE) AS FECHASOLICITUD,
           PREPOL.NUMEROsolicitudINPUT AS NUMEROSOLICITUD,
           eca.MOTIVO||etevp.MOTIVO||eteg.MOTIVO||canvp.MOTIVO||caneg.MOTIVO||canve.MOTIVO||resca.MOTIVO||eap.MOTIVO||edc.MOTIVO||epm.TIPOENDOSO||eac.TIPOENDOSO||edv.TIPOENDOSO||epr.TIPOENDOSO AS TIPOENDOSOPOL,
           eca.MOTIVO_COD||etevp.MOTIVO_COD||eteg.MOTIVO_COD||canvp.MOTIVO_COD||caneg.MOTIVO_COD||canve.MOTIVO_COD||resca.MOTIVO_COD||eap.MOTIVO_COD||edc.MOTIVO_COD||epm.TIPOENDOSO_COD||eac.TIPOENDOSO_COD||edv.TIPOENDOSO_COD||epr.TIPOENDOSO_COD AS TIPOENDOSOPOLVALUE,
           CTX.EFFECTIVE_DATE AS FECHAEFECTIVA,
           eaSURA.CAUSAENDOSO||edc.CAUSAENDOSO||eac.CAUSAENDOSO||edv.CAUSAENDOSO AS CAUSA_ENDOSO,
           CTX.USER_NAME        AS USERNAME,
           CTX.TIME_STAMP       AS Time_Stamp
    FROM interseguro.policydco pd
    inner join AGREGATEDPOLICY AP ON AP.AGREGATEDPOLICYID = PD.AGREGATEDOBJECTID
    inner join interseguro.prepolicy prepol on prepol.pk = pd.dcoid
    inner join interseguro.riskunitdco rud on rud.operationpk = pd.operationpk
    inner join interseguro.contextoperation ctx on ctx.id = pd.operationpk
    inner join interseguro.state stp on stp.stateid = pd.stateid
    inner join interseguro.state stur on stur.stateid = rud.stateid
    inner join interseguro.eventdco ed on ed.operationpk = pd.operationpk
    inner join interseguro.eventtype et on   et.eventtypeid = ed.eventtypeid and
                        ET.DESCRIPTION not in (  'SimularEndoso','Renovar', 'GenerarReaseguro', 'GenerarReaseguroSaldada','GenerarReaseguroProrrogado',
                                    'GenerarPrima','Endosar','MovimientoExoneracion',
                                                                    'CotizarVida', 'PreActivar', 'Emitir', 'EmitirRapida', 'ActivarPropRapida', 'ActivarPropManual')
    inner join interseguror.POLIZA_VIDA PV ON PV.POLIZA_IDPOLIZA = pd.agregatedobjectid
    inner join interseguro.product prod on prod.productid = ap.productid
    left join  TBL_ENDOSOVIDA edv on edv.policypk = ed.policypk and edv.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOACC  eac on eac.policypk = ed.policypk and eac.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOPMAN epm on epm.policypk = ed.policypk and epm.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOPRAP epr on epr.policypk = ed.policypk and epr.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSODECO edc on edc.policypk = ed.policypk and edc.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSORECD erd on erd.policypk = ed.policypk and erd.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOCPRO ecp on ecp.policypk = ed.policypk and ecp.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOOBSP eop on eop.policypk = ed.policypk and eop.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOAPLZ eap on eap.policypk = ed.policypk and eap.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOCADUC eca on eca.policypk = ed.policypk and eca.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOTERM_VP etevp on etevp.policypk = ed.policypk and etevp.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOTERM_EG eteg on eteg.policypk = ed.policypk and eteg.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOCANCEL_VP canvp on canvp.policypk = ed.policypk and canvp.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOCANCEL_EG caneg on caneg.policypk = ed.policypk and caneg.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOCANCEL_VE canve on canve.policypk = ed.policypk and canve.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSORESCA resca on resca.policypk = ed.policypk and resca.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOSURA eaSURA on eaSURA.policypk = ed.policypk and eaSURA.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOCANCEL_SURA canSURA on canSURA.policypk = ed.policypk and canSURA.iddcoevent = ed.iddcoevent
    left join  TBL_ENDOSOCADUC_SURA ecaSURA on ecaSURA.policypk = ed.policypk and ecaSURA.iddcoevent = ed.iddcoevent

    order by pd.agregatedobjectid, pd.operationpk;

      PRAGMA AUTONOMOUS_TRANSACTION;
      INSERT INTO AUDITORIACARGA_JOB (IDJOB, FECHAHORAULTIMACARGA, DESCRIPCIONJOB)
      VALUES(JOB_POLIZA_VIDA_ENDOSO_DET_ID, SYSDATE, JOB_POLIZA_VIDA_ENDOSO_DET);

      COMMIT;
  END SP_POLIZA_VIDA_ENDOSO_DET;
  

--PROCESO PARA ANALIZAR PARTE 2


  Procedure Vida_Endosos
  Is
    vProceso Varchar2(120):= 'ReportesVida';
  Begin
    Log_Insert(vProceso,'Inicio de Vida_Endosos');
    Begin
      Execute Immediate 'Truncate Table Mir_Operaciones_Vida_Endoso';
      Insert Into Mir_Operaciones_Vida_Endoso(Id,Numeropoliza,Numerosolicitud,Fechasolicitud,Usuariosolicitud,Evento,
                        Fechaevento,Usuarioevento,EstadoEndoso,Fechaemision,Frecuenciapago,Fechaefectiva,
                        Primaneta,Primatotal,Producto,Plan,Tipoendoso,Motivoendoso,Idpoliza,Idoperacion)
      With tbl_Endoso as (
        Select Pol.Numeropoliza,Pol.NumeroSolicitud,Pol.Fechaproceso,Pol.UsuarioEvento,Ev.Evento,
               Pol.FechaEvento,Pol.FechaEmision,Pol.FrecuenciaPago,Pe.FechaEfectiva,Pol.PrimaNeta,
               Pol.PrimaTotal,Prod.Producto,NVL(PL.Display,Pol.Plan) as Plan, Pe.Tipo, 
               fnGetNombreEndoso(Pol.Idproducto,NVL(Pe.Endososimple,Pe.Endosocomplejo)) as Endoso, 
               Pol.Idpoliza, Pol.Idoperacion, 
               DENSE_RANK() OVER (PARTITION BY Pol.Idpoliza,Pol.NumeroSolicitud ORDER BY Pol.FechaProceso Desc, Pol.Fechaevento Desc, Pol.Idoperacion Desc) Orden
        From Mir_Stagepoliza Pol
        Inner Join Vw_Mir_Producto Prod ON Prod.IDProducto = Pol.IDProducto AND Prod.TipoProducto='VIDA'
        Inner Join Mir_StageEvento Ev on Pol.Idevento = Ev.Idevento and Ev.EventoEndoso = 'SI'
        Inner Join Mir_StagepolizaEvento Pe on Pe.Idpoliza = Pol.Idpoliza and Pe.Idoperacion = Pol.Idoperacion
        Left Join MIR_Stageplan PL ON PL.IDSTAGEPLAN = POL.Idstageplan
        Where Ev.Evento='SolicitarEndoso' And Pe.Tipo is not null
      )
      Select Idoperacion, Numeropoliza,NumeroSolicitud,Fechaproceso,UsuarioEvento,Evento,FechaEvento,
             UsuarioEvento,'Solicitado',FechaEmision,FrecuenciaPago,FechaEfectiva,PrimaNeta,PrimaTotal,
             Producto,Plan,Tipo,Endoso,Idpoliza,Idoperacion
      From tbl_Endoso
      Where Orden = 1;
      Commit;
      Log_Insert(vProceso,'Vida_Endosos - Registro de datos');
      
      --Actualizamos con los datos de la aprobaci�n
      MERGE INTO Mir_Operaciones_Vida_Endoso Endo USING (
        With tbl_Endoso as (
          Select E.Id, P.Idoperacion,P.NumeroSolicitud,P.Fechaproceso,P.UsuarioEvento,P.FechaEvento,Ev.Evento,
                 DENSE_RANK() OVER (PARTITION BY P.Idpoliza,P.NumeroSolicitud ORDER BY P.FechaProceso Desc, P.Fechaevento Desc, P.Idoperacion Desc) Orden
          From Mir_Operaciones_Vida_Endoso E
          Inner Join Mir_Stagepoliza P on E.Idpoliza = P.Idpoliza and E.NumeroSolicitud = P.NumeroSolicitud
          Inner Join Mir_StageEvento Ev on P.Idevento = Ev.Idevento and Ev.EventoEndoso = 'SI'
          Where Ev.Evento='AprobarEndoso'
        )
        Select Id,Idoperacion,NumeroSolicitud,Fechaproceso,UsuarioEvento,FechaEvento,Evento From tbl_Endoso Where Orden = 1
      ) P1 ON (P1.Id = Endo.Id )
      WHEN MATCHED THEN UPDATE SET
        FechaAprobacion = P1.FechaProceso,
        UsuarioAprobacion = P1.UsuarioEvento,
        Evento = P1.Evento,
        FechaEvento = P1.FechaEvento,
        IdOperacion = P1.IdOperacion,
        EstadoEndoso = 'Aprobado';
      Commit;
      Log_Insert(vProceso,'Vida_Endosos - Evento de aprobaci�n de endoso leido con exito');
      
      --En base a si esta aprobado o rechazado, actualizamos los demas datos
      For I IN (
        With tbl_Evento as (
          Select Distinct Evento,
             Case Evento when 'EndosarEfectivo' Then 3 when 'DesistirEndoso' Then 2 when 'RechazarEndoso' Then 1 End as Orden,
             Case Evento when 'EndosarEfectivo' Then 'Efectivo' when 'DesistirEndoso' Then 'Desistido' when 'RechazarEndoso' Then 'Rechazado' End as Estado
          From Mir_StageEvento E 
          Where E.Evento in ('EndosarEfectivo','DesistirEndoso','RechazarEndoso')
        )
        Select Evento,Estado From tbl_Evento order by Orden) LOOP
        
        ---Actualizar Estado x evento    
        MERGE INTO Mir_Operaciones_Vida_Endoso Endo USING (
          With tbl_Endoso as (
            Select E.Id, P.Idoperacion,P.NumeroSolicitud,P.Fechaproceso,P.UsuarioEvento,P.FechaEvento,Ev.Evento,
            DENSE_RANK() OVER (PARTITION BY P.Idpoliza,P.NumeroSolicitud ORDER BY P.FechaProceso Desc, P.Fechaevento Desc, P.Idoperacion Desc) Orden
            From Mir_Operaciones_Vida_Endoso E
            Inner Join Mir_Stagepoliza P on E.Idpoliza = P.Idpoliza and E.NumeroSolicitud = P.NumeroSolicitud
            Inner Join Mir_StageEvento Ev on P.Idevento = Ev.Idevento and Ev.EventoEndoso = 'SI'
            Where Ev.Evento=I.EVENTO
          )
          Select Id,Idoperacion,UsuarioEvento,FechaEvento,Evento 
          From tbl_Endoso 
          Where Orden = 1
        ) P1 ON (P1.Id = Endo.Id ) WHEN MATCHED THEN UPDATE SET
          Evento = P1.Evento, FechaEvento = P1.FechaEvento,
          IdOperacion = P1.IdOperacion, EstadoEndoso = I.ESTADO;
        Commit;
      END LOOP;
      Log_Insert(vProceso,'Vida_Endosos - Eventos del endoso leidos con exito');
      
      MERGE INTO Mir_Operaciones_Vida_Endoso Ex USING (
        Select E.Id, E.Idoperacion, Ur.Capitalasegurado
        From Mir_Operaciones_Vida_Endoso E 
        Inner Join Interseguror.Mir_Stageunidadriesgo Ur on Ur.Idoperacion = E.Idoperacion
      ) P1 ON (P1.Id = Ex.Id) WHEN MATCHED THEN
      UPDATE SET Ex.Monto_Asegurado = P1.Capitalasegurado;
      Commit;
      Log_Insert(vProceso,'Vida_Endosos - UR leida con exito');

      -- Actualizamos los datos de tercero
      MERGE INTO Mir_Operaciones_Vida_Endoso Ex USING (
        Select Distinct Pol.Id,
          replace(replace(replace(CON.Apellidopaterno||' '||CON.ApellidoMaterno,chr(10),''),chr(13),''),'|','') AS Contratante_Apellidos,
          replace(replace(replace(CON.Nombre||' '||CON.Segundonombre,chr(10),''),chr(13),''),'|','') AS Contratante_Nombres
        From Mir_Operaciones_Vida_Endoso Pol
        Inner Join MIR_StagePolizaTercero PT2 ON PT2.TIPO='CONTRATANTE' AND PT2.IdOperacion = POL.IdOperacion And Pt2.Estado != 4
        Inner Join MIR_StageTercero CON ON CON.IdEntidad = PT2.IdEntidad
      ) P1 ON (P1.Id = Ex.Id) WHEN MATCHED THEN
      UPDATE SET Ex.Contratante = P1.Contratante_Nombres||' '||P1.Contratante_Apellidos;
      Commit;
      Log_Insert(vProceso,'Vida_Endosos - Datos de tercero leidos con exito');
      
      --Actualizamos los datos de endoso de diferimiento
      MERGE INTO Mir_Operaciones_Vida_Endoso ocb USING (
        With tbl_ListaEndoso AS (
          Select E.Idpoliza, E.Idoperacion, E.Numerosolicitud, Pol.Fechaproceso, Pol.InicioVigencia, Pol.FinVigencia,
          Min(TO_DATE(Pe.EndosoFechaInicio,'YYYY-MM-DD') ) as FechaInicio, 
          Max(TO_DATE(Pe.EndosoFechaFin,'YYYY-MM-DD') ) as FechaFin,
          TO_NUMBER2(MAX(Nvl(Pe.MesesDiferidos,0))) as EndosoNroPeriodos,
          TO_NUMBER2(MAX(Nvl(Pe.TotalMesesDiferidos,0))) as EndosoNroPeriodosTot
          From Mir_Operaciones_Vida_Endoso E
          Inner Join Mir_Stagepoliza Pol on Pol.Idoperacion = E.Idoperacion
          Inner Join Mir_StagePolizaEvento Pe On Pe.IdPoliza = Pol.IdPoliza And Pe.Idoperacion = Pol.Idoperacion And Pe.Endososimple = 'TES016'
          Group By E.Idpoliza, E.Idoperacion, E.Numerosolicitud, Pol.Fechaproceso, Pol.InicioVigencia, Pol.FinVigencia
        ), 
        tbl_ListaEndosoAcum As (
          Select IdPoliza, IdOperacion, InicioVigencia, FinVigencia, Max(Fechaproceso) as FechaProceso, 
          Min(FechaInicio) as FechaInicio, Max(FechaFin) as FechaFin, 
          Sum(EndosoNroPeriodos) as Meses, Max(EndosoNroPeriodosTot) as MesesTotal
          From tbl_ListaEndoso
          Group By IdPoliza, IdOperacion, InicioVigencia, FinVigencia
        )
        Select IdPoliza, IdOperacion, InicioVigencia, FechaProceso, FechaInicio, FinVigencia, FechaFin, Meses, MesesTotal,
             Add_months(FinVigencia,Sum(Meses) over (Partition By Idpoliza Order By Idpoliza, FinVigencia)) as NuevoFin
        From tbl_ListaEndosoAcum        
      ) icb ON (ocb.IdPoliza=icb.IdPoliza and ocb.IdOperacion = icb.IdOperacion) WHEN MATCHED THEN 
      UPDATE SET ocb.finvigencia = icb.NuevoFin , 
                 ocb.finvigenciaant =  FinVigencia;
      Commit;
      Log_Insert(vProceso,'Vida_Endosos - Lectura de endoso de diferimiento realizado');
      
      MERGE INTO Mir_Operaciones_Vida_Endoso ocb 
      USING (
        SELECT Op.Idpoliza, E.Idoperacion, MAX(Op.Fin) as FechaFin
        FROM MIR_StageOpenitem OP
        Inner Join mir_operaciones_vida_endoso E on E.Idpoliza = Op.Idpoliza And Op.Fechaapplied <= E.Fechaefectiva
        WHERE OP.Tipo In (Select TipoOpenitem From Vw_Mir_AgrupacionOpenitem Where Agrupacion='PagadoHasta')
              And OP.Estado in (Select EstadoOpenitem From VW_MIR_EstadoOpenitem Where Agrupacion2='PagadoHasta')
        Group By Op.Idpoliza, E.Idoperacion
      ) icb ON (ocb.IdPoliza=icb.IdPoliza and ocb.IdOperacion = icb.IdOperacion) WHEN MATCHED THEN 
      UPDATE SET ocb.FechaUltimaPago =  FechaFin;
      Commit;
      Log_Insert(vProceso,'Vida_Endosos - Actualizaci�n de endoso de diferimiento realizado');
      
        
      Log_Insert(vProceso,'Fin de Vida_Endosos');
    Exception When Others Then
      Log_Insert(vProceso,'Error en el reporte'||SUBSTR(SQLERRM,0,3999));
    End;
  End;
  