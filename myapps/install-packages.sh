#!/bin/sh
sudo apt update
sudo apt -y install \
    software-properties-common \
    build-essential \
    git tig \
    clang lldb cmake \
    curl wget nmap tcpdump iperf \
    autossh sshfs \
    fcitx-mozc \
    zazu \
    simplescreenrecorder \
    # python3-venv \
    # hyperspec \
    # ansible sshpass \
    # qemu-kvm libvirt0 virt-manager \
    # blueman pulseaudio-module-bluetooth bluez bluetooth bluez-firmware
sudo apt -y full-upgrade

if test 0; then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome*.deb
  sudo apt --fix-broken install
  rm google-chrome*.deb
fi

sudo sh -c "echo 'blacklist pcspkr' > pcspkr-blacklist.conf"
