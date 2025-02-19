#!/bin/bash

input_folder="."  # Cambiar la carpeta de entrada a la misma donde está el script

echo "Procesando archivos CSV en $input_folder..."

# Procesar cada archivo CSV en la carpeta
for file in "$input_folder"/*.csv; do
    echo "Procesando: $file"
    temp_file="${file}.tmp"
    > "$temp_file"
    
    while IFS= read -r line; do
        if [[ "$line" =~ ^Modelo: ]]; then
            merged_line="$line"
            while IFS= read -r next_line; do
                if [[ "$next_line" == *":"* ]]; then
                    echo "$merged_line" >> "$temp_file"
                    echo "$next_line" >> "$temp_file"
                    break  # Si encontramos dos puntos en la línea, dejamos de fusionar y continuamos normalmente
                fi
                merged_line+=" "$next_line  # Concatenamos la línea a la actual
            done
        else
            echo "$line" >> "$temp_file"
        fi
    done < "$file"
    
    mv "$temp_file" "$file"  # Reemplazar el archivo original con la versión modificada

done

echo "Proceso completado. Los archivos CSV han sido modificados en su lugar."

