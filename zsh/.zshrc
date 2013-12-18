PROMPT='%m:%~%% '
RPROMPT='%@%(0?,, %?)'
export CVS_RSH=ssh
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
export MHN=/home/tlau/Mail/mhn.defaults
export CDPATH=.:/home/tlau
# Less options
export LESS=-erMMj3
export LESSKEY=/home/tlau/.less
#export TZ=US/Pacific
export TZ=America/Buenos_Aires
export MAIL=/home/tlau/Maildir/

# Filename completion
export FIGNORE=aux

# print to molly's printer
export PRINTER=molly

bindkey -v
bindkey -a K history-beginning-search-backward
bindkey -a J history-beginning-search-forward
bindkey -a '^U' kill-whole-line
bindkey '[A' up-history
bindkey '[B' down-history
bindkey  up-history
bindkey  down-history
#stty erase '^H'

# Aliases
alias f=finger
if [ "x$TERM" != "xtgtelnet" ]; then
	alias ls='ls -FG'
fi
alias ll='ls -l'
alias wh='ps auxw | grep'
alias m=make
alias library='telnet -l leo nyplgate.nypl.org'
alias history='fc -dl'
alias kl='tail -30 ~/.gale/log/privlog'
alias kll='less ~/.gale/log/privlog'

alias doman='nroff -man'

alias bc='bc /Users/tlau/.bcrc'

autoload -U compinit && compinit
setopt EXTENDED_GLOB

# global history
# Append command to history just before it is executed, not when the shell exits
setopt inc_append_history
# retrieve history file each time history is requested
setopt share_history


# Obsolete stuff
#export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib:/uns/lib:/scratch/tlau/mysql/lib/mysql:/scratch/tlau/lib
#export STAR_SPOOL_DIR=/scratch/tlau/tmp

#uname=`uname`
#export PATH=/scratch/tlau/bin:~/bin:~/bin/$uname:/uns/gcc/bin:/uns/bin:/usr/ucb:/bin:/usr/sbin:/usr/local/bin:/usr/bin:/usr/local/mh/bin:/usr/local/bin/mh:/usr/bin/X11:/uns/share/bin:/etc:/usr/etc:/usr/local/etc:/uns/trial/bin:/usr/athena/bin:/usr/local/jdk1.2/bin:.

# For LaTeX
#export TEXFONTS=:/uns/share/lib/texmf/fonts

#alias uwlib='telnet uwin.u.washington.edu 1218'
#alias smbc='smbclient \\\\rfilesrv2\\students -U tlau -W cseresearch'
#hgrep() { grep "$@" /cse/lab/labdata/host-rec }

# For spamprobe
#export LD_LIBRARY_PATH=/home/egnor/.toast/armed/lib
#export PATH=${PATH}:/home/egnor/.toast/armed/bin

#export PYTHONPATH=${HOME}/lib/python2.3/site-packages

xtermtitle() {
	echo -n "\e]0;$*\007"
}

alias ts='ssh ofb.net'

# for github
source ~/.zsh/git-prompt/zshrc.sh
PROMPT='%m:%~$(git_super_status)%% '

# Add my bin directory to the PATH
# Add nethack
# Also add homebrew directories
typeset -U path
path=(~/bin /usr/local/bin /usr/games/bin /usr/local/share/python /Users/tlau/apps/mongodb-osx-x86_64-2.5.3/bin $path)
export PATH

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:${PYTHONPATH}

# Which robot to run in simulation
#export ROBOT_TYPE=janky1
export ROBOT_TYPE=mike

