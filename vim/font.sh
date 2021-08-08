#!/bin/bash

if [ $UID != "0" ]; then
  echo "Require root user"
  exit
fi

UBUNTU_NERD_FONT_DOWNLOAD_URL=$(curl -sL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -c '.assets[] | select(.name | contains("Ubuntu.zip")) | .browser_download_url' | grep -Po "https:\/\/.+(?=\"$)")

if [ "${UBUNTU_NERD_FONT_DOWNLOAD_URL}" != "" ]; then
  rm -f /tmp/Ubuntu.zip
  wget -O /tmp/Ubuntu.zip "${UBUNTU_NERD_FONT_DOWNLOAD_URL}"
  cd /tmp || exit
  unzip -o -qq Ubuntu.zip -d /tmp/Ubuntu
  cp -r /tmp/Ubuntu/* /usr/share/fonts/
  fc-cache -f -v
else
  echo "Ubuntu nerd font download url is empty"
  exit
fi
