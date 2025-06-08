# Load interactive settings
if [[ -f ~/.dotfiles/.bashrc ]]; then
  source ~/.dotfiles/.bashrc
fi
#set PATH so it includes user`s private .scripts folder if it exists
if [[ -d $HOME/.dotfiles/.scripts ]]; then
 	PATH="$HOME/.dotfiles/.scripts:$PATH"
fi
