#!/bin/bash

if [ $UID != "0" ];then
  echo "Require root user"
  exit
fi

wget -O /usr/local/texlive/2021/bin/x86_64-linux/update-tlmgr-latest.sh http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh
chmod +x /usr/local/texlive/2021/bin/x86_64-linux/update-tlmgr-latest.sh
env PATH="${PATH}" /usr/local/texlive/2021/bin/x86_64-linux/update-tlmgr-latest.sh
