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

export PATH
export DOTNET_ROOT=$HOME/.dotnet

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
