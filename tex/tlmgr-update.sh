#!/bin/bash

wget -O /root/update-tlmgr-latest.sh http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh
chmod +x /root/update-tlmgr-latest.sh
sudo env PATH="${PATH}" /root/update-tlmgr-latest.sh
