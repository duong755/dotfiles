#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

API_ENDPOINT_LIST_RELEASES=https://api.github.com/repos/docker/compose/releases
ARCH=$(uname -m)
RELEASE_NAME="docker-compose-linux-$ARCH"
DOWNLOAD_URL=$(wget -qO- "$API_ENDPOINT_LIST_RELEASES" | jq -r --arg NAME "$RELEASE_NAME" '.[0] | { asset: .assets[] | select(.name==$NAME) } | .asset.browser_download_url')
OUTPUT="/usr/libexec/docker/cli-plugins/$RELEASE_NAME"

wget "$DOWNLOAD_URL" -O "$OUTPUT"
chmod +x "$OUTPUT"
ln -sf "$OUTPUT" /usr/bin/docker-compose

# curl -s "$API_ENDPOINT_LIST_RELEASES" | jq '.[] | select(.tag_name == "v2.10.0") | { id: .id, tag_name: .tag_name, asset: .assets[] | select(.name | contains("docker-compose-linux-x86")) }'
