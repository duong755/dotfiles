#!/usr/bin/env sh

# grep -m 1: only match the first
# grep -P: Perl regex
# grep -o: show only the parts that match
NVM_LASTEST_VERSION=$(wget -qO- https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep -Po -m 1 '(v\d+\.\d+\.\d+)(?!name)')
wget -qO- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_LATEST_VERSION}/install.sh" | bash

nvm install --lts
nvm use --lts

npm i -g typescript
npm i -g tslint
npm i -g now
npm i -g neovim
npm i -g create-react-app
npm i -g create-next-app
npm i -g @angular/cli
npm i -g neovim
