#!/bin/bash

# Activation des dépôts RPM Fusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf upgrade -y
sudo dnf install discord -y

# Installation de Brave
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

# Installation et désintallation des applications listées
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

# Installation de OnlyOffice
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm
sudo dnf install ./onlyoffice-desktopeditors.x86_64.rpm -y

# Installation de VirtualBox
wget https://download.virtualbox.org/virtualbox/7.0.22/VirtualBox-7.0-7.0.22_165102_fedora40-1.x86_64.rpm
sudo dnf install ./VirtualBox-7.0-7.0.22_165102_fedora40-1.x86_64.rpm -y

sudo dnf autoremove -y
sudo dnf clean --all
