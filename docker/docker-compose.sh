#!/bin/bash

API_ENDPOINT_LIST_RELEASES=https://api.github.com/repos/docker/compose/releases

function all_versions() {
  curl -s "$API_ENDPOINT_LIST_RELEASES" | jq '.[] | { tag_name: .tag_name } | .tag_name'
}

function latest_version() {
  if [ $UID -ne "0" ]; then
    echo "Require root user"
    exit
  fi

  ARCH=$(uname -m)
  RELEASE_NAME="docker-compose-linux-$ARCH"
  DOWNLOAD_URL=$(wget -qO- "$API_ENDPOINT_LIST_RELEASES" | jq -r --arg NAME "$RELEASE_NAME" '.[0] | { asset: .assets[] | select(.name==$NAME) } | .asset.browser_download_url')
  OUTPUT="/usr/libexec/docker/cli-plugins/$RELEASE_NAME"

  wget "$DOWNLOAD_URL" -O "$OUTPUT"
  chmod +x "$OUTPUT"
  ln -sf "$OUTPUT" /usr/bin/docker-compose
}

function main() {
  case "$1" in
    all)
      all_versions
      ;;
    latest)
      latest_version
      ;;
  esac
}

main "$1"
