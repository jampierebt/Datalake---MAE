CREATE OR REPLACE PROCEDURE `iter-data-storage-pv-uat`.programs.SP_DWH_ODS_MENSUAL_IFRS17()
OPTIONS(
  strict_mode=true)
BEGIN

 /********************************************************************
* Proyecto      : IFRS17 - Actuals
* Fecha         : 15 / 11 / 2023
* Autor         : Jampiere Berrio         
* Descripción   : 
* Ejecuciòn     : Mensual - 7 de cada mes
*********************************************************************
*                       MODIFICACIONES POSTERIORES                  *
*===================================================================*
*=  Fecha   | Persona |           Modificación Realizada           =*
*===================================================================*/

-- ==================================================================================
--                           ||   IFRS17  - ACTUALS  ||
-- ==================================================================================
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_producto_unidad_cuenta`();
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_ceco_unidad_cuenta`();
-- ==================================================================================
--                               ||   ENTRIES  ||
-- ==================================================================================
-- ----------------------------------------------------------------------------------
--                                   REASEGURO
-- ----------------------------------------------------------------------------------
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_reaseguro_desgravamen`();
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_reaseguro_vida`();
-- ----------------------------------------------------------------------------------
--                                TIPO DE CAMBIO
-- ----------------------------------------------------------------------------------
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_tipo_cambio_ifrs17`();
-- ----------------------------------------------------------------------------------
--                                  SINIESTRO
-- ----------------------------------------------------------------------------------
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_siniestro_beneficiario`();
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_siniestro_desgravamen`();
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_siniestro_optativo`(); 
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_siniestro_proveedor`();
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_siniestro_vida`();
-- ----------------------------------------------------------------------------------
--                               COSTOS Y GASTOS
-- ----------------------------------------------------------------------------------
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_distribucion_costos_gastos`(); --> alinear tomar el ultimo nose X
CALL `iter-data-storage-pv-uat.programs.sp_inputfiles_gastos_reales`();
-- ==================================================================================
--                        ||   HISTORICOS MENSUALES  ||
-- ==================================================================================

CALL `iter-data-storage-pv-uat.programs.sp_bi_sbs_plnt_movimiento_contable_hist`(NULL);
CALL `iter-data-storage-pv-uat.programs.sp_bi_sbs_poliza_comprobante_hist`(NULL);
CALL `iter-data-storage-pv-uat.programs.sp_bi_sbs_plnt_pagos_compania_hist`(NULL); 
CALL `iter-data-storage-pv-uat.programs.sp_bi_sbs_plnt_ifrs17_042`(NULL);
-- ==================================================================================
--                           ||   PROCESO IFRS17  ||
-- ==================================================================================
CALL `iter-data-storage-pv-uat.programs.sp_bi_sbs_normativo_ifrs17`(NULL);


END;