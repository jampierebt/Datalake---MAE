from google.cloud import bigquery
import re
import os
import pandas as pd

project_id = 'iter-data-storage-pv-uat'
client = bigquery.Client(project_id)

#path='Validaciones/Datalake/raw/query_igualdad/'
#path='Validaciones/Datalake/raw/query_null/'
path='Validaciones/Datalake/raw/query_test/'

sql_table='sql/table_bq.sql'
sql_igualdad='sql/validacion_igualdad.sql'
sql_null='sql/validacion_null.sql'

def sqlbigquery(filename):
    with open(filename,"r") as file:
        statement = file.readlines()
        statement = " ".join(statement)
    print(f" {filename}")
    return statement

def read_table_bq(sql):
    df = pd.read_gbq(sql, project_id=project_id, dialect='standard')
    return df

def generate_file_sql(path,df):
    grouped_data = df.groupby('TABLE_NAME')
    for table_name, group in grouped_data:
        print(f'Ejecutando: {table_name}')
        queries = '\n'.join(group['QUERY'])
        file_name = f'{table_name}.sql'
        with open(path+file_name, 'w') as file:
            file.write(queries)
    return "Ejecutado Correctamente"

def list_files_sql(path):
    archivos_sql = [archivo for archivo in os.listdir(path) if archivo.endswith('.sql')]
    return archivos_sql

def main():
    generate_file_sql(path,read_table_bq(sqlbigquery(sql_null)))
    archivos_sql = list_files_sql(path)
    do = read_table_bq(sqlbigquery(sql_table))
    for archivo in archivos_sql:
        print(f'Tabla BQ: {archivo}')
        ruta_archivo = os.path.join(path, archivo)
        tabla_name = archivo.split('.')[0]
        with open(ruta_archivo, 'a') as file:
            condiciones_cruce = []
            for _, row in do[do['TABLE_NAME'] == tabla_name].iterrows():
                condiciones_cruce.append(f'UAT.{row["COLUMN_NAME"]} = PROD.{row["COLUMN_NAME"]}')
            if condiciones_cruce:
                file.write('\n'+f'FROM {row["AMBIENTE_UAT"]} UAT '+'\n')
                file.write(f'INNER JOIN {row["AMBIENTE_PROD"]} PROD ')
                file.write('\nON ' + ' \nAND '.join(condiciones_cruce))
    return "Ejecutado Correctamente"

main()