#!/bin/bash

sudo apt update
sudo apt-get update

sudo apt-get install -y build-essential chrome-gnome-shell

sudo apt install -y neovim python3-neovim git nodejs \
    npm curl zsh dotnet-sdk-8.0 aspnetcore-runtime-8.0 \
    dotnet-runtime-8.0 zlib1g

sudo snap install telegram-desktop spotify
sudo snap install obsidian --classic

git clone https://github.com/OleksandrKirkov/nvim.git ~/.config

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
