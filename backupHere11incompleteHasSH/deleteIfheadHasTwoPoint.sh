#!/bin/bash

# Directorio donde están los archivos CSV (puedes cambiarlo)
DIR="./"

# Recorre todos los archivos CSV en el directorio
for file in "$DIR"*.csv; do
    # Verifica que el archivo exista y no esté vacío
    if [[ -f "$file" ]]; then
        # Verifica si la cabecera NO contiene ':'
        if ! head -n 1 "$file" | grep -q ":"; then
            # Elimina la primera línea y guarda el resto en un archivo temporal
            tail -n +2 "$file" > "${file}.tmp"
            # Reemplaza el archivo original con el modificado
            mv "${file}.tmp" "$file"
            echo "Cabecera eliminada en: $file"
        else
            echo "Cabecera intacta en: $file (contiene ':')"
        fi
    fi
done
