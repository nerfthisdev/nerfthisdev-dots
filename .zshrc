
# Modular config load
zmodload zsh/zprof

## INIT

## Exports
export EDITOR=nvim
export ZSH="$HOME/.oh-my-zsh"
export BUN_INSTALL="$HOME/.bun"


# PATH
export PATH=$PATH:/home/nerfthisdev/.spicetify
export PATH=~/.local/bin:$PATH
export PATH=$PATH:$HOME/go/bin
export PATH="$BUN_INSTALL/bin:$PATH"


# Alias 
alias c="clear"
alias ll="eza -lh"
alias l="eza -lah"


# Completion
[ -s "/home/nerfthisdev/.bun/_bun" ] && source "/home/nerfthisdev/.bun/_bun"



export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


plugins=(
    git
    sudo
    web-search
    archlinux
    zsh-autosuggestions
    fast-syntax-highlighting
    copyfile
    copybuffer
    dirhistory
    fzf-tab
    zsh-bat
)

# Set-up oh-my-zsh
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------
# Set-up FZF key bindings (CTRL R for fuzzy history finder)
# -----------------------------------------------------
source <(fzf --zsh)

eval "$(zoxide init zsh)"

# prompt
eval "$(starship init zsh)"


zprof
