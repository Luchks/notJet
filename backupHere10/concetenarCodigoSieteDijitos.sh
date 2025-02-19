#!/bin/bash

# Expresión regular para buscar la cadena específica
regex='^[A-Z][A-Z0-9]{5}[0-9]$'

# Iterar sobre todos los archivos CSV en el directorio
for file in *.csv; do
    [[ -f "$file" ]] || continue  # Verificar si hay archivos CSV en el directorio

    tmp_file=$(mktemp)  # Crear un archivo temporal

    # Leer línea por línea
    while IFS= read -r line; do
        # Eliminar espacios en blanco por seguridad
        clean_line=$(echo "$line" | tr -d '[:space:]')

        # Verificar si la línea cumple con la expresión regular
        if [[ "$clean_line" =~ $regex ]]; then
            echo "Identificador:$clean_line" >> "$tmp_file"
        else
            echo "$line" >> "$tmp_file"
        fi
    done < "$file"

    # Reemplazar el archivo original con el archivo modificado
    mv "$tmp_file" "$file"
    echo "Procesado: $file"
done

echo "Proceso completado."
