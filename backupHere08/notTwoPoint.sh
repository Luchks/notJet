#!/bin/bash

# Archivo de salida
output_file="dospuntos.csv"

# Limpiar el archivo de salida si ya existe
> "$output_file"

# Iterar sobre todos los archivos CSV en el directorio
for file in *.csv; do
    [[ -f "$file" ]] || continue  # Verificar si hay archivos CSV en el directorio

    # Filtrar las líneas que NO contengan ":"
    grep -v ":" "$file" >> "$output_file"
done

echo "Proceso completado. Líneas sin ':' guardadas en $output_file."
