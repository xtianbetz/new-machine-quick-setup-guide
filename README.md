Checklist
=========

-   Programs; strace, lsof, patch, jq

-   Install latest nodejs, npm, yarn.

-   Setup git (name, email)

-   Setup NVIM using nvim.appimage and restore VIM config dir from git

-   Install VS Code

-   Install rust toolset

Git Config (~/.gitconfig)
=========================

    [user]
        email = christian.betz@gmail.com
        name = Christian Betz
    [init]
        defaultBranch = main

Bashrc Customizations
=====================

Eventually load all customizations from ~/.bash (a git repo)

    alias e='$HOME/bin/nvim.appimage'
    alias vi='$HOME/bin/nvim.appimage'

    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

    alias yaml2json="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))'"

    source ~/.bash/git-prompt.sh # Show git branch name at command prompt
    export GIT_PS1_SHOWCOLORHINTS=true # Option for git-prompt.sh to show branch name in color
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    export GIT_PS1_SHOWUPSTREAM=true

    PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

    # Allow users to run "npm install -g ..." without sudo
    # See: https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
    #  will also need:
    #  mkdir "${HOME}/.npm-packages"
    #  npm config set prefix "${HOME}/.npm-packages"
    NPM_PACKAGES="${HOME}/.npm-packages"

    export PATH="$PATH:$NPM_PACKAGES/bin"

    # Preserve MANPATH if you already defined it somewhere in your config.
    # Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
    export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

    # Various toolchains
    export PATH="$HOME/Toolchains/VSCode-linux-x64/bin:$HOME/Toolchains/dotnet-core-3.1:$HOME/Toolchains/gcc-arm-none-eabi-9-2020-q2-update/bin:$HOME/Toolchains/node-v14.15.4-linux-x64/bin:$PATH"

    # Python setuptools (i.e. for using "python setup.py install --user")
    export PATH="${HOME}/.local/bin:$PATH"

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
