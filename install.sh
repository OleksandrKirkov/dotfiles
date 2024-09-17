#!/bin/bash

sudo apt update
sudo apt-get update

sudo apt-get install -y build-essential

sudo apt install -y neovim python3-neovim git nodejs \
    npm curl zsh dotnet-sdk-8.0 aspnetcore-runtime-8.0 \
    dotnet-runtime-8.0 zlib1g

sudo snap install telegram-desktop spotify

git clone https://github.com/OleksandrKirkov/nvim.git ~/.config

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list
sudo cp prod.list /etc/apt/sources.list.d/mssql-release.list
