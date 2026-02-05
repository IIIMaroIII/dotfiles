
# source the .bash.vars
if [[ -f ~/.dotfiles/.bash.vars ]]; then
	source ~/.dotfiles/.bash.vars
fi

#======= SOURCES  ========

#======= EXPORT SECTION ========
export HOMEBREW_NO_AUTO_UPDATE="1"
export GREP_COLORS='mt=1;31:fn=1;35:ln=1;32'
export LS_COLORS='di=1;36:ln=1;30;31:ex=0;30;42:*.txt=1;34:*.sh=1;32'
export PROMPT_DIRTRIM=3 #shorten the prompt up to 3 folders
export GCC_COLORS="error=01;31:warning=01;33:note=01;34:caret=01;36"
export PATH="~/Desktop/bash-scripting-course/scripts:/Users/rod/.dotfiles/scripts:/usr/local/opt/tailscale/bin:/usr/local/Cellar/tailscale/1.82.4/bin:/Applications/IntelliJ IDEA.app/Contents/MacOS:/Library/TeX/texbin:$PATH"
export EDITOR="vim"
# tput colours
export black="$(tput setaf 0)"
export red="$(tput setaf 1)"
export green="$(tput setaf 2)"
export yellow="$(tput setaf 3)"
export blue="$(tput setaf 4)"
export magenta="$(tput setaf 5)"
export cyan="$(tput setaf 6)"
export white="$(tput setaf 7)"
export grey="$(tput setaf 8)"
export reset="$(tput sgr0)"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GEMINI_API_KEY="AIzaSyAgastZq5XsFkk9vzZBWJq_gLv7wPmSYcY"
#======== EXPORT SECTION ========

#============= PROMPT =============
# get current branch in git repo
function parse_git_branch() {
	BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]; then
		STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}
#export PS1="\[\e[1;30;42m\] \u@\h: \[\e[0m\] 📁 \[\e[1;32m\]\w\[\e[m\] 📁 \[\e[1;33m\]\${blue}\$(parse_git_branch)\n\[\e[1;32m\]〉\[\e[0;37m\]"
# ░ ▓ ▷ ⨌  ➤ ⮕ ⪼ 🔷 🔵 ⚪ ⚫ 🔲 ⬛ ☰ ▶▶▶ ＞＞＞➢ ➤➤➤ ➙➧⭆ ➤⮑  ⮕ ❯ ❭ 〉ᐳ 📁
export PS1="\[\e[1;30;42m\] \u@\h: \[\e[0m\] 📁 \[\e[1;32m\]\$(short_pwd)\[\e[m\] 📁 \[\e[1;33m\]\$(git_branch)\n\[\e[1;32m\]〉\[\e[0;37m\] "
#============= PROMPT =============
#
export HOMEBREW_NO_INSTALL_CLEANUP=1
