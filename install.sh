#!/bin/bash

function packages_base() {
    echo "enable aur for pamac"
    sudo sed -i "s/#EnableAUR/EnableAUR/g" /etc/pamac.conf


    yes | sudo pacman -Syu \
        i3-gaps \
        i3lock \
        thunar \
        lxappearance \
        rofi \
        git \
        go \
        zsh \
        i3status \
        autorandr \
        compton \
        polybar

    pamac install \
        google-chrome \
        tableplus \
        zoom \
        spotify \
        insomnia \
        teamviewer \
        visual-studio-code-bin
}

packages_base
