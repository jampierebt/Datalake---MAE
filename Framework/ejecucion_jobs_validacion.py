from google.cloud import bigquery
import re
import os
import pandas as pd
project_id = 'iter-data-storage-pv-uat'
client = bigquery.Client(project_id)

# Igualdad
path = 'Validaciones/Datalake/raw/query_igualdad/'
# Nulos
#path = 'Validaciones/Datalake/raw/query_null/'

def read_table_bq(path,archivo_sql):
    ruta_sql = os.path.join(path, archivo_sql)
    with open(ruta_sql, 'r') as file:
       sql = file.read()
    try:
       df_temp = pd.read_gbq(sql, project_id=project_id, dialect='standard')
       df = df_temp.melt(value_vars=[col for col in df_temp.columns if 'DIFF' in col],var_name='CAMPO_VALIDACION', value_name='RESULTADO')
       df['NOMBRE_TABLA']=archivo_sql
    except Exception as e:
       print(f'Error al ejecutar {archivo_sql} en BigQuery: {e}')
       with open('errores.log', 'a') as log_file:
        log_file.write(f'Error en {archivo_sql}: {e}\n')
        return None
    return df

def execute_job_validacion(path):
    df = pd.DataFrame()   
    for archivo_sql in os.listdir(path):
       df_temp = read_table_bq(path,archivo_sql)
    df = pd.concat([df, df_temp], ignore_index=True)
    return df

def generate_excel(df,name_file):
    df.to_excel(f'{name_file}.xlsx')
    return "Exportado Correctamente"

def main():
   name_file="process_validacion"
   generate_excel(execute_job_validacion(path),name_file)

main()