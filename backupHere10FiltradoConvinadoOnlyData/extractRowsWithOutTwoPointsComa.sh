#!/bin/bash

# Directorio donde se encuentran los archivos CSV
DIRECTORIO="./"

# Recorre todos los archivos CSV en el directorio
for archivo in "$DIRECTORIO"/*.csv; do
    # Verifica si existen archivos CSV
    [ -e "$archivo" ] || continue
    
    # Nombre del archivo de salida
    archivo_salida="${archivo%.csv}_filtrado.csv"
    
    # Filtrar líneas que no contengan ':' ni ',' y guardar en el nuevo archivo
    grep -Ev '[:,]' "$archivo" > "$archivo_salida"
    
    echo "Archivo procesado: $archivo -> $archivo_salida"
done
