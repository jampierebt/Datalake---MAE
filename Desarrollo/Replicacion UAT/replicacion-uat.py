from google.cloud import bigquery
client = bigquery.Client()
query = """
SELECT REPLACE(ddl,'`iter-data-storage-pv`.programs','`iter-data-storage-pv-uat`.programs_bk') AS DDL
FROM `iter-data-storage-pv.programs.INFORMATION_SCHEMA.ROUTINES`
WHERE 
"""
query_job = client.query(query)
results = query_job.result()
for row in results:
    ddl_statement = row['DDL']
    print
    client.query(ddl_statement).result()