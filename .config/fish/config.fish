# if fish isn't running, don't do shit
if status is-interactive
  # Commands to run in interactive sessions can go here
  export GLFW_IM_MODULE=ibus
  export XMODIFIERS="@im=ibus"
  export QT_IM_MODULE=ibus
  export GTK_IM_MODULE=ibus
  export CC="clang"
  # used to be a flag: -std=c11 <--- doesn't work with C++
  export CFLAGS="-ferror-limit=1 -gdwarf-4 -ggdb3 -O0 -Wall -Werror -Wextra -Wno-gnu-folding-constant -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wno-unused-but-set-variable -Wshadow"
  export LDLIBS="-lcrypt -lcs50 -lm"
  export NVM_DIR=~/.nvm
  # export DISCORD_TOKEN=$(cat ~/Sync/priv_keys/discord)
  export TMUX_POWERLINE_THEME=my-theme
  # [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm
  export ZK_NOTEBOOK_DIR=$HOME/Sync/zet
  
  set -U fish_history_ignore_spaces
  set -U fish_history_ignore_duplicates
  set -U fish_history_save
  set -U fish_history_max 1000

  set -gx PATH $HOME/bin $PATH
  set -gx PATH /usr/local/bin $PATH
  set -gx PATH $HOME/.cargo/bin $PATH
  set -gx PATH $HOME/.local/share/scripts $PATH
  set -gx PATH $HOME/go $PATH

  # for npm global
  set NPM_PACKAGES "$HOME/.npm-packages"
  set PATH $PATH $NPM_PACKAGES/bin
  set MANPATH $NPM_PACKAGES/share/man $MANPATH  
  set -gx SYNCPATH $HOME/qjtd7-veo9h $SYNCPATH
  set -gx SYNCPATH $HOME/Sync $SYNCPATH

  set -gx NPM_DIR "$HOME/.npm-data"
  set -gx NODE_PATH "$NPM_DIR/lib/node_modules:$NODE_PATH"
  set -gx PATH ~/bin $NPM_DIR/bin $HOME/.local/bin $PATH

  if test -f ~/.config/fish/functions.fish
    source ~/.config/fish/functions.fish
  end
  if test -f ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
  end

end
