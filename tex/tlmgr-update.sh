#!/bin/bash

if [ $UID != "0" ];then
  echo "Require root user"
  exit
fi

TEX_HOME=/usr/local/texlive/2021/bin/x86_64-linux

wget -O "$TEX_HOME"/update-tlmgr-latest.sh http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh
chmod +x "$TEX_HOME"/update-tlmgr-latest.sh
cd "$TEX_HOME"
sh ./update-tlmgr-latest.sh -- --upgrade
tlmgr update --all
