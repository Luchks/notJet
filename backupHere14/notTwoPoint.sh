#!/bin/bash

# Archivo de salida
output_file="dospuntos.csv"

# Limpiar el archivo de salida si ya existe
> "$output_file"

# Iterar sobre todos los archivos CSV en el directorio
for file in *.csv; do
    [[ -f "$file" ]] || continue  # Verificar si hay archivos CSV en el directorio

    # Filtrar las líneas que NO contengan ":" y agregar el nombre del archivo como primera columna
    grep -v ":" "$file" | awk -v fname="$file" '{print fname "," $0}' >> "$output_file"
done

echo "Proceso completado. Líneas sin ':' guardadas en $output_file con el nombre del archivo primero."

