if status is-interactive
    alias make50='make CC=clang CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow" LDLIBS="-lcrypt -lcs50 -lm"'

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

    alias course='cd ~/Sync/mac/41 && lA'
    alias bits='vim ~/Sync/wiki/habits.md'
    alias leer='cd ~/Sync/read/'
    
    # vim shit
    alias vim='nvim'
    alias vi='/bin/vim'
    alias rip='cd ~/.local/share/scripts' 
    alias sfh='cd ~/.config/fish && fzfw'
    alias vmn='cd ~/.config/nvim/ && fzfw'
    alias snips="vim ~/.config/nvim/LuaSnip/tex.lua"

    #reading
    alias so="devour sioyek " 
    alias sz="devour zathura "
    alias genki="sz ~/Sync/read/zzz/langs/jp/genki2.pdf"
    
    # not working and idk why
    # alias thing='xmodmap -e "keycode 22 = backslash bar" && xmodmap -e "keycode 51 = BackSpace'
    # for blog 
    alias sdfh="cd ~/projects/repos/blog"
    alias comt="hugo server -D"
    alias compp="hugo --gc -t hugo-simplecss"
    alias compb="hugo --gc -t xmin"
    
    # for programming
    alias py='python'
    # alias code='cd ~/projects/repos'

    # tomatoshell
    alias goals='bat ~/Sync/wiki/todo.md'
    alias newgoal='vim ~/Sync/wiki/todo.md'
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
