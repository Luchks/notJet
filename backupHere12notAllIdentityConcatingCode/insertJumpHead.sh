#!/bin/bash

# Directorio donde están los archivos CSV (puedes cambiarlo)
DIR="./"

# Recorre todos los archivos CSV en el directorio
for file in "$DIR"*.csv; do
    # Verifica que el archivo exista
    if [[ -f "$file" ]]; then
        # Extrae la cabecera y modifica solo la primera coma
        head -n 1 "$file" | sed 's/,/\n/' > "${file}.header"
        
        # Guarda el resto del archivo sin la cabecera
        tail -n +2 "$file" > "${file}.data"
        
        # Une la nueva cabecera con los datos originales
        cat "${file}.header" "${file}.data" > "$file"
        
        # Elimina archivos temporales
        rm "${file}.header" "${file}.data"
        
        echo "Cabecera modificada en: $file"
    fi
done
