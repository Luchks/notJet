#!/bin/bash

# Iterar sobre todos los archivos CSV en el directorio actual
for file in *.csv; do
    [[ -f "$file" ]] || continue  # Evitar problemas si no hay archivos CSV

    temp_file="$(mktemp)"  # Crear un archivo temporal

    # Variables de control
    marca_line=""
    identificador_line=""
    capture_next=0

    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ "$line" == "Marca:"* ]]; then
            marca_line="$line"
        elif [[ "$line" == "identificador:"* ]]; then
            identificador_line="$line"
            capture_next=1  # Marcar para capturar la siguiente línea
        elif [[ $capture_next -eq 1 ]]; then
            if [[ -n "$marca_line" && -n "$identificador_line" && "$line" != *":"* ]]; then
                # Si la línea no contiene ":", concatenamos
                echo "$marca_line $line" >> "$temp_file"
                marca_line=""  # Limpiar para evitar concatenaciones repetidas
            else
                # Si la línea contiene ":", escribimos todo sin concatenar
                echo "$marca_line" >> "$temp_file"
                echo "$identificador_line" >> "$temp_file"
                echo "$line" >> "$temp_file"
            fi
            capture_next=0  # Resetear la bandera
        else
            echo "$line" >> "$temp_file"
        fi
    done < "$file"

    # Reemplazar el archivo original con la versión modificada
    mv "$temp_file" "$file"

done

echo "Proceso completado. Los archivos CSV han sido modificados in situ."

