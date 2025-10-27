
# Modular config load

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
alias cd="z"
alias lg="lazygit"


# Completion
[ -s "/home/nerfthisdev/.bun/_bun" ] && source "/home/nerfthisdev/.bun/_bun"




export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# --- Fast completion init with caching ---
# Skip OMZ compfix (expensive compaudit) unless you need it
export ZSH_DISABLE_COMPFIX=true

autoload -Uz compinit

# Reuse .zcompdump for 24 hours; otherwise do a full init
ZCD="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -n ${ZCD}(#qN.mh+24) ]]; then
  compinit -C     # trust cached dump, skip security checks
else
  compinit -i     # skip insecure dirs prompts
fi

# Optionally compile the dump to speed parsing
[[ -f ${ZCD} ]] && command -v zcompile >/dev/null && zcompile -R -- ${ZCD}.zwc ${ZCD}


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
source ~/.config/nnn/nnn.zsh

# -----------------------------------------------------
# Set-up FZF key bindings (CTRL R for fuzzy history finder)
# -----------------------------------------------------
source <(fzf --zsh)

eval "$(zoxide init zsh)"

# prompt
eval "$(starship init zsh)"



# fnm
FNM_PATH="/home/nerfthisdev/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi




# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/nerfthisdev/.opam/opam-init/init.zsh' ]] || source '/home/nerfthisdev/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
