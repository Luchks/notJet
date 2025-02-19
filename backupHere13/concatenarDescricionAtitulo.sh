#!/bin/bash

# Array con los nombres de los archivos a procesar
archivos=(
    "pagina_08_seccion_6.csv"
    "pagina_08_seccion_5.csv"
    "pagina_67_seccion_5.csv"
    "pagina_67_seccion_6.csv"
    "pagina_75_seccion_6.csv"
    "pagina_75_seccion_5.csv"
    "pagina_67_seccion_8.csv"
    "pagina_77_seccion_6.csv"
    "pagina_77_seccion_5.csv"
)

# Directorio donde están los archivos CSV (ajústalo si es necesario)
DIRECTORIO="./"

# Procesar cada archivo del array si existe
for archivo in "${archivos[@]}"; do
    ruta_archivo="${DIRECTORIO}/${archivo}"

    # Verificar si el archivo existe
    if [[ -f "$ruta_archivo" ]]; then
        # Crear un archivo temporal para almacenar la salida procesada
        archivo_tmp="${ruta_archivo}.tmp"

        while IFS= read -r linea; do
            if [[ ! "$linea" =~ [,|:] ]]; then
                echo "descripcion: $linea"
            else
                echo "$linea"
            fi
        done < "$ruta_archivo" > "$archivo_tmp"

        # Reemplazar el archivo original con el modificado
        mv "$archivo_tmp" "$ruta_archivo"
        echo "Procesado: $archivo"
    else
        echo "No encontrado: $archivo"
    fi
done

echo "Proceso completado."
