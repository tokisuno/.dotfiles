# Prompt
PS1='%F{white}%~ %(?.%F{yellow}.%F{red})%#%f '
RPROMPT='$GITSTATUS_PROMPT'
alias neofetch='archfetch'
ZVM_CURSOR_STYLE_ENABLED=true

# ALIASES
## ls replacement
alias ls='eza'
alias l='eza -lbF --git'
alias ll='eza -lbGF --git'
alias llm='eza -lbGd --git --sort=modified'
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'
alias lS='eza -1'
alias lt='eza --tree --level=2'
alias lz='ls -a'
alias ltr='eza -s modified -r'


## Quality of life
alias vim='nvim'
alias vi='/bin/vim'
alias rip='cd ~/.local/share/scripts'
alias zse='vim ~/.config/zsh/.zshrc'
alias ka='killall'

## Pacman & Yay
alias syu="yes | sudo pacman -Scc && sudo pacman -Syu && setxkbmap -option 'ctrl:nocaps'"
alias sps="sudo pacman -S"
alias spr="sudo pacman -R"
alias yas="yay -S"
alias yar="yay -R"

## Navigation
alias aa='cd -'
alias bk='cd ..'
alias ts='tmux-sessionizer'
alias tp='tmux-pomodoro'
alias tw='tmux-session-switcher'

# Studying
alias zki="zk list --interactive"
alias zkm="zk list --interactive --sort=modified"
alias org='vim $(vizel unconnected ~/Dropbox/zet)'
alias todo='vim ~/Dropbox/todo/todo.md'
alias dodo='bat ~/Dropbox/todo/todo.md'
alias thot='vim ~/Dropbox/todo/thoughts.md'
alias cheat='cht.sh'

alias fonts='fc-cache -f -v'

# Auto-completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
eval "$(zoxide init --cmd cd zsh)"


# Custom functions
sz () {
  zathura "$@" &
}

mkd () {
  mkdir -p "$@" && cd "$@"
}

run () {
  rm -rf a.out && g++ -std=c++23 -Wall -Wextra -Werror -O2 $@ && ./a.out
}

zkn () {
  zk new --title="$@"
}


gmod () {
  go mod init github.com/tokisuno/$@
}
