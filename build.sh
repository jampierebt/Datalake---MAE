
# ------------------------------------
# generate zip vm files
# ------------------------------------

#zip -r "ODS_UAT.zip" "Desarrollo/Replicacion_ods/ODS_UAT"

#find . -name "desktop.ini" -type f -delete

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