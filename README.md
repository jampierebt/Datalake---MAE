# Datalake-MAE

El proyecto implica la replicacion de los jobs de produccion en el ambiente de uat con el fin de ejecutar y replicar procesos como sp's, tablas a nivel de bigquery, adicionalmente se realizara la replicacion de procesos para la carga de la ODS en el ambiente de uat cambiando los parametros de los archivos en el escenario actual no optimizado.

- Proyecto prd: "interseguro-data" , "iter-data-storage-pv"
- Proyecto uat: "iter-data-storage-pv-uat"

___

## Contenidos

- [Instalación](#instalación)
- [Frameworks](#Framework)
- [Zipeado-ODS](#Zipeado-ODS)

## Instalación

Instrucciones para descargar el proyecto.

```bash
# Clona el repositorio
git clone -b git@github.com:jampierebt/Datalake-MAE.git

# Entra en el directorio del proyecto
cd Datalake-MAE

```
## Framework

Instrucciones para utilizar los framework

```bash
# Ejecuta los jobs de validacion
python Framework/ejecucion_jobs_validacion.py

# Replica los jobs de ODS
python Framework/ejecucion_replicacion_ods.py

# Ejecuta los sp's homologados a uat
python Framework/ejecucion_replicacion_sp.py

# Genera los query para validar la plataforma
python Framework/ejecucion_query_validacion.py

```

## Zipeado-ODS

Genera el zip con los archivos para ODS para luego hacer unzip en la vm

``` bash

zip -r "ODS_UAT.zip" "Desarrollo/Replicacion_ods/ODS_UAT"

```