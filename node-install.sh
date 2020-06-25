#!/bin/sh

# grep -m 1: only match the first
# grep -P: Perl regex
# grep -o: show only the parts that match
NVM_LATEST_VERSION=$(wget -qO- https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep -Po -m 1 '(v\d+\.\d+\.\d+)(?!name)')
echo "Downloading nvm ${NVM_LATEST_VERSION}"
wget -qO- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_LATEST_VERSION}/install.sh" | bash
