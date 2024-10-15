#!/bin/bash

sudo dnf autoremove -y
sudo dnf update -y

removeappfile=$1

while IFS= read -r app
do
  sudo dnf remove "$app" -y
done < "$app_file"

installappfile=$1

while IFS= read -r app
do
  sudo dnf install "$app" -y
done < "$app_file"
