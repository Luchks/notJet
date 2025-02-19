#!/bin/bash

# Nombre del archivo de salida
output_file="unido.csv"

# Si el archivo de salida ya existe, lo eliminamos
if [[ -f $output_file ]]; then
    rm $output_file
fi

# Variable para asegurarse de que no se agreguen cabeceras repetidas
header_added=false

# Recorremos todos los archivos CSV en el directorio actual
for file in *.csv; do
    # Si es el primer archivo, copiamos la cabecera
    if [ "$header_added" = false ]; then
        cat "$file" > "$output_file"
        header_added=true
    else
        # Si no es el primer archivo, añadimos el contenido sin la cabecera
        tail -n +2 "$file" >> "$output_file"
    fi
done

echo "Archivos CSV unidos en $output_file"
