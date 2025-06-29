#!/usr/local/bin/bash


ifSrcExists() {
    if [[ "$1" == */src/* || "$1" == */src ]];then
        dir=$(dirname "$1")
        dir="${dir%%/src*}"
        echo "$dir"
    fi
}

curDir="$(pwd)"
counter=0

while IFS= read -r file; do
    bsname=$(basename "$file")
    newname=${bsname%.ts}
    dir=$(ifSrcExists "$file")

    if [[ -n "$dir" ]]; then
        modifiedName="$newname.types.ts"
        if [[ ! -e "$dir/src/types/$modifiedName" ]]; then
            mkdir -p "$dir/src/types"
            (( counter++ ))
            touch "$dir/src/types/$modifiedName"
            echo "➡️ ➡️ ➡️  File has been created: $dir/src/types/$modifiedName"
        fi

        
    fi
done< <(find "$curDir" -type f -iname "*.ts" ! -iname "*.d.ts" ! -iname "main.ts")

echo "✅ Total files were converted from .ts to .types.ts: $counter"
