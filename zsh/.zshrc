PROMPT='%m:%~%% '
RPROMPT='%@%(0?,, %?)'
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
# Less options
export LESS=-erMMj3

bindkey -v
bindkey -a K history-beginning-search-backward
bindkey -a J history-beginning-search-forward
bindkey -a '^U' kill-whole-line
bindkey '[A' up-history
bindkey '[B' down-history
bindkey  up-history
bindkey  down-history

# Aliases
alias ls='ls --color -F'
alias ll='ls -l'
alias wh='ps auxw | grep'
alias m=make
alias go=gnome-open

autoload -U compinit && compinit
setopt EXTENDED_GLOB

# global history
# Append command to history just before it is executed, not when the shell exits
setopt INC_APPEND_HISTORY
# retrieve history file each time history is requested
setopt SHARE_HISTORY
# Set the file used to store history
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
export HISTSIZE=10000
setopt APPEND_HISTORY

# for github
source ~/.zsh/git-prompt/zshrc.sh
PROMPT='%m:%~$(git_super_status)%% '

# Add my bin directory to the PATH
# Also add homebrew directories
typeset -U path
path=(~/bin /usr/local/bin
	$path)
export PATH

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:${PYTHONPATH}

setopt interactivecomments

if [ -f /opt/ros/indigo/setup.zsh ]; then
	source /opt/ros/indigo/setup.zsh
fi
