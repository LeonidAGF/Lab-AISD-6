#!/bin/bash

upper="ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
lower="abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя"

read -p "path: " target_dir
read -p "col: " shift_val

upper_shifted="${upper:$shift_val}${upper:0:$shift_val}"
lower_shifted="${lower:$shift_val}${lower:0:$shift_val}"

find "$target_dir" -type f -name "*.txt" | while read -r file; do

    tr "$upper$lower" "$upper_shifted$lower_shifted" < "$file" > "$file.tmp"
    mv "$file.tmp" "$file"

done

echo "done"