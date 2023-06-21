# prob the messiest .zshrc in existence  
# requires motivate repo 
motivate 

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
PATH=$HOME/bin:/usr/local/bin:$PATH
export GLFW_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus
export GTK_IM_MODULE=ibus
export CC="clang"
export CFLAGS="-ferror-limit=1 -gdwarf-4 -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-gnu-folding-constant -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wno-unused-but-set-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"
setopt auto_cd
ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.local/share/scripts:$PATH"
export EDITOR=/usr/bin/nvim
export GOPATH=$HOME/go

alias make50='make CC=clang CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow" LDLIBS="-lcrypt -lcs50 -lm"'


# export DB_FILE="~/Sync/todo/default.db" 
plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# zshrc or bashrc
lf () {
	LF_TEMPDIR="$(mktemp -d -t lf-tempdir-XXXXXX)"
	LF_TEMPDIR="$LF_TEMPDIR" lf-run -last-dir-path="$LF_TEMPDIR/lastdir" "$@"
	if [ "$(cat "$LF_TEMPDIR/cdtolastdir" 2>/dev/null)" = "1" ]; then
		cd "$(cat "$LF_TEMPDIR/lastdir")"
	fi
	rm -r "$LF_TEMPDIR"
	unset LF_TEMPDIR
}

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

mkd ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}



# [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# User configuration
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='nvim'
    else
        export EDITOR='nvim'
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"          
fi

if [ -d "$HOME/.deno/bin" ] ; then
    PATH="$HOME/.deno/bin:$PATH"          
fi

# Aliases

# general use
alias ls='exa'                                                          # ls
alias l='exa -lbF --git'                                                # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# specialty views
alias lS='exa -1'                                                              # one column, just names
alias lt='exa --tree --level=2'                                         # tree

alias vim='nvim'
alias gg="ga && gc && gp"
alias dfp='cd ~/archdots/ && gg ~/archdots'
alias dzsh="vim ~/.zshrc"

# pdf viewing 
alias so="devour sioyek " 
alias sz="devour zathura "

# might switch to an easier setup with vimscript
# for my neovim config

alias back="cd .."

# for blog
alias sdfh="cd ~/Documents/website/blog"
alias comd="hugo server -D"
alias comx="hugo -t xmin"

# ssh into downstairs
alias lkj='ssh server@192.168.0.203'

# todo
# - add youtube profiles into mpv
alias mpv='devour mpv' 
alias gay="pridefetch -f bisexual"
alias vid='cd ~/Videos/ && lf'

# for syncthing
alias sdf='cd ~/Sync/'
alias tb="ls ~/Sync/academics/textbooks/ | fzf"

# pomodoro timer: requires tomoshell
alias qwer='tomatoshell -t 50 -d 10 -n 10'

# record desktop
# alias rec='ffmpeg -f x11grab -s 1920x1200 -i :0.0 -f pulse -i default -filter:a "volume=5.5" out.mkv'

# git shit
# alias dg="git clone https://github.com/tokisuno/dotfiles"
# alias config='/usr/bin/git --git-dir=/home/skinnyboot/pimeja --work-tree=/home/skinnyboot'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
PATH="/home/woopityscoop/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/woopityscoop/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/woopityscoop/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/woopityscoop/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/woopityscoop/perl5"; export PERL_MM_OPT;

#distraction-destroyer shortcut (https://github.com/matthew-webber/distraction-destroyer)
alias disd='sudo ~/.local/share/scripts/distraction-destroyer/distraction-destroyer.sh'
