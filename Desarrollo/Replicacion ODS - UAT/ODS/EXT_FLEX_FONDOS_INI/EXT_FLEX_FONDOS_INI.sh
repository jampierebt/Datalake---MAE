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

PRM_FECHA_DESDE=$1
PRM_FECHA_HASTA=$2

# --------------------------------------------------------------- 
#                    VALIDACION DE PARAMETROS                     
# ---------------------------------------------------------------
# Fuente origen
PRM_FUENTE=ODS

# Nombre de la tabla
PRM_NOMBRE_TABLA=EXT_FLEX_FONDOS_INI

# Path inicial del proceso -[ AMBIENTE ]
PRM_PATH_PROY=/home/interseguro-data/dev

# Path DATALAKE - CLOUD STORAGE - [ AMBIENTE ]
PRM_AMBIENTE_DTLK=gs://interseguro-datalake-prd-landing/PRD
PRM_AMBIENTE_DTLK=${PRM_AMBIENTE_DTLK}/${PRM_FUENTE}/${PRM_NOMBRE_TABLA}

# Varcar variables de entorno oracle
#. /etc/profile.d/config_oracle.sh
# Obtención de Variables de Ambiente necesarias para el proceso a ejecutar.
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
PRM_PATH_SH=${PRM_PATH_PROY}/sh
PRM_PATH_MAIN=${PRM_PATH_SH}/${PRM_FUENTE}/${PRM_NOMBRE_TABLA}

# Fecha ejecucion
PRM_FECHA_EJECUCION=`date +"%Y%m%d_%H%M%S"`
PRM_FECHA_INICIO=`date +"%Y-%m-%d %H:%M:%S"`

# -------------------------------------------------------------- #
#                DEFINE FUNCTIONS HERE
# -------------------------------------------------------------- # 
flg_exit(){
    VAR_ESTADO=$1
    VAR_NOMBRE_PROCESO=$2
    VAR_DESCRIPCION=$3

   if [ ${VAR_ESTADO} -eq 0 ];then
      echo "[ OK  ] ${VAR_NOMBRE_PROCESO} | ${VAR_DESCRIPCION} | OUTCODE: ${VAR_ESTADO} "
    else
      echo "[ERROR] ERROR IN EXECUTION | ${VAR_NOMBRE_PROCESO} | ${VAR_DESCRIPCION} | OUTCODE: ${VAR_ESTADO}  "
      exit 1
   fi
}
# --------------------------------------------------------------- #
#                                PROCESS                          #
# --------------------------------------------------------------- #
echo `date +"%Y-%m-%d %H:%M:%S"`" [INFO] Start of process"
echo `date +"%Y-%m-%d %H:%M:%S"`" [INFO] Main path - "${PRM_PATH_MAIN}

# Exportar de BIGQUERY a 
echo `date +"%Y-%m-%d %H:%M:%S"`" [INFO] Exporting table"
bq query --use_legacy_sql=false --batch < ${PRM_PATH_MAIN}/${PRM_NOMBRE_TABLA}.sql

# Listas todos los 
echo `date +"%Y-%m-%d %H:%M:%S"`" [INFO] Listing the files"
gsutil ls ${PRM_AMBIENTE_DTLK}/${PRM_NOMBRE_TABLA}-*.csv.gz > ${PRM_PATH_MAIN}/${PRM_NOMBRE_TABLA}.txt

file=$(cat ${PRM_PATH_MAIN}/${PRM_NOMBRE_TABLA}.txt)
for linea in $file
do

# Cargando a postgresql
echo `date +"%Y-%m-%d %H:%M:%S"`" [INFO] Loading the file "$linea
gcloud sql import csv --project=interseguro-data prd-analitica $linea \
    --account=analitica-data@interseguro.com.pe  \
    --database=postgres \
    --table="staging.ext_flex_fondos_ini" \
    --fields-terminated-by="7E" \
    --user=postgres \
    --quiet

# Eliminando archivo
echo `date +"%Y-%m-%d %H:%M:%S"`" [INFO] Deleting file "$linea
gsutil rm $linea

done

echo `date +"%Y-%m-%d %H:%M:%S"`" [INFO] Executing the procedure in Postgresql "
sh ${PRM_PATH_MAIN}/${PRM_NOMBRE_TABLA}_SQL.sh

echo `date +"%Y-%m-%d %H:%M:%S"`" [INFO] Finished successfully"
