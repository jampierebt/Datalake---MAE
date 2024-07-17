import pandas as pd
import os
import re

results = []
path='sql/querys_ingesta/'
pattern = r'(INTERSEGURO|interseguro|interseguro_gu|INTERSEGUROR|interseguror|INTERSEGURO_GU)\.(\w+)'

list_sql = os.listdir(path)

for list in list_sql:
    with open(path+list, 'r') as file:
        data = file.read()
    tablas = re.findall(pattern, data)
    for name_tabla in tablas:
        results.append({
            "TABLA_BQ":list,
            "SCHEMA":name_tabla[0].upper(),
            "NAME_TABLE":name_tabla[1].upper(),
            "TABLA":name_tabla[0].upper() +'.' +name_tabla[1].upper()
        })        
df = pd.DataFrame(results).drop_duplicates()
df.to_excel('process_tablas_ingestadas.xlsx',index=False)
