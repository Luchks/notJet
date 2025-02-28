while IFS=',' read -r valor archivo; do
    if [[ -f "$archivo" ]]; then
        awk -v val="$valor" -v id="identificador:" -v OFS="," '$0 ~ val {sub(val, id val)} 1' "$archivo" > temp && mv temp "$archivo"
    fi
done < lista.txt
