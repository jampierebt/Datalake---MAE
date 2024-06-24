#!/bin/bash
# ---------------------------------------------------------------
# Nombre Proceso: .sh            
# Fecha Creacion: 2021-05-20                                      
# Autor         : Tito Ramirez Hurtado                            
# Objetivo      :                    
#                                      
# Parametros    : 
#                
# --------------------------------------------------------------- 

# --------------------------------------------------------------- 
#                    VALIDACION DE PARAMETROS                     
# ---------------------------------------------------------------
# Fuente origen
PRM_FUENTE=ODS

# Nombre de la tabla
PRM_NOMBRE_TABLA=POLIZA_SOAT

# Path inicial del proceso
PRM_PATH_PROY=/home/interseguro-data/dev/

# Obtencion de Variables de Ambiente necesarias para el proceso a ejecutar.
PRM_PATH_CONFIG=${PRM_PATH_PROY}/config
PRM_PATH_DATA=${PRM_PATH_PROY}/data
PRM_PATH_DBSQLLITE=${PRM_PATH_PROY}/db-sqllite
PRM_PATH_FRAMEWORK=${PRM_PATH_PROY}/framework
PRM_PATH_IMAGE=${PRM_PATH_PROY}/image
PRM_PATH_LOG=${PRM_PATH_PROY}/log
PRM_PATH_PKG_PYTHON=${PRM_PATH_PROY}/pkg_python
PRM_PATH_PROCESS=${PRM_PATH_PROY}/process
PRM_PATH_REPORT=${PRM_PATH_PROY}/report
PRM_PATH_SCHEMA=${PRM_PATH_PROY}/schema
PRM_PATH_SQL=${PRM_PATH_PROY}/sql
PRM_PATH_TMP=${PRM_PATH_PROY}/tmp
PRM_ARCHIVO_CONFIG=${PRM_PATH_CONFIG}/config.ini

# Credenciales del servidor BD externo - Postgresql
PRM_POSGRESQL_SERV_BDANALITICA=`grep -i PRM_POSGRESQL_SERV_BDANALITICA ${PRM_ARCHIVO_CONFIG} | awk -F= '{printf("%s",$2)}'`
PRM_POSGRESQL_USER_BDANALITICA=`grep -i PRM_POSGRESQL_USER_BDANALITICA ${PRM_ARCHIVO_CONFIG} | awk -F= '{printf("%s",$2)}'`
PRM_POSGRESQL_PWD_BDANALITICA=`grep -i PRM_POSGRESQL_PWD_BDANALITICA ${PRM_ARCHIVO_CONFIG} | awk -F= '{printf("%s",$2)}'`
PRM_POSGRESQL_BD_BDANALITICA=`grep -i PRM_POSGRESQL_BD_BDANALITICA ${PRM_ARCHIVO_CONFIG} | awk -F= '{printf("%s",$2)}'`

# Fecha ejecucion
PRM_FECHA_EJECUCION=`date +"%Y%m%d_%H%M%S"`
PRM_FECHA_INICIO=`date +"%Y-%m-%d %H:%M:%S"`

# Parametros GCP - Cloud Storage

# -------------------------------------------------------------- #
#                DEFINE FUNCTIONS HERE
# -------------------------------------------------------------- # 
flg_exit(){
    VAR_ESTADO=$1
    VAR_NOMBRE_PROCESO=$2
    VAR_DESCRIPCION=$3
    VAR_NOMBREFUENTE="BUC"

   if [ ${VAR_ESTADO} -eq 0 ];then
      echo `date +"%Y-%m-%d %H:%M:%S"`" [ OK  ] EJECUCION CORRECTA ...! > ${VAR_ESTADO}-${VAR_NOMBRE_PROCESO}-${VAR_DESCRIPCION}"
    else
      echo `date +"%Y-%m-%d %H:%M:%S"`" [ERROR] LA EJECUCION TERMINO CON ERROR...!${VAR_ESTADO}-${VAR_NOMBRE_PROCESO}-${VAR_DESCRIPCION}"
      exit 1
   fi
}

# --------------------------------------------------------------- #
#                                PROCESO                          #
# --------------------------------------------------------------- #
echo `date +"%Y-%m-%d %H:%M:%S"`" [INFO] Inicio de proceso"

psql "host=${PRM_POSGRESQL_SERV_BDANALITICA} port=5432 dbname=${PRM_POSGRESQL_BD_BDANALITICA} user=${PRM_POSGRESQL_USER_BDANALITICA} password=${PRM_POSGRESQL_PWD_BDANALITICA}" <<EOF_1

CALL  staging.sp_poliza_soat();

EOF_1
flg_exit $? "postgresql" "Ingesta a la tabla Final"

echo `date +"%Y-%m-%d %H:%M:%S"`" [INFO]> Fin de ejecucion...!!!"


