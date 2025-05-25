# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

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

# pnpm
export PNPM_HOME="/home/tmalik/.local/share"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# begin command prompt on new line
new_line=$'\n'

if [[ $PS1 != *"$new_line"* ]]; then
    PS1="${PS1}${new_line}"
fi


export PATH="$PATH:/home/tmalik/.nvm/versions/node/v20.12.2/bin/npm"
export PATH="$PATH:/home/tmalik/.local/share/pnpm"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH=$PATH:/usr/lib/go-1.22/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
