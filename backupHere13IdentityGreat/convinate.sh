for file in *.csv; do
    awk -v fname="$file" 'BEGIN {FS=OFS=","} {print $0, fname}' "$file"
done > archivo_unido.txt
