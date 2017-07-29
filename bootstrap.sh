#!/usr/bin/env BASH
cd "$(dirname "${BASH_SOURCE}")"


for dotfile in $(ls -1A | egrep -v ".git|bootstrap.sh"); do
  if [[ -f ~/"$dotfile" ]]; then
    if [[ ! -L ~/"$dotfile" ]]; then
      mv ~/${dotfile} ~/${dotfile}_$(date +%Y%m%d%H%M%S)
      ln -s $(pwd)/${dotfile} ~/${dotfile}
    fi
  else
    echo "file not exists: ${dotfile}"
    ln -s $(pwd)/${dotfile} ~/${dotfile}
  fi
done

