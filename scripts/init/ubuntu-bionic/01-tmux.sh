#!/usr/bin/env bash

trap 'echo Error: $0:$LINENO; exit 1' ERR INT QUIT TERM
set -eu

THIS_DIR="${1}"
source "${THIS_DIR}/scripts/functions.sh"
source "${THIS_DIR}/scripts/init/ubuntu-bionic/apt-get-common.sh"

declare -a requested_packages=(
  'tmux'
  'xclip'
  'xsel'
)

## to get sorted list, uncomment below and execute
# IFS=$'\n'
# sorted=($(sort <<<"${requested_packages[*]}"))
# printf "  '%s'\n" "${sorted[@]}"
# echo "num: ${#sorted[@]}"
# exit

find_missing_packages
if [[ "${#missing_packages[@]}" > 0 ]]; then
  info "Installing missing packages..."
  sudo apt install -y "${missing_packages[@]}"
  [[ $? ]] && ok
fi

git_clone_or_update https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
