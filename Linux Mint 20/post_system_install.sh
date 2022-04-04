#!/usr/bin/env sh
# shellcheck disable=SC3044

# todo
# create corresponding test
# environment for distro  LxMt Kub WLC
# if shelltest don't provide better view, then loop

# mkdir -p ~/Documents/Github
# cd ~/Documents/Github

# download from https://github.com/ahjun001/3.c.systems-install-n-maintain.git
# download from https://github.com/ahjun001/3.a.1-linux
# download from https://github.com/ahjun001/3.a.2-vscode

# install and run VPN

# create test_post_sys_ins-l_apps.sh as apps are installed
# group apps
# identify system
# install difficult first and create a backup

set -x

# using mintinstall
# first use TimeShift to backup system



# Vim
if ! command -v vim; then
    if ! ../vim/vim_pj_install.sh; then exit 1; fi
fi
## if ! vim; then exit 1; fi
if ! command -v nvim; then
    if ! ../vim/nvim_pj_install.sh; then exit 1; fi
fi
## if ! nvim; then exit 1; fi

# zsh and oh-my-zsh
if ! command -v zsh; then
    sudo apt install zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    chsh
fi

# Firefox
if ! command -v firefox; then exit 1; fi

# VSCode
if ! command -v code; then
    firefox https://code.visualstudio.com/Download
    # sign-in to install plugins
fi
## if ! code; then exit 1; fi

# shellSpec
cli_command=shellspec
if ! command -v "$cli_command"; then
    oldwd='pwd'
    cd /tmp/ || exit
    if ! wget -O- https://git.io/shellspec | sh; then exit 1; fi
    cd "$oldwd" || exit
fi
if ! shellspec -v; then exit 1; fi

# reset links for vim, nvim, zsh, VSCode, shellSpec
if ! sudo ./reset\ all\ links.sh; then exit 1; fi

# python
sudo apt install python3 python3-venv python3-pip

# brave
pushd /tmp || exit 1
sudo apt -y install curl software-properties-common apt-transport-https
curl https://brave-browser-apt-release.s3.brave.com/brave-core.asc | gpg --dearmor >brave-core.gpg
sudo install -o root -g root -m 644 brave-core.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
popd || exit 1

# Chrome
,google-chrome_update.sh
if ! google-chrome; then exit 1; fi

# anki
cli_command=anki
if ! command -v "$cli_command"; then sudo apt install "$cli_command"; fi
if ! "$cli_command"; then exit 1; fi

# thunderbird
cli_command=thunderbird
if ! command -v "$cli_command"; then sudo apt install "$cli_command"; fi
if ! "$cli_command"; then exit 1; fi

# system-monitor
if ! gnome-system-monitor; then exit 1; fi

# inkscape
if ! command -v inkscape; then
    add-apt-repository ppa:inkscape.dev/stable
    sudo apt update
    sudo apt install inkscape
fi
if ! inkscape; then exit 1; fi

# disk usage analyser
if ! baobab; then exit 1; fi

# libre-office
if ! libreoffice --writer; then exit 1; fi

# calculator
if ! gnome-calculator; then exit 1; fi

# VMWare player
if ! vmware-player; then
    ./install_vmware_player.sh
fi

# torrent downloader
if ! transmission-gtk; then exit 1; fi

# webapp manager
echo 'add https://cnrtl.fr/definition/'
echo 'https://www.google.com'
echo 'https://leconjugueur.lefigaro.fr'
echo 'https://trello.com/b/qlpLmRO5/1perso'
echo 'https://web.whatsapp.com/'
echo 'https://www.youtube.com/'
webapp-manager

# audacity
cli_command=audacity
if ! command -v "$cli_command"; then sudo apt install "$cli_command"; fi
if ! "$cli_command"; then exit 1; fi

# screen-shot
if ! gnome-screenshot --interactive; then exit 1; fi

set +x