#!/bin/bash

sudo apt update
sudo apt-get update

sudo apt-get install build-essential

sudo apt install neovim python3-neovim git nodejs \
    npm

sudo snap install telegram-desktop spotify

git clone https://github.com/OleksandrKirkov/nvim.git ~/.config
