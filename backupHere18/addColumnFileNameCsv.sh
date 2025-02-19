#!/bin/bash

# Recorremos todos los archivos CSV en el directorio actual
for file in *.csv; do
    # Creamos un archivo temporal con la columna añadida
    awk -v filename="$file" 'BEGIN {FS=","; OFS=","} {print filename, $0}' "$file" > temp.csv
    
    # Reemplazamos el archivo original con el archivo temporal
    mv temp.csv "$file"
done

echo "Columna con los nombres de los archivos añadida a todos los archivos CSV."
