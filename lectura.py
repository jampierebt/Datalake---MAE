import pandas as pd

import pyarrow

df = pd.read_excel('Mir_Operaciones_Vida_Endoso.xlsx')

df = df.astype(str)

df.to_parquet('mir_operaciones_vida_endoso.parquet',index=False)