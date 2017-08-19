#!/usr/bin/env bash

IGNORE=(".git" ".gitignore" "bootstrap")

cd "$(dirname "${BASH_SOURCE}")"

for dotfile in $(ls -1A); do
  if [[ -f ~/"$dotfile" ]] && [[ ! " ${IGNORE[@]} " =~ "$dotfile" ]]; then
    if [[ ! -L ~/"$dotfile" ]]; then
      mv ~/${dotfile} ~/${dotfile}_$(date +%Y%m%d%H%M%S)
      ln -s $(pwd)/${dotfile} ~/${dotfile}
    fi
  else
    echo "file not exists: ${dotfile}"
    ln -s $(pwd)/${dotfile} ~/${dotfile}
  fi
done

