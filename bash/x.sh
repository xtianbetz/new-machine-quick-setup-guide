alias e='$HOME/bin/nvim.appimage'
alias vi='$HOME/bin/nvim.appimage'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias yaml2json="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))'"

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

export PATH="$HOME/Toolchains/JetBrains Rider-2020.3.4/bin:$PATH"

export PATH="$HOME/Toolchains/gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf/bin:$PATH"

export ANDROID_SDK_ROOT="$HOME/Toolchains/android-sdk"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/tools/bin:$PATH"

export PATH="$HOME/Toolchains/watchman-v2021.05.24.00-linux/bin:$PATH"

export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

#export PATH="$HOME/Toolchains/node-v16.3.0-linux-x64/bin:$PATH"
export PATH="$HOME/Toolchains/node-v14.18.1-linux-x64/bin:$PATH"

export ATTENDANT_IP=192.168.3.51
. "$HOME/.cargo/env"

