while IFS=',' read -r archivo valor faltante; do
    if [[ -f "$archivo" ]]; then
        awk -v val="$faltante" -v OFS="," 'NR==1 { print $0 val } NR>1 { print $0 }' "$archivo" > temp && mv temp "$archivo"
    fi
done < lista.txt
