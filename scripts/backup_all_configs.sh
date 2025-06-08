#!/bin/bash

set -e

echo "➡️   Backing up Git configs..."

if [[ -e ~/.gitconfig ]]; then
    cp ~/.gitconfig ~/.dotfiles/.gitconfig
else
    echo "⚠️   ~/.gitconfig not found"
fi

if [[ -e ~/.gitignore_global ]]; then
    cp ~/.gitignore_global ~/.dotfiles/.gitignore_global
else
    echo "⚠️  ~/.gitignore_global not found"
fi

echo "➡️   Backing up GitHub CLI config..."

[[ -d ~/.dotfiles/.gh ]] || mkdir -p ~/.dotfiles/.gh
if [[ -e ~/.config/gh/config.yml ]]; then
    cp ~/.config/gh/config.yml ~/.dotfiles/.gh/config.yml
else
    echo "⚠️  ~/.config/gh/config.yml not found"
fi

echo "➡️   Backing up Node/npm configs..."
if [[ -e ~/.npmrc ]]; then
    cp ~/.npmrc ~/.dotfiles/.npmrc
else
    echo "⚠️  ~/.npmrc not found"

fi

if [[ -e ~/.nvmrc ]]; then
    cp ~/.nvmrc ~/.dotfiles/.nvmrc
else
    echo "⚠️  ~/.nvmrc not found"
fi

echo "➡️   Backing up Vim configs..."

if [[ -e ~/.vimrc ]]; then
    cp ~/.vimrc ~/.dotfiles/.vimrc
else
    echo "⚠️  ~/.vimrc not found"
fi

if [[ -d ~/.vim ]]; then
    [[ -d ~/.dotfiles/.vim ]] || mkdir -p ~/.dotfiles/.vim
    rsync -a --delete ~/.vim/ ~/.dotfiles/.vim/
else
    echo "⚠️  ~/.vim directory not found"
fi

echo "➡️  Backing up bash_profile..."

if [[ -e ~/.bash_profile ]]; then
    cp ~/.bash_profile ~/.dotfiles/.bash_profile
else
    echo "⚠️  ~/.bash_profile not found"
fi

echo "➡️  Backing up Tailscale config..."

[[ -d ~/.dotfiles/.tailscale ]] || mkdir -p ~/.dotfiles/.tailscale

if [[ -e /usr/local/etc/tailscale/tailscale.conf ]]; then
    cp /usr/local/etc/tailscale/tailscale.conf ~/.dotfiles/.tailscale/tailscale.conf
else
    echo "⚠️  /usr/local/etc/tailscale/tailscale.conf not found"
fi

echo "➡️   Backing up macOS Terminal profile..."

[[ -d ~/.dotfiles/.terminal ]] || mkdir -p ~/.dotfiles/.terminal
if [[ -e ~/Library/Preferences/com.apple.Terminal.plist ]]; then
    cp ~/Library/Preferences/com.apple.Terminal.plist ~/.dotfiles/.terminal/com.apple.Terminal.plist
else
    echo "⚠️  ~/Library/Preferences/com.apple.Terminal.plist not found"
fi

echo "➡️   Dumping Brewfile..."

brew bundle dump --file=~/.dotfiles/Brewfile --force

echo "➡️   Copying SSH keys..."

if [[ -d ~/.ssh ]]; then
    [[ -d ~/.dotfiles/.ssh ]] || mkdir -p ~/.dotfiles/.ssh
    rsync -a ~/.ssh/ ~/.dotfiles/.ssh
else
    echo "⚠️  ~/.ssh doesnt exist"
fi

echo "✅  All configs and Brewfile backed up to ~/.dotfiles"

