while IFS=',' read -r archivo valor faltante; do
    if [[ -f "$archivo" ]]; then
        awk -v val="$valor" -v id="identificador:" -v OFS="," '$0 ~ val {$0 = id val} 1' "$archivo" > temp && mv temp "$archivo"
    fi
done < lista.txt
