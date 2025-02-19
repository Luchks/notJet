#!/bin/bash

directory="${1:-.}"  # Usa el directorio proporcionado como argumento o el actual
output_file="listacoma.txt"

found=false

> "$output_file"  # Limpiar el archivo de salida

for file in "$directory"/*.csv; do
    [ -e "$file" ] || continue  # Evita errores si no hay archivos CSV
    
    while IFS= read -r line; do
        comma_count=$(grep -o "," <<< "$line" | wc -l)
        if [ "$comma_count" -gt 1 ]; then
            echo "Archivo: $file" | tee -a "$output_file"
            found=true
            break  # No es necesario seguir leyendo el archivo
        fi
    done < "$file"
done

if ! $found; then
    echo "No se encontraron archivos CSV con más de una coma en alguna fila." | tee -a "$output_file"
fi

