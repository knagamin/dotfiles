#--------------------------------------------------
#--------------------------------------------------
# 
# .zshrc
# nagamee
#--------------------------------------------------
#--------------------------------------------------

PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#--------------------------------------------------
# Environment variable configuration
#
# LANG (local)
export LANG="en_US.UTF-8"

#--------------------------------------------------
# Default shell configuration
#
# set prompt
autoload colors
colors
setopt prompt_subst

case ${UID} in
0)
    local pbase="%{${fg[red]}%}%n@%m [%c]%%%{${reset_color}%} "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    RPROMPT="[%U%~%u]"
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
    ;;
*)
#    local pbase=$'%{\e[$[32+RANDOM%5]m%}%n@%m [%c]%{${fg[green]}%}%%%{${reset_color}%} '
    local pbase="%{${fg[green]}%}%n@%m [%c]%%%{${reset_color}%} "
    PROMPT="$pbase"
    PROMPT2="%{${fg[green]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[green]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    RPROMPT="[%U%~%u]"
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT=${PROMPT}
    ;;
esac

# set terminal title including current directory
case "${TERM}" in
kterm* | xterm | xterm-256color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

#--------------------------------------------------
# Completion configuragion
#
autoload -U compinit
compinit

#--------------------------------------------------
# Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history    # share command history data

#--------------------------------------------------
# Keybind configuration
#
# keybind
#bindkey -v # vi like keybind
bindkey -e # emacs like keybind

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

setopt auto_cd              # allows to cd only file/dir name
setopt auto_pushd           # show the cd cmd history by "cd -[TAB]"
setopt correct              # assumed to mistype, ask it's correct or not
setopt list_packed          # compacked complete list display
setopt nolistbeep           # no beep sound when complete list displayed
setopt noautoremoveslash    # no remove postfix slash of command line

#--------------------------------------------------
# Alias configuration
#
setopt complete_aliases # aliased 'ls' needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias du="du -h"
alias df="df -h"

alias su="su -l"

alias D="dirs -lpv"

alias sc="screen"

autoload zed

#--------------------------------------------------
# Load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

