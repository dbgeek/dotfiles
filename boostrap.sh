#!/usr/bin/env BASH
cd "$(dirname "${BASH_SOURCE}")"


for dotfile in $(ls -1A | grep -v .git); do
  if [[ -f ~/"$dotfile" ]]; then
    if [[ -L ~/"$dotfile" ]]; then
      echo item: "$dotfile"
    else
      echo "file exists: ${dotfile}"
      mv ~/${dotfile} ~/${dotfile}_$(date +%Y%m%d%H%M%S)
      ln -s $(pwd)/${dotfile} ~/${dotfile}
    fi
  else
    echo "file not exists: ${rec}"
    ln -s $(pwd)/${rec} ~/${rec}
  fi
done

