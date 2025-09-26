
export ZSH="$HOME/.oh-my-zsh"

export EDITOR=nvim
ZSH_THEME="robbyrussell"




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

source $ZSH/oh-my-zsh.sh

source <(fzf --zsh)
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export PATH=~/.local/bin:$PATH
export EDITOR='nvim'

# ALIASES

alias c="clear"
alias ll="eza -lh"
alias l="eza -lah"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
eval "$(zoxide init zsh)"


#
[[ -f /home/nerfthisdev/.dart-cli-completion/zsh-config.zsh ]] && . /home/nerfthisdev/.dart-cli-completion/zsh-config.zsh || true
eval "$(starship init zsh)"
## [/Completion]


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/nerfthisdev/.bun/_bun" ] && source "/home/nerfthisdev/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH=$PATH:/home/nerfthisdev/.spicetify
