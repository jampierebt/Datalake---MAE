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
            "NOMBRE_TABLA":list,
            "TABLAS":name_tabla[0] +'.' +name_tabla[1]
        })        
df = pd.DataFrame(results).drop_duplicates()
df.to_excel('process_tablas_ingestadas.xlsx',index=False)
