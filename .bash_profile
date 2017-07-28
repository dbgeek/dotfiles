# inspired by and borrowed from: https://github.com/keeganlow/dotfiles
# source ~/.bashrc

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-e8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

color_prompt=yes
if ! [ -x /usr/bin/tput ] || ! tput setaf 1 >&/dev/null; then
   # We have no color support; not compliant with Ecma-48
   # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
   # a case would tend to support setf rather than setaf.)
   color_prompt=
fi

export TERM='screen-256color'

# on OS X with GPGTools, comment out the next line:
eval $(gpg-agent --daemon)
GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi
