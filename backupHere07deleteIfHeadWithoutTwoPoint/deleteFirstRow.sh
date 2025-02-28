#!/bin/bash

# Directorio donde están los archivos CSV (opcional)
DIR="./"

# Recorre todos los archivos CSV en el directorio
for file in "$DIR"*.csv; do
    # Verifica que el archivo exista y no esté vacío
    if [[ -f "$file" ]]; then
        # Elimina la primera línea y guarda el contenido en un archivo temporal
        tail -n +2 "$file" > "${file}.tmp"
        # Reemplaza el archivo original con el modificado
        mv "${file}.tmp" "$file"
        echo "Cabecera eliminada en: $file"
    fi
done

