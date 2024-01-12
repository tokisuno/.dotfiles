if status is-interactive
    alias make50='make CC=clang CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow" LDLIBS="-lcrypt -lcs50 -lm"'
  
    function zkn --wraps zk --description "for making notes fast"
      zk new --title "$argv"
    end
    function tab --wraps zathura --description "to tab pdfs"
        devour tabbed -c zathura {$argv} -e
    end

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

    #reading
    alias so="devour sioyek " 
    alias sz="devour zathura "
    
    # for blog 
    alias sdfh="cd ~/projects/repos/blog"
    alias comt="hugo server -D"
    alias compp="hugo --gc -t hugo-simplecss"
    alias compb="hugo --gc -t xmin"
    
    # for programming
    alias py='python'
    # alias code='cd ~/projects/repos'

    # misc
    alias back="cd .."
    alias lkj='ssh server@192.168.0.203'
    alias mpv='devour mpv' 
    alias gay="pridefetch -f bisexual"
    alias ka='killall'
    alias syu='sudo pacman -Syu'

end
