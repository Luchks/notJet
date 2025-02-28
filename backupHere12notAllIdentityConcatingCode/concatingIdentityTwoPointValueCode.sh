#!/bin/bash

# Declarar un array asociativo
declare -A diccionario

# Leer la lista y poblar el diccionario
while IFS=',' read -r archivo valor; do
    archivo=$(echo "$archivo" | tr -d ' ')  # Elimina espacios en los nombres de archivo
    diccionario["$archivo"]="$valor"
done < lista.txt  # Cambiar por el nombre real del archivo con los datos

# Buscar archivos en el mismo directorio que el script
for archivo in "${!diccionario[@]}"; do
    if [[ -f "$archivo" ]]; then
        valor_buscar="${diccionario[$archivo]}"

        # Verifica si el valor está en el archivo
        if grep -q "$valor_buscar" "$archivo"; then
            # Reemplaza el valor en el archivo manteniendo el resto intacto
            sed -i "s/$valor_buscar/identificador:$valor_buscar/g" "$archivo"
            echo "Modificado en $archivo: identificador:$valor_buscar"
        fi
    else
        echo "Archivo no encontrado: $archivo"
    fi
done
