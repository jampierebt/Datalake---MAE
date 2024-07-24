import pandas as pd
import os
import re

results = []
path='sql/querys_mir/'
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
            "TABLE_NAME":name_tabla[1].upper(),
            "TABLA":name_tabla[0].upper() +'.' +name_tabla[1].upper(),
            "QUERY":"SELECT COUNT(*),'"+ name_tabla[1].upper() + "' AS TABLA FROM "+name_tabla[0].upper() +'.' +name_tabla[1].upper() + ' UNION ALL'
        })        
df = pd.DataFrame(results).drop_duplicates()
df.to_excel('POLIZA_VIDA_ENDOSO.xlsx',index=False)
