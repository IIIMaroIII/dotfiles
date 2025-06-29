#!/usr/local/bin/bash

tsconfig=~/.dotfiles/typescript/tsconfig.json
prettier=~/.dotfiles/.prettierrc
gitignore=~/.dotfiles/.gitignore
dotvscode=~/.dotfiles/.vscode
viteConfig=~/.dotfiles/vite.config.js



if [[ -d ~/.dotfiles ]]; then
    echo "➡️   The folder where the function is calling from $(pwd)"
    cp -R "$tsconfig" "$prettier" "$gitignore" "$viteConfig" "$dotvscode" "$(pwd)"
    echo "✅  The configs $tsconfig, $prettier, $gitignore $viteConfig $dotvscode have been successfully copied to the $(pwd) folder "  
else
    echo "❌ ~/.dotfiles had not found! "
    exit 1
fi
