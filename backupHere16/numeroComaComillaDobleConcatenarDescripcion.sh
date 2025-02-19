#!/bin/bash

# Definir el array con los nombres de los archivos
archivos=(
    "pagina_08_seccion_1.csv"
    "pagina_77_seccion_1.csv"
    "pagina_77_seccion_2.csv"
    "pagina_75_seccion_3.csv"
    "pagina_08_seccion_3.csv"
    "pagina_67_seccion_3.csv"
    "pagina_77_seccion_3.csv"
    "pagina_08_seccion_4.csv"
    "pagina_75_seccion_4.csv"
    "pagina_77_seccion_4.csv"
    "pagina_08_seccion_7.csv"
    "pagina_67_seccion_7.csv"
    "pagina_26_seccion_7.csv"
    "pagina_81_seccion_7.csv"
    "pagina_75_seccion_7.csv"
    "pagina_77_seccion_7.csv"
    "pagina_08_seccion_8.csv"
    "pagina_67_seccion_8.csv"
    "pagina_26_seccion_8.csv"
    "pagina_75_seccion_8.csv"
    "pagina_81_seccion_8.csv"
    "pagina_77_seccion_8.csv"
   )

# Iterar sobre cada archivo en el array
for archivo in "${archivos[@]}"; do
    if [[ -f "$archivo" ]]; then
        echo "Procesando: $archivo"

        # Procesar línea por línea y modificar solo las que cumplan la condición
        awk -F',' '{
            if ($1 ~ /^[0-9]+$/ && $2 ~ /^".*$/) {
                sub(/^"/, "descripcion: ", $2)  # Reemplazar la primera comilla con "descripcion: "
            }
            print $0  # Imprimir toda la línea (modificada o no)
        }' "$archivo" > temp && mv temp "$archivo"

    else
        echo "Archivo no encontrado: $archivo"
    fi
done

echo "Proceso terminado."

