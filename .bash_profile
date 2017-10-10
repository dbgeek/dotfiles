# inspired by and borrowed from: https://github.com/keeganlow/dotfiles
# source ~/.bashrc

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

export GOPATH=${HOME}

color_prompt=yes
if ! [ -x /usr/bin/tput ] || ! tput setaf 1 >&/dev/null; then
   # We have no color support; not compliant with Ecma-48
   # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
   # a case would tend to support setf rather than setaf.)
   color_prompt=
fi

export TERM='screen-256color'

if [[ -f "${HOME}/.gpg-agent-info" ]]; then
    # on OS X with GPGTools, comment out the next line:
    eval $(gpg-agent --daemon)
    GPG_TTY=$(tty)
    export GPG_TTY
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi

# source dotfiles in .dotfiles
if [[ -f ~/.dotfiles ]]; then
  echo "file exists"
  while read dotfile; do
    if [[ -f ~/"${dotfile}" ]]; then
      source ~/"${dotfile}"
    fi
  done <~/.dotfiles
fi

# Add Tab-completion for SSH host aliases
if [[ -f ~/.ssh/config ]]; then
  complete -o default -o nospace -W "$(grep -i "^host " $HOME/.ssh/*config |grep -v "^Host \*" | awk '{print $2}')" scp sftp ssh
fi

# Autocomplete for awscli
complete -C 'docker run -e COMP_LINE -e COMP_POINT -e COMMAND_LINE --rm --entrypoint /usr/bin/aws_completer txapps/awscli' awscli


# Define alias
alias tc="tmux new -s $1"
alias ta="tmux attach -d -t $1"

if [[ -d "/usr/local/opt/coreutils" ]]; then
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

