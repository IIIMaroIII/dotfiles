#_____________________________________________________________________________________________________________________
#Bash
#_____________________________________________________________________________________________________________________
alias srcbash="source ~/.dotfiles/.bashrc"
alias gcc="gcc -fdiagnostics-color=always"
alias ls='gls --color=always'
alias grep='ggrep --color=always'
alias less='less -R'
alias ll="ls -alF"
alias ..="cd ../"
alias ...="cd ../../"
alias l="ls -CF"
alias get-chrome='curl -L -o ~/Downloads/googleChrome.dmg https://dl.google.com/chrome/mac/universal/stable/CHFA/googlechrome.dmg'
alias du="du -h"
alias c="clear"
alias cl="c;l"
alias cll="c;ll"
alias ip="curl ipinfo.io/ip"
alias mkdir="mkdir -p"
alias sl="sudo shutdown -s now"
alias shutdown="sudo shutdown -h now"
alias find="gfind"
alias b_iterm="$(which iterm_backup)"
alias dot="cd ~/.dotfiles"
alias gpu_log="log stream --predicate '(eventMessage CONTAINS[c] "GPU" OR eventMessage CONTAINS[c] "IOAccelerator" OR eventMessage CONTAINS[c] "thermal" OR eventMessage CONTAINS[c] "watchdog")' --info >> gpu_watch_2.log"

#_____________________________________________________________________________________________________________________
#GIT
#_____________________________________________________________________________________________________________________
alias gs="git status"
alias gb="git branch"
alias gpl="git pull"
alias gaa="git add ."
alias gpu="git push"
alias grv="git remote -v"
alias gf="git fetch"
## Git branch
alias gbr="git branch -r"

gbd() {
    git branch -d "$1"
}

gbch() {
    git checkout "$1"
}

gbc() {
    git checkout -b "$1"
}

gcm() {
    git commit -am "$1"
}
gra() {
    #git@github.com:your-username/ehu.git
    git remote add origin "$1"
}

gpo() {
    git push --set-upstream origin "$1"
}

grs() {
    git remote set-url origin "$1"
}
