if status is-interactive
    alias make50='make CC=clang CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow" LDLIBS="-lcrypt -lcs50 -lm"'
    
    # alias node='unalias node; unalias npm; nvm use default ; node $argv'
    # alias npm='unalias node; unalias npm ; nvm use default ; npm $argv'

    alias lf='lfrun'

    alias ls='exa'
    alias l='exa -lbF --git'
    alias ll='exa -lbGF --git'
    alias llm='exa -lbGd --git --sort=modified'
    alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale' 
    alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'
    alias lS='exa -1'
    alias lt='exa --tree --level=2'
    
    alias vim='nvim'
    alias dzsh="vim ~/.zshrc"
    alias rip='cd ~/.local/share/scripts' 
    alias sfh='cd ~/.config/fish && fzfw'
    alias vmn='cd ~/.config/nvim/ && fzfw'
    
    #reading
    alias so="devour sioyek " 
    alias sz="devour zathura "
    
    # for blog 
    alias sdfh="cd ~/projects/repos/blog"
    alias comd="hugo server -D"
    alias comx="hugo -t xmin"
    
    # for programming
    alias py='python'
    alias code='cd ~/projects/repos'
    
    # misc
    alias back="cd .."
    alias lkj='ssh server@192.168.0.203'
    alias mpv='devour mpv' 
    alias gay="pridefetch -f bisexual"
    alias vid='cd ~/Videos/ && lf'
    alias qwer='tomatoshell -t 50 -d 10 -n 10' # requires tomatoshell
end
