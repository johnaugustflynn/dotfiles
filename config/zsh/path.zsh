# copy any path initialization code (e.g. conda) to this file

eval $(/opt/homebrew/bin/brew shellenv)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/johnflynn/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/johnflynn/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/johnflynn/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/johnflynn/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
