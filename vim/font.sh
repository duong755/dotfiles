#!/bin/bash

if [ $UID != "0" ]; then
  echo "Require root user"
  exit
fi

LATEST_RELEASE="https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"

UBUNTU_NERD_FONT_DOWNLOAD_URL=$(curl -sL "$LATEST_RELEASE" | jq -c '.assets[] | select(.name | contains("Ubuntu.zip")) | .browser_download_url' | grep -Po "https:\/\/.+(?=\"$)")

URLS=("$UBUNTU_NERD_FONT_DOWNLOAD_URL")

for url in "${URLS[@]}"; do
  if [ "$url" != "" ]; then
    file_name=$(basename "$url")
    font_family=$(echo "$url" | grep --perl-regexp --only-matching "([^\/]+)(?=\.zip$)")
    rm -f /tmp/"$file_name"
    wget -qO /tmp/"$file_name" "$url"
    cd /tmp || exit
    unzip -o -qq "$file_name" -d /tmp/"$font_family"
    cp -r /tmp/"$font_family"/* /usr/share/fonts/
    fc-cache -f -v
  else
    echo "Download url is empty"
    exit
  fi
done
