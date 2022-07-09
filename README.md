# General Checklist

-   Download latest Fedora Silverblue and write to USB stick

-   Follow GUI installer, making space in partition tool if needed.

-   GUI apps: VS Code, Rider, Chromium, Spotify

-   CLI apps: nvim, gcc/make/etc, strace, lsof, patch, jq

-   Dev tools: nodejs, npm, yarn, cargo, dotnet, aws

-   Setup git (name, email)

-   Setup NVIM using nvim.appimage and restore VIM config dir from git

-   Install and configure VS Code with custom vim config

-   Install and configure Rider with custom vim config

# Install Silverblue Packages

Update all packages

    sudo rpm-ostree update

Install additional packages

    sudo rpm-ostree upgrade
    rpm-ostree install ccache chrpath diffstat docbook5-schemas docbook-dtds gcc-c++ java-1.8.0-openjdk libzip mesa-libGL-devel minicom openjade pandoc perl-bignum perl-Thread-Queue python2 python3-GitPython python3-jinja2 rpcgen rubygem-asciidoctor SDL-devel socat strace texinfo wireguard-tools xterm google-chrome

Finally reboot to use all new pacakges

    sudo systemctl reboot

# Set the hostname

    sudo hostnamectl set-hostname z13

# Enable sshd

    sudo systemctl enable sshd.service --now

# Download tarballs for VS Code and Rider

Extract the tarballs underneath ~/Toolchains

# Install Flatpaks for Chromium and Spotify

Run the 'bin/setup-flatpak-apps.sh' script

# Git Config (~/.gitconfig)

Example git config file:

    [user]
        email = christian.betz@gmail.com
        name = Christian Betz
    [init]
        defaultBranch = main

# Bashrc Customizations

All customizations are now stored in the bash/x.sh file

You also want git-prompt.sh which will give you a nice bash prompt.

Create a ~/.bashrc.d directory and copy both files there.

# Keyboard Shortcuts

-   Ctrl+Alt+T for new terminal

# Install dotnet

Download the latest dotnet and extract in $HOME/Toolchains. Configure
PATH accordingly in bashrc as shown above.

Prevent build related to openssl errors by modifying
/etc/ssl/openssl.cnf and commenting the line as shown here:

    #openssl_conf = openssl_init

# Install Node, Yarn

Download node and extract it in $HOME/Toolchains. Configure your PATH
accordingly as shown above.

Use the following commands to configure 'npm' to install "global"
packages into your home directory.

    mkdir "${HOME}/.npm-packages"
    npm config set prefix "${HOME}/.npm-packages"

# Setup Neovim

Download nvim.appimage and put it in $HOME/bin.

Install nvim configs:

    cd ~/.config
    git clone git@github.com:xtianbetz/.vim.git nvim --recurse-submodules

Inside nvim you will need to install interesting things:

    :CocInstall coc-tsserver coc-json coc-html coc-css coc-phpls coc-omnisharp

# Install/Setup JetBrains Rider

Extract Rider tar.gz under ~/Toolchains

Install the vim extension.

Use ~/.ideavimrc for setup (see the ideavimrc in my vimrc repo)

Install a Desktop shortcut from the 'Tools' menu.

# Install/Setup VS Code

Download VS Code to ~/Toolchains/VSCode-linux-x64

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

Launch 'Code' from GNOME launcher and immediately install the Vim and C#
extensions.

TODO: link to settings.json for VIM vscode

# Install AWS CLI

Use 'bin/install-aws-cli.sh'

# Disable Intel Wifi Powersaving

create /etc/modprobe.d/iwlwifi.conf with following contents:

    options iwlwifi beacon_timeout=128

# Rust with ARM Target Support

Install rust stable

    rustup install stable

Install the target needed to build for 32-bit ARM Linux:

    rustup target add armv7-unknown-linux-gnueabihf

Modify ~/.cargo/config so linker works (note: this assumes you the right
binary in ~/Toolchains and in your PATH).

    [target.armv7-unknown-linux-gnueabihf]
    linker = "arm-none-linux-gnueabihf-gcc"

# Add user to dialout group to allow use of serial ports

    sudo su
    grep -E '^dialout:' /usr/lib/group >> /etc/group
    usermod -aG dialout x

# Toolbox Notes

The toolbox is a container you can use for install random stuff without
using rpm-ostree and rebooting.

The following command will allow making this document within toolbox:

    toolbox enter
    sudo dnf install fuse fuse-libs rubygem-asciidoctor make pandoc
