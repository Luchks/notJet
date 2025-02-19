#!/bin/bash

# Expresión regular para buscar códigos válidos
regex='^[A-Z][A-Z0-9]{4,6}[0-9]{3}$'

# Iterar sobre todos los archivos CSV en el directorio
for file in *.csv; do
    # Verificar si hay archivos CSV en el directorio
    [[ -f "$file" ]] || continue

    # Crear un archivo temporal para almacenar cambios
    tmp_file=$(mktemp)

    # Leer línea por línea
    while IFS= read -r line; do
        # Eliminar espacios en blanco y verificar si la línea cumple con el patrón
        clean_line=$(echo "$line" | tr -d '[:space:]')
        if [[ "$clean_line" =~ $regex ]]; then
            echo "identificador:$clean_line" >> "$tmp_file"
        else
            echo "$line" >> "$tmp_file"
        fi
    done < "$file"

    # Reemplazar el archivo original con el archivo modificado
    mv "$tmp_file" "$file"
    echo "Procesado: $file"
done

echo "Proceso completado."
