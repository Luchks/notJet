#!/bin/bash

# Directorio donde están los archivos CSV
dir="$(pwd)"

# Iterar sobre todos los archivos CSV en el directorio
for file in "$dir"/*.csv; do
    # Verificar si el archivo existe
    [ -e "$file" ] || continue
    
    # Crear un archivo temporal
    temp_file="${file}.tmp"
    
    # Filtrar las filas vacías y las que contienen "Imagen referencial"
    grep -v -E "^$|Imagen referencial" "$file" > "$temp_file"
    
    # Reemplazar el archivo original con el archivo filtrado
    mv "$temp_file" "$file"

done

echo "Procesamiento completado."
