#!/bin/bash

# Directorio actual (puedes cambiarlo si es necesario)
directory="."

# Recorre todos los archivos que terminan en "modificado.csv"
for file in "$directory"/*modificado.csv; do
    [ -e "$file" ] || continue  # Verifica que el archivo exista

    filename=$(basename "$file")  # Obtiene solo el nombre del archivo

    # Agrega la columna con el nombre del archivo al inicio
    awk -v fname="$filename" 'BEGIN {OFS=","} {print fname, $0}' "$file" > temp.csv

    # Reemplaza el archivo original con la versión modificada
    mv temp.csv "$file"

    echo "Procesado: $file"
done
