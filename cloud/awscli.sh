#!/bin/bash

if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"

unzip /tmp/awscliv2.zip -d /tmp

if [ -z "$(command -v aws)" ]; then
  /tmp/aws/install -i /usr/share/aws-cli -b /usr/bin
else
  /tmp/aws/install -i /usr/share/aws-cli -b /usr/bin --update
fi
