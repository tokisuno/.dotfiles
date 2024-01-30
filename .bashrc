# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

[[ $- != *i* ]] && return


export OSH="$HOME/.oh-my-bash"
export DICTIONARY=en_US
# env vars
export PAGER=less
export GLFW_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus
export GTK_IM_MODULE=ibus
export CC="clang"
export CFLAGS="-ferror-limit=1 -gdwarf-4 -ggdb3 -O0 -Wall -Werror -Wextra -Wno-gnu-folding-constant -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wno-unused-but-set-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"
export NVM_DIR=~/.nvm
export EDITOR="/usr/bin/nvim"
export TMUX_POWERLINE_THEME=my-theme
export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/scripts:$HOME/go:$NPM_PACKAGES/bin:$HOME/.luarocks/bin/digestif"

# FZF
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info" 

# npm shit
export NPM_DIR="$HOME/.npm-data"
NPM_PACKAGES="$HOME/.npm-packages"

export SYNCPATH="$HOME/Sync"
export ZK_NOTEBOOK_DIR=$HOME/Sync/zet

# aliases
alias grep='grep --color=auto'

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

# vim shit
alias vim='nvim'
alias vi='/bin/vim'
alias rip='cd ~/.local/share/scripts' 
alias snips="vim ~/.config/nvim/LuaSnip/tex.lua"

# for blog 
alias sdfh="cd ~/projects/repos/blog"
alias comt="hugo server -D"
alias compp="hugo --gc -t hugo-simplecss"
alias compb="hugo --gc -t xmin"

# for programming
alias py='python'

# misc
alias back="cd .."
alias lkj='ssh server@192.168.0.203'
alias mpv='devour mpv' 
alias gay="pridefetch -f bisexual"
alias ka='killall'
alias syu="sudo pacman -Syu"

# zettelkasten
alias zlk="zk list --interactive"

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

fullpath() {
  local -r full=$(perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1")
  echo "$full"
} 
# zettelkasten 
zlkj () {
  zk list --interactive -t $1
}

completions=(
  git
  composer
  ssh
)

plugins=(
  git
  bashmarks
)

source ~/.local/share/scripts/fzf_scripts/completion.bash
source ~/.local/share/scripts/fzf_scripts/key-bindings.bash
source "$OSH"/oh-my-bash.sh
