#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt-get update

sudo apt-get install -y build-essential chrome-gnome-shell

sudo apt install -y neovim python3-neovim git nodejs \
    npm curl zsh dotnet-sdk-8.0 aspnetcore-runtime-8.0 \
    dotnet-runtime-8.0 zlib1g

sudo apt-get install -y meson wget build-essential ninja-build cmake-extras \
    cmake gettext gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev \
    libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev libpixman-1 \
    -dev libudev-dev libseat-dev seatd libxcb-dri3-dev libvulkan-dev libvulkan-volk-dev \
    vulkan-validationlayers-dev libvkfft-dev libgulkan-dev libegl-dev libgles2 libegl1-mesa-dev \
    glslang-tools libinput-bin libinput- dev libxcb-composite0-dev libavutil-dev \
    libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev \
    libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev \
    xdg-desktop-portal-wlr hwdata-dev

sudo apt install -y meson ninja-build

sudo snap install telegram-desktop spotify
sudo snap install obsidian --classic

git clone https://github.com/OleksandrKirkov/nvim.git ~/.config

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mkdir -p ~/HyprSource

cd ~/HyprSource

wget -P ~/HyprSource https://github.com/hyprwm/Hyprland/releases/download/v0.24.1/source-v0.24.1.tar.gz
tar -xvf wayland-v0.24.1.tar.gz

wget -P ~/HyprSource https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.31/downloads/wayland-protocols-1.31.tar.xz
tar -xvJf wayland-protocols-1.31.tar.xz

wget -P ~/HyprSource https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz
tar -xvf wayland-1.22.0.tar.xz --xz -C ~/HyprSource

wget -P ~/HyprSource https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.1.1/downloads/libdisplay-info-0.1.1.tar.xz
tar -xvJf libdisplay-info-0.1.1.tar.xz

cd ~/HyprSource/wayland-1.22.0
mkdir -p build &&
cd    ./build &&

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -Ddocumentation=false &&
ninja
sudo ninja install

cd ../..

cd ~/HyprSource/wayland-protocols-1.31

mkdir -p build &&
cd    ./build &&

meson setup --prefix=/usr --buildtype=release &&
ninja

sudo ninja install

cd ../..

cd ~/HyprSource/libdisplay-info-0.1.1/

mkdir -p build &&
cd    ./build &&

meson setup --prefix=/usr --buildtype=release &&
ninja

sudo ninja install

cd ../..

chmod a+rw hyprland-source

cd ./hyprland-source/

sed -i 's/\/usr\/local/\/usr/g' config.mk

sudo make install
