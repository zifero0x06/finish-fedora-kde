#!/bin/bash

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf upgrade -y

removeappfile=$1

while IFS= read -r app
do
  sudo dnf remove "$app" -y
done < "$removeappfile"

installappfile=$2

while IFS= read -r app
do
  sudo dnf install "$app" -y
done < "$installappfile"

wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm
sudo dnf install ./onlyoffice-desktopeditors.x86_64.rpm -y

sudo dnf autoremove -y
