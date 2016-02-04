
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=bullet-train
plugins=(git ruby wd)
source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

fpath=(/usr/share/zsh/4.3.11/functions $fpath)
fpath=(~/.myzsh $fpath)

autoload -U promptinit
promptinit

# VCS Load 
# autoload -Uz vcs_info
# setopt PROMPT_SUBST
# prompt jarvis

alias ls="ls -GF"
alias ll="ls -Glha"
alias cd..="cd .."
alias grep="grep -G"
alias gst="git status"
alias gco="git checkout"
alias gbr="git branch"

#Suffix aliases
alias -s py=vim
alias -s js=vim
alias -s php=vim
alias -s log="tail -f"


HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
unsetopt nomatch
bindkey -e

export EDITOR='vim'
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

# End of lines configured by zsh-newuser-install
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source ~/.bin/tmuxinator.zsh
