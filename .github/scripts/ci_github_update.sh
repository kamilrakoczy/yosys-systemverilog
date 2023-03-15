#!/bin/bash
set -e -u -o pipefail
shopt -s nullglob
shopt -s extglob


if [ $# -ne 3 ]; then
    echo "Wrong number of arguments"
    echo "  expected: $0 <path> <commit message> <remote ref>"
    exit 1
fi

git config --global user.name "github-actions[bot]"
git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"

if [ -n "$(git status "$1" --porcelain)" ]; then
  git add "$1"
  git commit -m "$2"
  git push --set-upstream origin "$3"
fi
