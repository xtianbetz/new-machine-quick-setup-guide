General Checklist
=================

-   Apps: VS Code, Rider, Chromium, Spotify

-   CLI programs: nvim, gcc/make/etc, strace, lsof, patch, jq

-   Dev environments: Install latest nodejs, npm, yarn, cargo, etc.

-   Setup git (name, email)

-   Setup NVIM using nvim.appimage and restore VIM config dir from git

-   Install VS Code

Silverblue Packages
===================

Install additional packages

    sudo rpm-ostree install SDL-devel ccache chrpath diffstat docbook-dtds docbook5-schemas 'gcc-c++' jq libzip mesa-libGL-devel minicom openjade pandoc perl-Thread-Queue perl-bignum python3-GitPython python3-jinja2 rpcgen socat strace texinfo xterm rubygem-asciidoctor

Toolbox Notes
=============

The toolbox is a container you can use for install random stuff without
using rpm-ostree and rebooting.

The following command will allow making this document within toolbox:

    toolbox enter
    sudo dnf install fuse fuse-libs rubygem-asciidoctor make pandoc

Download tarballs for VS Code and Rider
=======================================

Extract the tarballs underneath ~/Toolchains

Install Flatpaks for Chromium and Spotify
=========================================

Add the flathub flatpak remote:

    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

Install chromium:

    flatpak install flathub org.chromium.Chromium

Install spotify:

    flatpak install flathub com.spotify.Client

Git Config (~/.gitconfig)
=========================

    [user]
        email = christian.betz@gmail.com
        name = Christian Betz
    [init]
        defaultBranch = main

Bashrc Customizations
=====================

All customizations are now stored in the bash/x.sh file

Create a ~/.bash directory and copy the files there.

The following lines should be added to bashrc:

    # Put all customizations into ~/.bash/x.sh
    source ~/.bash/x.sh

Keyboard Shortcuts
==================

-   Ctrl-T for new terminal

Install dotnet
==============

Download the latest dotnet and extract in $HOME/Toolchains. Configure
PATH accordingly in bashrc as shown above.

Install Node, Yarn
==================

Download node and extract it in $HOME/Toolchains. Configure your PATH
accordingly as shown above.

Use the following commands to configure 'npm' to install "global"
packages into your home directory.

    mkdir "${HOME}/.npm-packages"
    npm config set prefix "${HOME}/.npm-packages"

Setup Neovim
============

Download nvim.appimage and put it in $HOME/bin.

Install nvim configs stuff

    cd ~/.config
    git clone git@github.com:xtianbetz/.vim.git nvim --recurse-submodules

Inside nvim you will need to install interesting things:

    :CocInstall coc-tsserver coc-json coc-html coc-css coc-phpls coc-omnisharp

Install/Setup VS Code
=====================

-   Download VS Code to ~/Toolchains/VSCode-linux-x64

Add desktop entry ~/.local/share/applications/vscode.desktop:

    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Visual Studio Code
    Icon=/var/home/x/Toolchains/VSCode-linux-x64/resources/app/resources/linux/code.png
    Exec=/var/home/x/Toolchains/VSCode-linux-x64/bin/code
    Comment=A cross-platform IDE for Everything
    Categories=Development;IDE;
    Terminal=false
    StartupNotify=true

Install AWS CLI
===============

    cd ~/Downloads/
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    cd aws/
    ./install -i $HOME/Toolchains/aws-cli -b $HOME/bin
    aws --version
