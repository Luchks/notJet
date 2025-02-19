#!/bin/bash

# Verifica si hay archivos CSV en el directorio actual
shopt -s nullglob
csv_files=(*.csv)

if [ ${#csv_files[@]} -eq 0 ]; then
    echo "No se encontraron archivos CSV en el directorio."
    exit 1
fi

# Procesa cada archivo CSV en el directorio
for file in "${csv_files[@]}"; do
    echo "Procesando: $file"
    # Filtra las líneas que NO contienen "Sección" ni "Texto" y sobrescribe el archivo original
    grep -Ev 'Sección|Texto' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
done

echo "Proceso completado."
