if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi

apt-get -y update
apt-get -y upgrade

apt-get remove -y --purge apache* mysql* mariadb* php* dotnet*

apt-get install -y \
  automake \
  autoconf \
  gnupg gnupg-agent \
  apt-transport-https \
  ca-certificates \
  lsb-release \
  gettext \
  openssl \
  curl \
  tree \
  xclip \
  jq

# install git
$0 ./kali/git.sh

