# ~/.config/fish/config.fish
# ---------------------------------
# Modular config load — fish edition
# ---------------------------------
scheme set tomorrow-night
set fish_greeting

eval (opam env)

set -gx EDITOR nvim
set -gx ZSH $HOME/.oh-my-zsh        # kept for reference; unused in fish
set -gx BUN_INSTALL $HOME/.bun
set -gx SDKMAN_DIR $HOME/.sdkman

fish_add_path $HOME/.local/bin
fish_add_path $HOME/go/bin
fish_add_path $BUN_INSTALL/bin
fish_add_path /home/nerfthisdev/.spicetify


abbr -a c  'clear'
abbr -a ssh 'kitten ssh'
abbr -a ll 'eza -lh'
abbr -a l  'eza -lah'
abbr -a lg 'lazygit'
abbr -a mvim 'NVIM_APPNAME=nvim-minimax nvim'


if status is-interactive
    # Commands to run in interactive sessions can go here
end


if type -q zoxide
  zoxide init fish | source
end

starship init fish | source
