if status is-interactive
    alias make50='make CC=clang CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow" LDLIBS="-lcrypt -lcs50 -lm"'

    # better ls command 
    alias lf='lfrun'
    alias ls='exa'
    alias l='exa -lbF --git'
    alias ll='exa -lbGF --git'
    alias llm='exa -lbGd --git --sort=modified'
    alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale' 
    alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'
    alias lS='exa -1'
    alias lt='exa --tree --level=2'
    alias lA='ls -a'
    
    # vim shit
    alias vim='nvim'
    alias vi='/bin/vim'
    alias rip='cd ~/.local/share/scripts' 
    alias sfh='cd ~/.config/fish && fzfw'
    alias vmn='cd ~/.config/nvim/ && fzfw'
    
    #reading
    alias so="devour sioyek " 
    alias sz="devour zathura "
    alias genki="sz ~/Sync/read/zzz/langs/jp/genki2.pdf"
    
    # for blog 
    alias sdfh="cd ~/projects/repos/blog"
    alias comt="hugo server -D"
    alias compp="hugo --gc -t hugo-simplecss"
    alias compb="hugo --gc -t xmin"
    
    # for programming
    alias py='python'
    alias code='cd ~/projects/repos'

    # tomatoshell
    alias goals='bat ~/Sync/wiki/todo.md'
    alias doro='tomatoshell -t 50 -d 10 -n 10 -f'
    
    # misc
    alias back="cd .."
    alias lkj='ssh server@192.168.0.203'
    alias mpv='devour mpv' 
    alias gay="pridefetch -f bisexual"
    alias vid='cd ~/Videos/ && lf'
    alias wiki='vim ~/Sync/wiki/index.md'
    alias weron='xrandr --auto && xrandr --output eDP1 --left-of DP2-2 && nitrogen --restore'
    alias weroff='xrandr --output eDP1 --off && nitrogen --restore' 
    alias ka='killall'
    alias syu='sudo pacman -Syu'

end
