#!/usr/bin/bash

CURRENT_FILE_PATH=$(realpath $0)
CURRENT_DIR_PATH=$(dirname "$CURRENT_FILE_PATH")

VERSION=$(node $CURRENT_DIR_PATH/cli.js ls --version-type latest)

wget https://go.dev/dl/$VERSION.linux-amd64.tar.gz --directory-prefix /tmp/go
