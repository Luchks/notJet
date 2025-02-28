#!/bin/bash

# Obtener todos los archivos CSV en el directorio actual
for input_file in *.csv; do
    # Definir el archivo de salida agregando "_modificado.csv"
    output_file="${input_file%.csv}_modificado.csv"

    # Limpiar el archivo de salida
    > "$output_file"

    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ "$line" == *:* ]]; then
            # Si la línea tiene ":", es una nueva línea principal
            echo "" >> "$output_file"  # Nueva línea en el archivo de salida
            echo -n "$line" >> "$output_file"
        else
            # Si no tiene ":", se concatena con la línea anterior
            echo -n " $line" >> "$output_file"
        fi
    done < "$input_file"

    # Quitar la primera línea vacía añadida por el script
    sed -i '1d' "$output_file"

    echo "Procesado: $input_file -> $output_file"
done
