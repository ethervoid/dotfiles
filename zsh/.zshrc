
autoload -Uz compinit
compinit

fpath=(/usr/share/zsh/4.3.11/functions $fpath)
fpath=(~/.myzsh $fpath)

autoload -U promptinit
promptinit

# VCS Load 
autoload -Uz vcs_info
setopt PROMPT_SUBST
prompt jarvis

#Command Alias
alias ls="ls -GF"
alias ll="ls -Glh"
alias cd..="cd .."
alias grep="grep -G"
alias gst="git status"
alias ssh_gator="ssh dende@216.172.164.52 -p 2222"
alias nginx="sudo nginx -c $HOME/development/nginx/nginx_local.conf"
alias scala="sbt console"
alias android_build="mvn clean install android:deploy android:run"
alias android_run="mvn android:deploy android:run"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
unsetopt nomatch
bindkey -e

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$MAVEN_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# End of lines configured by zsh-newuser-install
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Colorize Maven Output
# Colors reference: http://en.wikipedia.org/wiki/ANSI_escape_code
color_maven() {
  $MAVEN_HOME/bin/mvn $* | sed \
    -e 's/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/[32;1mTests run: \1[0m, Failures: [31;1m\2[0m, Errors: [33;1m\3[0m, Skipped: [34;1m\4[0m/g' \
    -e 's/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\),/[32;1mTests run: \1[0m, Failures: [31;1m\2[0m, Errors: [33;1m\3[0m/g' \
    -e 's/\(\[INFO\] \-[-]*$\)/[36;1m\1[0m/g' \
    -e 's/\(\[INFO\] Building.*\)/[36;1m\1[0m/g' \
    -e 's/([INFO] BUILD FAILURE*)/[31;1m1[0m/g' \
    -e 's/\(.*WARN.*\)/[33;1m\1[0m/g' \
    -e 's/\(.*ERROR.*\)/[31;1m\1[0m/g' \
    -e 's/\(Downloaded:.*\)/[32;1m\1[0m/g'
}
alias mvn=color_maven
alias maven=$MAVEN_HOME/bin/mvn
