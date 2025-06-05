#!/usr/local/bin/bash

read -rp "Which folder do you wanna organize?: " folder

while IFS= read -r -d '' filename; do
    case "$filename" in
        *.jpg|*.jpeg|*.HEIC|*.png)
            subfolder="images" ;;
        *.tar*|*.zip)
            subfolder="archives" ;;
        *.doc|*.docx|*.txt|*.pdf)
            subfolder="documents" ;;
        *.xls|*.xlsx|*.csv) 
            subfolder="spreadsheets" ;;
        *.sh)
            subfolder="scripts" ;;
        *.ppt|*.pptx)
            subfolder="presentation" ;;
        *.mp3|*.aac)
            subfolder="audio" ;;
        *.mp4|*.mkv|*.avi)
            subfolder="video" ;;
        *)
            subfolder="others" ;;
    esac
        if [[ ! -d "$folder/$subfolder" ]]; then
            mkdir "$folder/$subfolder"
        fi

        [[ "$(dirname "$filename")" == "$folder/$subfolder" ]] && continue

        mv "$filename" "$folder/$subfolder"
    done < <(find "$folder" -type f -print0)
