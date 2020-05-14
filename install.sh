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

    pamac install 
        google-chrome \
        tableplus \
        zoom \
        spotify \
        insomnia \
        teamviewer \
        visual-studio-code-bin
}

function macbook_sound() {
    echo "Install sound driver for macbook pro 14.1"
    uname -a

    sudo pacman -S wget make gcc linux-headers
    git clone https://github.com/leifliddy/snd_hda_macbookpro.git
    cd snd_hda_macbookpro/
    sudo ./install.cirrus.driver.sh
}


function macbook_hibernate() {
    echo "Configure Suspend & Hibernation for macbook pro 14.1"

    # github.com/Dunedan/mbp-2016-linux

        cat > hibernate.service << EOF
[Unit]
After=network-online.target

[Service]
User=root
ExecStart=/usr/bin/echo 0 > /sys/bus/pci/devices/0000\:01\:00.0/d3cold_allowed

[Install]
WantedBy=multi-user.target
EOF
        sudo mv hibernate.service /lib/systemd/system/hibernate.service
        sudo systemctl enable hibernate.service
        sudo systemctl start hibernate.service
}

function macbook_bluetooth() {
    echo "Install bluetooth driver for macbook pro 14.1"

    sudo pacman -S wget make gcc linux-headers
    git clone https://github.com/leifliddy/macbook12-bluetooth-driver.git
    cd macbook12-bluetooth-driver/
    sudo ./install.bluetooth.driver.sh
}

packages_base

read -p 'Do you need install sound/bluethooth drivers for macbook pro? (y/N) ' e_install_driver

reboot="false"

case "$e_install_driver" in
    y | Y | YES | yes)
        echo "start driver install"
        macbook_sound
        macbook_bluetooth
        macbook_hibernate
        reboot="true"
        ;;
    *)
        echo "no driver install"
        ;;
esac


if [[ $reboot -eq "true" ]]; then
    read -p 'Reboot is needed. Do you want reboot now? (y/N) ' e_reboot

    case "$e_install_driver" in
        y | Y | YES | yes)
            reboot
            ;;
        *)
            echo "no reboot"
            ;;
    esac
fi
