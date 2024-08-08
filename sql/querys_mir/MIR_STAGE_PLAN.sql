CREATE OR REPLACE PROCEDURE interseguror.pkg_mir_configuracion_stageplan(IN pidlog numeric, IN pidproceso numeric)
 LANGUAGE plpgsql
AS $procedure$
declare 
	vProceso  VARCHAR(120) DEFAULT 'ProcesoCierre';
	vIdProcesoIn  DECIMAL(19,0) DEFAULT pIdproceso;
	vSubProceso Varchar(120) DEFAULT 'StagePlan - ';
	vMensajeProceso Text;
begin
	vMensajeProceso := vSubProceso||'Inicio de registro de planes';
	call interseguror.Mir_LogInsert(pIdlog, vIdProcesoIn, vProceso, vMensajeProceso, vIdProcesoIn);
	
	-- --------------------------------------------------
   	-- Vida
   	-- --------------------------------------------------
	begin
		Execute  'Truncate Table interseguror.MIR_STAGEPLAN';
		Insert Into INTERSEGUROR.MIR_STAGEPLAN(IDSTAGEPLAN,IDPRODUCTO,IDPLAN,PLAN,DISPLAY,SIMBOLO)
	   	Select Distinct CAST(CONCAT(TRVAL_PADRE,TRVAL_HIJO) AS numeric(19)), TRVAL_PADRE, TRVAL_HIJO, 
	   			TRDESC_HIJO, TR_DISPLAY_HIJO, SIMBOLO_HIJO
	   	From INTERSEGURO.VIEW_PROPLISTA_DEPEN
	   	Where Upper(SIMBOLO_HIJO) = 'PLANVIDA';
	   	vMensajeProceso := vSubProceso||'Lectura de propiedad PlanVida completa';
	Exception When Others then
   		rollback;
		vMensajeProceso := vSubProceso||CONCAT('Error en lectura de propiedad PlanVida',' - ',SUBSTR(SQLERRM,0,3999));
   	end;
   	commit;
	call interseguror.Mir_LogInsert(pIdlog, vIdProcesoIn, vProceso, vMensajeProceso, vIdProcesoIn);

   	-- --------------------------------------------------
   	-- Plan Masivos
   	-- --------------------------------------------------
	begin
	   	Insert Into INTERSEGUROR.MIR_STAGEPLAN(IDSTAGEPLAN,IDPRODUCTO,IDPLAN,PLAN,DISPLAY,SIMBOLO)
	   	Select Distinct CAST(CONCAT(TRVAL_PADRE,TRVAL_HIJO) AS numeric(19)), TRVAL_PADRE, TRVAL_HIJO, TRDESC_HIJO, TR_DISPLAY_HIJO, SIMBOLO_HIJO
	   	From INTERSEGURO.VIEW_PROPLISTA_DEPEN
	   	Where Upper(SIMBOLO_HIJO) = 'PLANMASIVOS';
		vMensajeProceso := vSubProceso||'Lectura de propiedad PlanMasivos completa';
	Exception When Others then
   		rollback;
		vMensajeProceso := vSubProceso||CONCAT('Error en lectura de propiedad PlanMasivos',' - ',SUBSTR(SQLERRM,0,3999));
   	end;
   	commit;
	call interseguror.Mir_LogInsert(pIdlog, vIdProcesoIn, vProceso, vMensajeProceso, vIdProcesoIn);
    
   
   	-- --------------------------------------------------
   	-- Vehicular
   	-- --------------------------------------------------
	begin
	   	Insert Into INTERSEGUROR.MIR_STAGEPLAN(IDSTAGEPLAN,IDPRODUCTO,IDPLAN,PLAN,DISPLAY,SIMBOLO)
	   	with  Tbl_Planes As(
	   		Select TRVAL As IDPLAN, TRDESC As PLAN, TR_DISPLAY As DISPLAY, SIMBOLO
	   		From INTERSEGURO.VIEW_PROPIEDAD_VALORES
	   		Where Upper(SIMBOLO) = 'PLANVEHICULAR'
	   	),
	   	Tbl_Prod As(
	   		Select VALOR As IDPRODUCTO, COMETARIO As IDPLAN From INTERSEGUROR.MIR_ADM_PARAMETROS Where DESCRIPCION = 'STAGEPLAN-PLANVEH'
	   	)
	   	Select CAST(CONCAT(PROD.IDPRODUCTO,PLAN.IDPLAN) AS numeric(19)), PROD.IDPRODUCTO, PLAN.IDPLAN, 
	   		PLAN.PLAN, PLAN.DISPLAY, PLAN.SIMBOLO
	   	From Tbl_Planes PLAN
	   	INNER JOIN Tbl_Prod PROD On CAST(PROD.IDPLAN AS double precision) = PLAN.IDPLAN;
		vMensajeProceso := vSubProceso||'Lectura de propiedad PlanVehicular completa';
	Exception When Others then
   		rollback;
		vMensajeProceso := vSubProceso||CONCAT('Error en lectura de propiedad PlanVehicular',' - ',SUBSTR(SQLERRM,0,3999));
   	end;
   	commit;
	call interseguror.Mir_LogInsert(pIdlog, vIdProcesoIn, vProceso, vMensajeProceso, vIdProcesoIn);

	
   	-- --------------------------------------------------
   	-- Desgravamen
   	-- --------------------------------------------------
	begin
	   	Insert Into INTERSEGUROR.MIR_STAGEPLAN(IDSTAGEPLAN,IDPRODUCTO,IDPLAN,PLAN,DISPLAY,SIMBOLO)
	   	Select Distinct CAST(CONCAT(TRID_HIJO,COUNT_HIJO) AS numeric(19)),
	       Case TRDESC_PADRE
			   WHEN 'DesgravamenHipotecario' THEN 35442
			   WHEN 'DesgravamenPersonal' THEN 35450
			   WHEN 'DesgravamenTarjetas' THEN 35447
			   WHEN 'DesgravamenVehicular' THEN 35445
			   WHEN 'DesgTarjetasIndividual' THEN 69545
		   End As IDPRODUCTO, TRVAL_HIJO, TRDESC_HIJO, TR_DISPLAY_HIJO, DEP.SIMBOLO_HIJO
	   	From INTERSEGURO.VIEW_PROPLISTA_DEPEN DEP
	   	Where Upper(DEP.SIMBOLO_HIJO) = 'SUBPRODUCTOPLAN';
	
		vMensajeProceso := vSubProceso||'Lectura de propiedad SubProductoPlan completa';
	Exception When Others then
   		rollback;
		vMensajeProceso := vSubProceso||CONCAT('Error en lectura de propiedad SubProductoPlan',' - ',SUBSTR(SQLERRM,0,3999));
   	end;
   	commit;
	call interseguror.Mir_LogInsert(pIdlog, vIdProcesoIn, vProceso, vMensajeProceso, vIdProcesoIn);


   	-- --------------------------------------------------
   	-- Desgravamen Individual
   	-- --------------------------------------------------
	begin
	   	Insert Into INTERSEGUROR.MIR_STAGEPLAN(IDSTAGEPLAN,IDPRODUCTO,IDPLAN,PLAN,DISPLAY,SIMBOLO)
	   	with Tbl_Planes As(
	   		Select VAL.TRVAL As IDPLAN, VAL.TRDESC As PLAN, VAL.TR_DISPLAY As DISPLAY, VAL.SIMBOLO
	   		From INTERSEGURO.VIEW_PROPIEDAD_VALORES VAL
	   		Where Upper(VAL.SIMBOLO) = 'PLANDESGINDIVIDUAL'
	   	),
	   	Tbl_Prod As(
	   		Select VALOR As IDPRODUCTO, COMETARIO As IDPLAN 
	   		From INTERSEGUROR.MIR_ADM_PARAMETROS Where DESCRIPCION = 'STAGEPLAN-PLANDESG'
	   	)
	   	Select CAST(CONCAT(PROD.IDPRODUCTO,PLAN.IDPLAN) AS numeric(19)), PROD.IDPRODUCTO, PLAN.IDPLAN, 
	   		PLAN.PLAN, PLAN.DISPLAY, PLAN.SIMBOLO
	   	From Tbl_Planes PLAN
	   	INNER JOIN Tbl_Prod PROD On CAST(PROD.IDPLAN AS double precision) = PLAN.IDPLAN
	   	Order by PROD.IDPRODUCTO,PLAN.IDPLAN;
		vMensajeProceso := vSubProceso||'Lectura de propiedad Plandesgindividual completa';
	Exception When Others then
   		rollback;
		vMensajeProceso := vSubProceso||CONCAT('Error en lectura de propiedad Plandesgindividual',' - ',SUBSTR(SQLERRM,0,3999));
   	end;
   	commit;
	call interseguror.Mir_LogInsert(pIdlog, vIdProcesoIn, vProceso, vMensajeProceso, vIdProcesoIn);

		
   	-- --------------------------------------------------
   	-- Otros Masivos (No estandarizados)
   	-- --------------------------------------------------
	begin
	   	Insert Into INTERSEGUROR.MIR_STAGEPLAN(IDSTAGEPLAN,IDPRODUCTO,IDPLAN,PLAN,DISPLAY,SIMBOLO)
	   	with  Tbl_Planes As(
	   		Select Case Upper(SIMBOLO)
				   WHEN 'PLANCLONACIONOFRAUDED' THEN 39482
				   WHEN 'PLANEXTRACASH' THEN 31401
				   WHEN 'PLANEXTRACASHFUNO' THEN 56757
				   WHEN 'PLANCONTRATADO' THEN 39480
				   WHEN 'PLANINTELIGO' THEN 39479
				   WHEN 'PLANMUERTEACCVIAJES' THEN 35452
				   WHEN 'PLANFAMILIAR' THEN 24917
				   WHEN 'PLANVEAACC' THEN 27237
				   WHEN 'PLANVEAVIDA' THEN 28037
				   WHEN 'PLANVIDAESTUDIOS' THEN 31399
				   WHEN 'PLANVIDAESTUDIOSPLUS' THEN 31402
		   		End As IDPRODUCTO, TRVAL As IDPLAN, TRDESC As PLAN, TR_DISPLAY As DISPLAY, SIMBOLO
	   		From INTERSEGURO.VIEW_PROPIEDAD_VALORES
	   		Where Upper(SIMBOLO) in ('PLANCLONACIONOFRAUDED','PLANEXTRACASH','PLANEXTRACASHFUNO','PLANCONTRATADO',
		   'PLANINTELIGO','PLANMUERTEACCVIAJES','PLANFAMILIAR','PLANVEAACC','PLANVEAVIDA','PLANVIDAESTUDIOS','PLANVIDAESTUDIOSPLUS')
		)
	   	Select CAST(CONCAT(IDPRODUCTO,IDPLAN) AS numeric(19)), IDPRODUCTO, IDPLAN, PLAN, DISPLAY, SIMBOLO
	   	From Tbl_Planes
	   	Order By IDPRODUCTO,IDPLAN;
		vMensajeProceso := vSubProceso||'Lectura de propiedades estandarizadas completa';
	Exception When Others then
   		rollback;
		vMensajeProceso := vSubProceso||CONCAT('Error en lectura de propiedades estandarizadas',' - ',SUBSTR(SQLERRM,0,3999));
   	end;
   	commit;
	call interseguror.Mir_LogInsert(pIdlog, vIdProcesoIn, vProceso, vMensajeProceso, vIdProcesoIn);

   	-- --------------------------------------------------
   	-- Ajuste Seguro Accidentes
   	-- --------------------------------------------------
	begin
	   	Delete From INTERSEGUROR.MIR_STAGEPLAN
	   	Where IDPLAN In(1,2,3) And
	   		IDPRODUCTO in (Select TRVAL From INTERSEGURO.VIEW_PROPIEDAD_VALORES Where Upper(SIMBOLO) = 'PRODUCTOSVIDA' And TRDESC = 'SeguroAccidentes');
	   	
	   	Insert Into INTERSEGUROR.MIR_STAGEPLAN(IDSTAGEPLAN,IDPRODUCTO,IDPLAN,PLAN,DISPLAY,SIMBOLO)
	   	with  Tbl_Planes As(
	   		Select VAL.TRVAL As IDPLAN, VAL.TRDESC As PLAN, VAL.TR_DISPLAY As DISPLAY, VAL.SIMBOLO
	   		From INTERSEGURO.VIEW_PROPIEDAD_VALORES VAL
	   		Where Upper(VAL.SIMBOLO) = 'CLASEACCPERS'
	   	),
	   	Tbl_Prod As(
	   		Select TRVAL As IDPRODUCTO, TR_DISPLAY As PRODUCTO
	   		From INTERSEGURO.VIEW_PROPIEDAD_VALORES VAL
	   		Where Upper(VAL.SIMBOLO) = 'PRODUCTOSVIDA' and TRDESC = 'SeguroAccidentes'
	   	)
	   	Select CAST(CONCAT(PROD.IDPRODUCTO,PLAN.IDPLAN) AS numeric(19)), PROD.IDPRODUCTO, PLAN.IDPLAN, 
	   		PLAN.PLAN, PLAN.DISPLAY, PLAN.SIMBOLO
	   	From Tbl_Planes PLAN
	   	CROSS JOIN Tbl_Prod PROD;
		vMensajeProceso := vSubProceso||'Ajuste de planes accidentales completo';
	Exception When Others then
   		rollback;
		vMensajeProceso := vSubProceso||CONCAT('Error en lectura de planes accidentales',' - ',SUBSTR(SQLERRM,0,3999));
   	end;
   	commit;
	call interseguror.Mir_LogInsert(pIdlog, vIdProcesoIn, vProceso, vMensajeProceso, vIdProcesoIn);

	vMensajeProceso := vSubProceso||'Fin de registro de planes';
	call interseguror.Mir_LogInsert(pIdlog, vIdProcesoIn, vProceso, vMensajeProceso, vIdProcesoIn);
END;
$procedure$
;
