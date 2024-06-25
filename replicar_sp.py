from google.cloud import bigquery
import re
import os
import pandas as pd
project_id = 'iter-data-storage-pv-uat'

path='Desarrollo/Replicacion UAT/replicacion_prod/sql_input/'
replicacion_sql = "replicacion.sql"
lista_sp = "Lista_sps.sql"

def sqlbigquery(filename):
    with open(filename,"r") as file:
        statement = file.readlines()
        statement = " ".join(statement)
    print(f" {filename}")
    return statement

def read_table_bq(query):
    client = bigquery.Client(project_id)
    df = pd.read_gbq(query, project_id=project_id, dialect='standard')
    return df

def store_base(df,path):
    for index, row in df.iterrows():
        nombre_archivo = row['NOMBRE_STORE_PROCEDURE']
        contenido_archivo = row['DDL']
        with open(path + nombre_archivo+'.sql', 'w', newline='', encoding='utf-8') as archivo:
            archivo.write(contenido_archivo)
    return 'Se exporto correctamente los DDL'

def execute_job(query):
    client = bigquery.Client(project_id)
    query_job = client.query(query)
    results = query_job.result()
    for row in results:
        ddl_statement = row['DDL']
        ddl_name_sp = row['NOMBRE_STORE_PROCEDURE']
        client.query(ddl_statement).result()
        print(f"Ejecucion: ",ddl_name_sp)
    return 'Ejectuado Correctamente'

def main():
    read_table_bq(sqlbigquery(lista_sp))
    query = sqlbigquery(replicacion_sql)
    store_base(read_table_bq(query),path)
    execute_job(query)
    return "Ejecutado Correctamente"

main()