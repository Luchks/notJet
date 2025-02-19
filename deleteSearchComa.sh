for file in ./here/*.csv; do
    if [[ $(grep -o ',' "$file" | wc -l) -le 2 ]]; then
        echo "$file"
    fi
done

