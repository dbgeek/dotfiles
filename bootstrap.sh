#!/usr/bin/env bash
shopt -s nullglob dotglob
IGNORE=(".git" ".gitignore" "bootstrap.sh" "gnupg")
PLATFORM=$(uname)

cd "$(dirname "${BASH_SOURCE[@]}")" || exit

array_contains () {
  local seeking=$1; shift
  local in=1
  for element; do
    if [[ $element == "$seeking" ]]; then
      in=0
      break
    fi
  done
  return $in
}

main () {
  for dotfile in *; do
    if [[ -f ~/"$dotfile" ]] && ! array_contains "$dotfile" "${IGNORE[@]}"; then
      if [[ ! -L ~/"$dotfile" ]]; then
        mv ~"/${dotfile}" ~"/${dotfile}_$(date +%Y%m%d%H%M%S)"
        ln -s "$(pwd)/${dotfile}" ~"/${dotfile}"
        echo "backup files"
      fi
    elif ! array_contains "$dotfile" "${IGNORE[@]}"; then
      echo "file not exists: ${dotfile}"
      ln -s "$(pwd)/${dotfile}" "$HOME/${dotfile}"
    fi
  done


  if [[ "$PLATFORM"  == "Darwin" ]]; then
    if [[ ! -d ~/".gnupg" ]]; then
      mkdir ~/".gnupg"
    fi
    for file in gnupg/osx/*; do
      FILENAME=$(basename "$file")
      if [[ -f ~/".gnupg/$FILENAME" ]]; then
        if [[ ! -L ~/".gnupg/$FILENAME" ]]; then
          mv "$HOME/.gnupg/${FILENAME}" "$HOME/.gnupg/${FILENAME}_$(date +%Y%m%d%H%M%S)"
          ln -s "$(pwd)/${file}" "$HOME/.gnupg/${FILENAME}"
        fi
      else
          ln -s "$(pwd)/${file}" "$HOME/.gnupg/${FILENAME}"
      fi
    done
  fi
}

main
