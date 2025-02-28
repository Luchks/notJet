#!/bin/bash

for file in *.csv; do
    if grep -q "EMP." "$file"; then
        awk '/EMP./ {exit} {print}' "$file" > "temp_$file"
        mv "temp_$file" "$file"
        echo "Procesado: $file"
    else
        echo "No se encontró 'EMP.' en $file, sin cambios."
    fi
done
