from google.cloud import bigquery
from google.cloud import storage
import concurrent.futures
import re
import os
import pandas as pd

project_id = 'iter-data-storage-pv-uat'
dataset_id = 'acsele_data_bk'
bucket_name='interseguro-datalake-alloy-uat-new'
path_insert='Desarrollo/Replicacion_insert/'
dataset_output='acsele_temp'
dataset_input='acsele_alloy_new'
path_ddl='Desarrollo/Replicacion_ddl/'
path_truncate='Desarrollo/Replicacion_truncate/'

sql =f"""
SELECT 
TABLE_CATALOG
,TABLE_SCHEMA
,TABLE_NAME
,REPLACE(REPLACE(REPLACE(DDL,'{dataset_id}','acsele_temp'),');',CONCAT(')OPTIONS (format="PARQUET",URIS=["gs://{bucket_name}/{dataset_id}/',TABLE_NAME,'/*.parquet"]);')),'CREATE TABLE','CREATE OR REPLACE EXTERNAL TABLE') AS DDL
FROM {project_id}.{dataset_id}.INFORMATION_SCHEMA.TABLES
"""

def generate_blobs(dataset,table_name):
    client_storage = storage.Client(project=project_id)
    bucket = client_storage.bucket(bucket_name)
    blobs = bucket.list_blobs(prefix=f'{dataset}/{table_name}')
    return blobs

def delete_blob(blob):
    blob.delete()
    print(f'Archivo {blob.name} eliminado.')

def clean_storage(dataset_id,project_id):
    client = bigquery.Client(project_id)
    tables = client.list_tables(dataset_id)
    for table in tables:
        table_id = table.table_id
        blobs = generate_blobs(dataset_id,table_id)
        with concurrent.futures.ThreadPoolExecutor() as executor:
            futures = [executor.submit(delete_blob, blob) for blob in blobs]
            concurrent.futures.wait(futures)  
    return f"Limpieza ruta: {dataset_id}/{table_id}"

def export_table_storage(dataset_id,project_id):
    client = bigquery.Client(project_id)
    dataset_ref = client.dataset(dataset_id)
    tables = client.list_tables(dataset_ref)
    for table in tables:
        table_id = table.table_id
        table_ref = dataset_ref.table(table_id)
        uri = f'gs://{bucket_name}/{dataset_id}/{table_id}/*.parquet'
        extract_job = client.extract_table(
            table_ref,
            uri,
            location="US",
            job_config=bigquery.ExtractJobConfig(destination_format="PARQUET")
            )
        print(f'Tabla Exportada: {table_ref}')

def read_table_bq(query):
  df = pd.read_gbq(query, project_id=project_id, dialect='standard')
  return df

def sqlbigquery(file):
    with open(file,"r") as file:
        statement = file.readlines()
        statement = " ".join(statement)
    return statement

def execute_job(query,project_id):
    client = bigquery.Client(project_id)
    query_job = client.query(query)
    results = query_job.result()
    for row in results:
        table_name = row['TABLE_NAME']
        ddl_statement = row['DDL']
        client.query(ddl_statement).result()
        print(f'Tabla creada: {table_name}')
    return f'Ejectuado Correctamente'

def store_base(path,df):
  for index, row in df.iterrows():
    nombre_archivo = row['TABLE_NAME']
    contenido_archivo = row['DDL']
    with open(path + nombre_archivo+'.sql', 'w', newline='') as archivo:
      archivo.write(contenido_archivo)
  return 'Se exporto correctamente los DDL'

def external_to_table(path,dataset_id,dataset_output,dataset_input):
    client = bigquery.Client(project_id)
    dataset_ref = client.dataset(dataset_id)
    tables = client.list_tables(dataset_ref)
    for table in tables:
        table_id = table.table_id
        table_ref = dataset_ref.table(table_id)
        with open(path+table_id+'.sql','w') as file:
            file.write('INSERT INTO '+project_id+'.'+dataset_input+'.'+table_id+'\n')
            file.write('SELECT * FROM '+project_id+'.'+dataset_output+'.'+table_id)

def generate_truncate(path,dataset_id):
    client = bigquery.Client(project_id)
    dataset_ref = client.dataset(dataset_id)
    tables = client.list_tables(dataset_ref)
    for table in tables:
        table_id = table.table_id
        table_ref = dataset_ref.table(table_id)
        with open(path+table_id+'.sql','w') as file:
            file.write('TRUNCATE TABLE '+project_id+'.'+dataset_id+'.'+table_id)

def execute_job_insert(path):
    client = bigquery.Client(project_id)
    list_sql = os.listdir(path)
    for file in list_sql:
        print(f" Query insert a BQ: {file}")
        query = sqlbigquery(path+file)
        query_job = client.query(query)
        query_job.result()

def main_export_storage():
    clean_storage(dataset_id,project_id)
    export_table_storage(dataset_id,project_id)
    return "Ejecutado Correctamente"

def main_create_external_table():
    store_base(path_ddl,read_table_bq(sql))
    execute_job(sql,project_id)
    return "Ejecutado Correctamente"

# Ejecuta la exportacion a cloud storage del todo un dataset entero 
main_export_storage()
# Crea los DDL para las tablas externas y los ejecuta en bq
main_create_external_table()
# genera los insert de las tablas externas a tabla en bq
external_to_table(path_insert,dataset_id,dataset_output,dataset_input)
# Aqui falta sumar el truncate table pero es riesgoso (evaluar)
generate_truncate(path_truncate,dataset_input)
# Ejecuta todos los truncate
execute_job_insert(path_truncate)
# Ejecuta todos los insert 
execute_job_insert(path_insert)