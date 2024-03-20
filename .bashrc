# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

[[ $- != *i* ]] && return

# exports
export OSH="$HOME/.oh-my-bash"
export DICTIONARY=en_US
export PAGER=less
export GLFW_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus
export GTK_IM_MODULE=ibus
export CC="clang"
# export CFLAGS="-ferror-limit=1 -gdwarf-4 -ggdb3 -O0 -Wall -Werror -Wextra -Wno-gnu-folding-constant -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wno-unused-but-set-variable -Wshadow"
export CFLAGS="-Wall -W -Werror -Wextra -pedantic -O0 -lm -Wcomment -std=c17"
# export LDLIBS="-lcrypt -lm"
export NVM_DIR=~/.nvm
export EDITOR="/usr/bin/nvim"
export TMUX_POWERLINE_THEME=my-theme
export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/scripts:$HOME/go:$NPM_PACKAGES/bin:$HOME/.luarocks/bin/digestif"
export PATH=${PATH}:`go env GOPATH`/bin
export SYNCPATH="$HOME/Sync"
export ZK_NOTEBOOK_DIR=$HOME/Sync/zet

# FZF
export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border --inline-info" 
export FZF_PREVIEW_COMMAND="bat --style=numbers,changes --wrap never --color always {} || cat {} || tree -C {}"
export FZF_CTRL_T_OPTS="--min-height 30 --preview-window down:60% --preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
export FZF_COMPLETION_TRIGGER=']]'
export FZF_COMPLETION_OPTS='--border --info=inline'

# npm shit
export NPM_DIR="$HOME/.npm-data"
NPM_PACKAGES="$HOME/.npm-packages"

alias grep='grep --color=auto'

alias anime='ani-cli'

# better ls command 
alias lf='lfrun'
alias ls='eza'
alias l='eza -lbF --git'
alias ll='eza -lbGF --git'
alias llm='eza -lbGd --git --sort=modified'
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale' 
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'
alias lS='eza -1'
alias lt='eza --tree --level=2'
alias lA='ls -a'

alias todo='vim ~/Sync/todo/todo.md'
alias timer='tomatoshell -t 50 -d 10 -n 10'
alias vim='nvim'
alias vi='/bin/vim'
alias rip='cd ~/.local/share/scripts' 
alias vs='vim $(fzf)'
alias leet='vim leetcode.nvim'

alias bed="vim ~/.bashrc"

alias gay="pridefetch -f bisexual"
alias ka='killall'
alias syu="yes | sudo pacman -Scc && sudo pacman -Syu && setxkbmap -option 'ctrl:nocaps'"
alias kii="setxkbmap -option 'ctrl:nocaps'"
# zettelkasten
alias zki="zk list --interactive"                 # (z)ettel(k)asten(interactive)
alias zkm="zk list --interactive --sort=modified" # (z)ettel(k)asten(modified)

alias pe="pipenv" 

# OMB settings
PS1='[\u@\h \W]\$ '
OSH_THEME="simple"
OMB_CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS='[yyyy-mm-dd]'
OMB_USE_SUDO=true

# functions
sz () { 
  zathura "$1" & 
}
tab () {
  tabbed -c zathura "$1" -e &
}
2pdf () {
  pandoc $1 -o $1.pdf
}
mkd () {
	mkdir $1
	cd $1
}
completions=(
  git
  composer
)

plugins=(
  git
)

source ~/.local/share/scripts/fzf_scripts/completion.bash
source ~/.local/share/scripts/fzf_scripts/key-bindings.bash
source "$OSH"/oh-my-bash.sh
eval "$(zoxide init bash --cmd cd)"
