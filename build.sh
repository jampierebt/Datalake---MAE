
# ------------------------------------
# generate zip vm files
# ------------------------------------

zip -r ODS_UAT.zip /Desarrollo/ODS_UAT

# ------------------------------------
# python de replicar
# ------------------------------------

#python Framework/ejecucion_jobs_validacion.py
#python Framework/ejecucion_replicacion_ods.py
#python Framework/ejecucion_replicacion_sp.py
#python Framework/ejecucion_query_validacion.py

# ------------------------------------
# Subir a GIT repository
# ------------------------------------
git add .
git commit -m "change file"
git push origin $1  