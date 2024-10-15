#!/bin/bash

installappfile=$1

sudo dnf autoremove -y
sudo dnf update -y

while IFS= read -r app
do
  sudo dnf install "$app" -y
done < "$app_file"
