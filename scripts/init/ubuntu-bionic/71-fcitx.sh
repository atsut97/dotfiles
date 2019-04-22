#!/usr/bin/env bash

trap 'echo Error: $0:$LINENO; exit 1' ERR INT QUIT TERM
set -eu

THIS_DIR="${1}"
source "${THIS_DIR}/scripts/functions.sh"
source "${THIS_DIR}/scripts/init/ubuntu-bionic/apt-get-common.sh"

declare -a requested_packages=(
  'fcitx-mozc'
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

  info "Setting up fcitx-mozc..."
  mkdir -p ${HOME}/.config/autostart
  src="/usr/share/fcitx/xdg/autostart/fcitx-autostart.desktop"
  if [[ -f ${src} ]]; then
    cp ${src} ${HOME}/.config/autostart
  fi
fi

