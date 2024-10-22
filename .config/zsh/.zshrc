# Prompt
# PS1='%F{white}%~ %(?.%F{yellow}.%F{red})%#%f '

# RPROMPT='$GITSTATUS_PROMPT'
ZVM_CURSOR_STYLE_ENABLED=true

# if which tmux 2>&1 >/dev/null; then
#     if [ $TERM != "xterm-256color" ] && [  $TERM != "xterm" ]; then
#         tmux attach -t home || tmux new -s home; exit
#     fi
# fi
# fpath=(path/to/zsh-completions/src $fpath)
fpath+=($HOME/Dropbox/.dotfiles/.config/zsh/pure)

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
alias iv='nvim'
alias ivm='nvim'
alias vi='nvim'
alias ogvim='/bin/vim'
alias rip='cd ~/.local/share/scripts'
alias zse='vim ~/.config/zsh/.zshrc'
alias ka='killall'
alias path='vim ~/.config/zsh/.zshenv'
alias cb="cbonsai -i -l -w 3"

## Neorg
alias ni='vim -c "Neorg index"'
alias life='vim -c "Neorg workspace life"'
alias notes='vim -c "Neorg workspace notes"'
alias yt='vim -c "Neorg workspace yt"'

## Pacman & Yay
alias syu="yes | sudo pacman -Scc && sudo pacman -Syu && setxkbmap -option 'ctrl:nocaps'"

# cobra-cli
alias ccli='cobra-cli'

## Navigation
alias aa='cd -'
alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'

# Tmux
alias ts='tmux-sessionizer'
alias tp='tmux-pomodoro'

# Git
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gt='git-token'

alias ta='tmux attach'

# Mirrors
alias refup='sudo reflector --latest 5 --country canada --sort rate --save /etc/pacman.d/mirrorlist'

# Font jazz
alias fonts='fc-cache -f -v'
alias fontconf="echo ~/.config/fontconfig/fonts.conf"

# Auto-completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)
eval "$(zoxide init --cmd cd zsh)"

autoload -U promptinit; promptinit
prompt pure

bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
# Custom functions
sz () {
  zathura "$@" &
}

mkd () {
  mkdir -p "$@" && cd "$@"
}

vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

livels() { while :; do clear; tmux display-message -p -F "#{pane_current_path}" -t0 | xargs tree -L 1 ; sleep 1; done }

gmod () {
  go mod init github.com/tokisuno/$@
}

cn () {
    cargo new "$@" --vcs none
}

beatit() { play -n -c1 synth 0.001 sine 1000 pad `awk "BEGIN { print 60/$1 -.001 }"` repeat 9999999 ; } 
source /usr/share/nvm/init-nvm.sh
