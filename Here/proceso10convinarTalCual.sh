#!/bin/bash

# Nombre del archivo de salida
output_file="resultado.txt"

# Elimina el archivo de salida si ya existe
> "$output_file"

# Recorre todos los archivos que terminan en "modificado.csv"
for file in *modificado.csv; do
    [ -e "$file" ] || continue  # Verifica que el archivo exista

    echo "Procesando: $file"

    # Agrega el contenido del archivo al resultado.txt manteniendo su estructura
    cat "$file" >> "$output_file"

    # Agrega una línea en blanco entre archivos (opcional)
    echo "" >> "$output_file"
done

echo "Archivos combinados en $output_file"

