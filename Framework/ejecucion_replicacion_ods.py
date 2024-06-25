from google.cloud import bigquery
import os

# rutas de archivos base
path='Desarrollo/Replicacion ODS - UAT/ODS/'
# output transformado
path_output='Desarrollo/Replicacion ODS - UAT/ODS_UAT/'

archivos_sql = [archivo for archivo in os.listdir(path) ]

for archivo in archivos_sql:
  ruta_archivo = os.path.join(path, archivo)
  jobs = [job for job in os.listdir(ruta_archivo)]
  concat = archivo + '.sh'
  concat_SQL = archivo + '_SQL.sh'
  concat_bq = archivo + '.sql'
  path_final=path_output+archivo
  os.makedirs(path_final, exist_ok=True)
  for job in jobs:
    if job == concat:
      with open(path+archivo+'/'+job,'r') as lectura_SQL:
        contenido_SQL = lectura_SQL.read()
        contenido_SQL = contenido_SQL.replace('/home/interseguro-data/dev','/home/interseguro-data/uat')
        contenido_SQL = contenido_SQL.replace('gs://interseguro-datalake-prd-landing/PRD','gs://interseguro-datalake-prd-landing/UAT')
        contenido_SQL = contenido_SQL.replace('prd-analitica','uat-analitica')
      with open(path_final+'/'+job,'w') as output_SQL:
        output_SQL.write(contenido_SQL)
    if job ==concat_SQL:
      with open(path+archivo+'/'+job,'r') as lectura_SQL:
        contenido_SQL = lectura_SQL.read()
      contenido_SQL = contenido_SQL.replace('/home/interseguro-data/dev/','/home/interseguro-data/uat/')
      with open(path_final+'/'+job,'w') as output_SQL:
        output_SQL.write(contenido_SQL)
    if job ==concat_bq:
      with open(path+archivo+'/'+job,'r') as lectura_SQL:
        contenido_SQL = lectura_SQL.read()
      contenido_SQL = contenido_SQL.replace('gs://interseguro-datalake-prd-landing/PRD','gs://interseguro-datalake-prd-landing/UAT')
      contenido_SQL = contenido_SQL.replace('interseguro-data.','iter-data-storage-pv-uat.')
      with open(path_final+'/'+job,'w') as output_SQL:
        output_SQL.write(contenido_SQL)