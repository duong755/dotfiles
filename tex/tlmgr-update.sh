#/bin/sh

# run this at /root
wget http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh
chmod +x update-tlmgr-latest.sh
sudo env PATH="${PATH}" ./update-tlmgr-latest.sh
