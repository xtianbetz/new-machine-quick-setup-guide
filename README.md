Checklist
=========

-   Programs; strace, lsof, patch, jq

-   Install latest nodejs, npm, yarn.

-   Setup git (name, email)

-   Setup NVIM using nvim.appimage and restore VIM config dir from git

-   Install rust toolset

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
    export PATH="$HOME/Toolchains/VSCode-linux-x64/bin:$HOME/Toolchains/dotnet-core-3.1:$HOME/Toolchains/gcc-arm-none-eabi-9-2020-q2-update/bin:$PATH"

    # Python setuptools (i.e. for using "python setup.py install --user")
    export PATH="${HOME}/.local/bin:$PATH"

Keyboard Shortcuts
==================

-   Ctrl-T for new terminal
