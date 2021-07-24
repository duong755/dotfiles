#!/bin/bash

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"

unzip /tmp/awscliv2.zip -d /tmp

if [ -z "$(command -v aws)" ]; then
  sudo /tmp/aws/install -i /usr/share/aws-cli -b /usr/bin
else
  sudo /tmp/aws/install -i /usr/share/aws-cli -b /usr/bin --update
fi
