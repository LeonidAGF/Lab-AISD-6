#!/bin/bash
upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
lower="abcdefghijklmnopqrstuvwxyz"
read -p "path: " target_dir
read -p "col: " shift
upper_shifted="${upper:$shift}${upper:0:$shift}"
lower_shifted="${lower:$shift}${lower:0:$shift}"
find "$target_dir" -type f -name "*.txt" | while read -r file
do
    content=$(tr "$upper$lower" "$upper_shifted$lower_shifted" < "$file")
    echo "$content" > "$file"
done
echo "done"