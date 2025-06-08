set -e

echo "🛠️  Installing Homebrew and packages from Brewfile..."

if ! command -v brew &>/dev/null; then
  echo "➡️  Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  export PATH="/usr/local/bin:$PATH"
fi

brew bundle --file=~/.dotfiles/Brewfile

if [[ ! -d ~/.dotfiles ]]; then
  echo "❌ Error: ~/.dotfiles directory not found. Please clone/download it manually before running this script."
  exit 1
fi

echo "🛠️  Restoring Git configs..."
[[ -e ~/.dotfiles/.gitconfig ]] && cp ~/.dotfiles/.gitconfig ~/.gitconfig
[[ -e ~/.dotfiles/.gitignore_global ]] && cp ~/.dotfiles/.gitignore_global ~/.gitignore_global

echo "🛠️  Restoring GitHub CLI config..."
if [[ -e ~/.dotfiles/.gh/config.yml ]]; then
  mkdir -p ~/.config/gh
  cp ~/.dotfiles/.gh/config.yml ~/.config/gh/config.yml
fi

echo "🛠️  Restoring Node/npm configs..."
[[ -e ~/.dotfiles/.npmrc ]] && cp ~/.dotfiles/.npmrc ~/.npmrc
[[ -e ~/.dotfiles/.nvmrc ]] && cp ~/.dotfiles/.nvmrc ~/.nvmrc

echo "🛠️  Restoring Vim config..."
[[ -e ~/.dotfiles/.vimrc ]] && cp ~/.dotfiles/.vimrc ~/.vimrc
if [[ -d ~/.dotfiles/.vim ]]; then
  mkdir -p ~/.vim
  rsync -a --delete ~/.dotfiles/.vim/ ~/.vim/
fi

echo "🛠️  Restoring Bash configs..."
[[ -e ~/.dotfiles/.bash_profile ]] && cp ~/.dotfiles/.bash_profile ~/.bash_profile
[[ -e ~/.dotfiles/.bashrc ]] && cp ~/.dotfiles/.bashrc ~/.bashrc
[[ -e ~/.dotfiles/.bash_aliases ]] && cp ~/.dotfiles/.bash_aliases ~/.bash_aliases
[[ -e ~/.dotfiles/.bash_functions ]] && cp ~/.dotfiles/.bash_functions ~/.bash_functions

echo "🛠️  Restoring Tailscale config..."
if [[ -e ~/.dotfiles/.tailscale/tailscale.conf ]]; then
  sudo mkdir -p /usr/local/etc/tailscale
  sudo cp ~/.dotfiles/.tailscale/tailscale.conf /usr/local/etc/tailscale/tailscaled.conf
fi

echo "🛠️  Restoring macOS Terminal profile..."
[[ -e ~/.dotfiles/.terminal/com.apple.Terminal.plist ]] && cp ~/.dotfiles/.terminal/com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist

echo "✅ Restore complete! You may want to restart your terminal."
