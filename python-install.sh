#!/bin/bash

if [ $UID = "0" ]; then
  echo "You should not run pip as root, it might break system packages"
  exit
fi

python3 -m pip install -U pip
python3 -m pip install -U pylint
python3 -m pip install -U pynvim
python3 -m pip install -U msgpack
python3 -m pip install -U pygments # TeX for minted package
python3 -m pip install -U docker
python3 -m pip install -U python-language-server
