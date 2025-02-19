#!/bin/bash

# Iterar sobre todos los archivos CSV en el directorio
for file in *.csv; do
    # Verificar si hay archivos CSV en el directorio
    [[ -f "$file" ]] || continue

    # Crear un archivo temporal para almacenar cambios
    tmp_file=$(mktemp)

    # Leer línea por línea
    while IFS= read -r line; do
        if [[ "$line" == *"Marca:"* ]]; then
            # Eliminar todo lo que esté a la izquierda de "Marca:"
            new_line=$(echo "$line" | sed 's/.*Marca:/Marca:/')
            echo "$new_line" >> "$tmp_file"
        else
            echo "$line" >> "$tmp_file"
        fi
    done < "$file"

    # Reemplazar el archivo original con el archivo modificado
    mv "$tmp_file" "$file"
    echo "Procesado: $file"
done

echo "Proceso completado."

