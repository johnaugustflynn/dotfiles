# Open common URLs
[[ $(uname -s) == 'Linux' ]] && alias open='xdg-open'
alias gh='open https://www.github.com'
alias yt='open https://www.youtube.com'
alias reddit='open https://www.reddit.com'

# Python
alias pip='python -m pip'
alias profile='python -m cProfile'

# git
alias g='git'
alias gc='git commit'
alias gcam='git commit -am'
alias gp='git push'
alias gs='git status'
alias gl='git log --oneline --graph --decorate'
alias gn='git number --column'
alias ga='git number add'

# Navigation
alias ll='ls -lhFG'
alias la='ls -lhFGa'
alias dotfiles='cd ~/Code/johnaugustflynn/dotfiles'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Misc
alias grep='grep --color=auto'
alias nv='nvim'
alias nvc='nvim ~/.config/nvim/'

