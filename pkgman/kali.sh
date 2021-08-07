if [ $UID -ne "0" ]; then
  echo "Require root user"
  exit
fi


apt-get remove -y --purge apache* mysql* mariadb* libapache* php*

apt-get -y update
apt-get -y upgrade

apt-get -y dist-upgrade
apt-get remove -y dotnet* aspnetcore*

apt-get autoremove -y
apt-get autoclean -y

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
  jq \
  rsync

# install git
echo "\nInstalling git...\n"
CURRENT_FILE_PATH=$(realpath $0)
CURRENT_DIR_PATH=$(dirname "$CURRENT_FILE_PATH")

bash ./kali/git.sh

