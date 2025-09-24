# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Custom
PATH="$HOME/.dotnet:$PATH"
PATH=$PATH:/usr/local/go/bin

export PATH
export DOTNET_ROOT=$HOME/.dotnet
export PATH="$PATH:/home/uionutleonas/.dotnet/tools"
export JAVA_HOME=/home/uionutleonas/.jdk
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# personal aliases
# docker
alias docker-boot-enable="sudo systemctl enable --now docker"
alias docker-boot-disable="sudo systemctl disable --now docker"
alias docker-start="sudo systemctl start docker.service docker.socket"
alias docker-stop="sudo systemctl stop docker.service docker.socket"

# nvim shortcut
alias n="nvim"

# utilities
alias hook="~/.dotfiles/utilities/hook.sh"

eval "$(starship init bash)"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
source <(ng completion script)
