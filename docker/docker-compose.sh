#!/bin/bash

API_ENDPOINT_LIST_RELEASES=https://api.github.com/repos/docker/compose/releases
CLI_PLUGINS_DIR=/usr/libexec/docker/cli-plugins
GLOBAL_BINARY=/usr/bin/docker-compose

function all_versions() {
  curl -s "$API_ENDPOINT_LIST_RELEASES" | jq '.[] | { tag_name: .tag_name } | .tag_name'
}

function get_latest_version() {
  if [ $UID -ne "0" ]; then
    echo "Require root user"
    exit
  fi

  ARCH=$(uname -m)
  RELEASE_NAME="docker-compose-linux-$ARCH"
  DOWNLOAD_URL=$(wget -qO- "$API_ENDPOINT_LIST_RELEASES" | jq -r --arg NAME "$RELEASE_NAME" '.[0] | { asset: .assets[] | select(.name==$NAME) } | .asset.browser_download_url')
  OUTPUT="$CLI_PLUGINS_DIR/$RELEASE_NAME"

  wget "$DOWNLOAD_URL" -O "$OUTPUT"
  chmod +x "$OUTPUT"
  ln -sf "$OUTPUT" "$GLOBAL_BINARY"
}

function get_version() {
  if [ $UID -ne "0" ]; then
    echo "Require root user"
    exit
  fi

  ARCH=$(uname -m)
  RELEASE_NAME="docker-compose-linux-$ARCH"
  DOWNLOAD_URL=$(wget -qO- "$API_ENDPOINT_LIST_RELEASES" | jq -r --arg NAME "$1" '.[0] | { asset: .assets[] | select(.name==$NAME) } | .asset.browser_download_url')
  OUTPUT="$CLI_PLUGINS_DIR/$RELEASE_NAME"

  wget "$DOWNLOAD_URL" -O "$OUTPUT"
  chmod +x "$OUTPUT"
  ln -sf "$OUTPUT" "$GLOBAL_BINARY"
}

function main() {
  case "$1" in
    all)
      all_versions
      ;;
    latest)
      get_latest_version
      ;;
    specific)
      if [ ! -z "$2" ]; then
        get_version "$2"
      fi
      ;;
  esac
}

main "$1"
