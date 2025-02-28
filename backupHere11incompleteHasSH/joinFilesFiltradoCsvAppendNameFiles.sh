#!/bin/bash

# Directorio donde se encuentran los archivos CSV
DIRECTORIO="./"

# Archivo de salida combinado
archivo_combinado="filtrado_combinado_con_nombre.csv"

# Limpiar archivo combinado si existe
echo -n "" > "$archivo_combinado"

# Recorre todos los archivos CSV filtrados en el directorio
for archivo in "$DIRECTORIO"/*_filtrado.csv; do
    # Verifica si existen archivos filtrados
    [ -e "$archivo" ] || continue
    
    # Agregar contenido al archivo combinado con una nueva columna con el nombre del archivo
    awk -v filename="$(basename "$archivo")" '{print $0 "," filename}' "$archivo" >> "$archivo_combinado"
    
    echo "Archivo agregado: $archivo"
done

echo "Archivos combinados en: $archivo_combinado"
