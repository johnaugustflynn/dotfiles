import json
import os
import sys
import xonsh


###############################################################################
# aliases
###############################################################################

# python
aliases["pip"] = "python -m pip"

# git
aliases["g"] = "git"
aliases["gc"] = "git commit"
aliases["gcam"] = "git commit -am"
aliases["gp"] = "git push"
aliases["gs"] = "git status"
aliases["gl"] = "git log --oneline --graph --decorate"
aliases["gn"] = "git number --column"
aliases["ga"] = "git number add"
aliases["gupdate"] = "git checkout main && git pull && git checkout - && git rebase main"

# navigation
aliases["ll"] = "ls -lhFG"
aliases["la"] = "ls -lhFGa"
aliases["dotfiles"] = "cd ~/Code/johnaugustflynn/dotfiles"
aliases[".."] = "cd .."
aliases["..."] = "cd ../.."
aliases["...."] = "cd ../../.."
aliases["....."] = "cd ../../../.."

# misc
aliases["grep"] = "grep --color=auto"
aliases["nv"] = "nvim"
aliases["nvc"] = "nvim ~/.config/nvim/"

