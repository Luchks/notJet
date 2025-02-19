#!/bin/bash

# Verificar si hay archivos CSV en el directorio
shopt -s nullglob
files=(*.csv)
if [ ${#files[@]} -eq 0 ]; then
    echo "No se encontraron archivos CSV en el directorio."
    exit 1
fi

# Nombre del archivo de salida
output_file="merged.csv"

# Obtener el encabezado del primer archivo y agregar la columna "Archivo"
echo "Archivo,$(head -n 1 "${files[0]}")" > "$output_file"

# Procesar cada archivo y agregar su contenido al archivo de salida
for file in "${files[@]}"; do
    tail -n +2 "$file" | sed "s/^/$file,/" >> "$output_file"
done

echo "Archivos CSV combinados en $output_file"

