#!/usr/bin/zsh

# zsh
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

export ALTERNATE_EDITOR=""
# export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
# export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
export EDITOR="/usr/bin/nvim"                     # I will go back to Emacs eventually

export DICTIONARY=en_US
export PAGER=less

export PASSWORD_STORE_DIR=$HOME/Dropbox/pass

export GTK_THEME=Arc-Dark

# path
export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/scripts:$HOME/go:$NPM_PACKAGES/bin:$HOME/.luarocks/bin/digestif:/usr/bin/:/bin"
export PATH=${PATH}:`go env GOPATH`/bin
export PATH=${PATH}:"$HOME/.local/share/applications"
export PATH=${PATH}:"$HOME/.local/share/gem/ruby/3.2.0/bin"
export PATH=${PATH}:"$GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin"
export PATH=${PATH}:"/root/.local/share/gem/ruby/3.2.0/bin"
export PATH=${PATH}:"$HOME/.config/emacs/bin"

# keyboard
export GLFW_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus
export GTK_IM_MODULE=ibus

# misc
export CC="clang"
export NVM_DIR=~/.nvm
export TMUX_POWERLINE_THEME=my-theme
export GOPATH="$HOME/go"
export SYNCPATH="$HOME/Dropbox"
export ZK_NOTEBOOK_DIR=$HOME/Dropbox/zk

eval "$(fzf --zsh)"

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
export PATH=${PATH}:"~/.npm-global/bin"
export NPM_DIR="$HOME/.npm-data"
NPM_PACKAGES="$HOME/.npm-packages"

# source $ZDOTDIR/gitstatus/gitstatus.prompt.zsh
source $ZDOTDIR/zsh-edit/zsh-edit.plugin.zsh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/.zshrc
source $ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh
