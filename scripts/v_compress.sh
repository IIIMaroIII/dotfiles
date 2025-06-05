#!/usr/local/bin/bash
source ~/.dotfiles/.bash_functions

check_ffmpeg

shopt -s globstar nullglob

read -rp "  🚀 Enter the starting directory: " dir

dir="${dir/#\~/$HOME}"

if [[ ! -d "$dir" ]]; then
    echo "  ❌ Invalid directory for searching in"
    exit 1
fi

files=($dir/**/*.mov)
green=$(tput setaf 2)
blue=$(tput setaf 4)
red=$(tput setaf 1)
cyan=$(tput setaf 6)
reset=$(tput sgr0)
found_any=false
counter=0

echo "${blue}→→→${cyan} Starting at $(date '+%H:%M:%S')"
for file in "${files[@]}"; do
    # if the file in array includes 'converted' in its name, then do;
    if [[ "$file" != *converted* ]]; then
        size=$(stat --format="%s" "$file" | numfmt --to=iec)
        echo "${blue}→→→ ${green}We found: $file ➡️  ➡️  ➡️   ${cyan}$size"
        ((counter++))
        found_any=true

        # Prepend 'converted' to the original file name
        converted_f_name="converted_${file##*/}"
        modified_path="${file%/*}"
        output="$modified_path/$converted_f_name"

        echo "  🚀 We are starting compressing the $file"
        echo "  📁 The final output for a file is: $output"

        # using an ffmpeg to compress the video file to 480p, audio to aac, bitrate to 128,libx264 with fast preset;

        ffmpeg -y -i "$file" -vf "scale=-2:480" -c:v libx265 -crf 28 -preset medium -c:a aac -b:a 128k "$output"

        # check if the exit state is success, then delete an original file;
        if [[ $? -eq 0 ]] ; then
            rm "$file"
            echo "❌ The original file $file was successfully deleted after compression ❌"
            echo "🍀 Note: the new compressed file is $output"
        else
            echo "⚠️  The $file has not been deleted for some reason ⚠️  "
        fi
    fi
done
    # if doesn include, then just echo it;
    if ! $found_any; then
        echo "💭 Sorry we didn't found any uncompressed files."
    fi
echo "${blue}→→→${cyan} The total amount of uncompressed files is: ${red}$counter"
echo "${blue}→→→${cyan} Finished at $(date '+%H:%M:%S')"
