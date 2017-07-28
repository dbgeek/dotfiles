#!/usr/bin/env BASH
cd "$(dirname "${BASH_SOURCE}")"


for rec in $(ls -1A | grep -v .git); do
  if [[ -f ~/"$rec" ]]; then
    if [[ -L ~/"$rec" ]]; then
      echo item: "$rec"
    else
      echo "file exists: ${rec}"
      mv ~/$rec ~/$rec_$(date +%Y%m%d%H%M%S)
      ln -s $(pwd)/${rec} ~/${rec}
    fi
  else
    echo "file not exists: ${rec}"
    ln -s $(pwd)/${rec} ~/${rec}
  fi
done
