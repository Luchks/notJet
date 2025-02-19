#!/bin/bash

# Nombre del archivo de salida
output_file="unido.csv"

# Si el archivo de salida ya existe, lo eliminamos
if [[ -f $output_file ]]; then
    rm $output_file
fi

# Recorremos todos los archivos CSV en el directorio actual
for file in *.csv; do
    # Añadimos una columna con el nombre del archivo
    awk -v filename="$file" 'BEGIN {FS=","; OFS=","} {print $0, filename}' "$file" >> "$output_file"
done

echo "Archivos CSV unidos en $output_file"

