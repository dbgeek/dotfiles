
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Golang stuff
export GO111MODULE=on

# Oracle stuff
export ORACLE_HOME=/Users/bjorn.ahl/Tools/instantclient_18_1
#export PKG_CONFIG_PATH=/Users/bjorn.ahl/Tools/pkgconfig
export LD_LIBRARY_PATH=$ORACLE_HOME

if [[ -f "${HOME}/.gpg-agent-info" ]]; then
    # on OS X with GPGTools, comment out the next line:
    eval "$(gpg-agent --daemon)"
    GPG_TTY=$(tty)
    export GPG_TTY
    . "${HOME}/.gpg-agent-info"
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi

if [[ -d "/usr/local/opt/coreutils" ]]; then
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

source /Users/bjorn.ahl/src/stash.int.klarna.net/tx/tranzaxis-orchestration/team-tools/helpers

alias pass-private='export PASSWORD_STORE_DIR=/Users/bjorn.ahl/src/github.com/dbgeek/pass'
alias pass-klarna='export PASSWORD_STORE_DIR=$HOME/.password-store-klarna'

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# get comitinit to work
autoload -Uz compinit

alias tmux='tmux -u'
