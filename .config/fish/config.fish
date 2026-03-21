# ~/.config/fish/config.fish
# ---------------------------------
# Modular config load — fish edition
# ---------------------------------
scheme set tomorrow-night
set fish_greeting

set fish_cursor_default block

eval (opam env)

set -gx EDITOR nvim
set -gx ZSH $HOME/.oh-my-zsh        # kept for reference; unused in fish
set -gx BUN_INSTALL $HOME/.bun
set -gx SDKMAN_DIR $HOME/.sdkman

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/nvim/mason/bin/
fish_add_path $HOME/go/bin
fish_add_path $BUN_INSTALL/bin
fish_add_path /home/nerfthisdev/.spicetify
fish_add_path $HOME/.cargo/bin


abbr -a c  'clear'
abbr -a ssh 'kitten ssh'
abbr -a ll 'eza -lh'
abbr -a l  'eza -lah'
abbr -a lg 'lazygit'
abbr -a mvim 'NVIM_APPNAME=nvim-minimax nvim'
abbr -a top 'btop'

if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Prefer hellwal-generated Starship config when present.
if test -f ~/.cache/hellwal/starship.toml
  set -gx STARSHIP_CONFIG ~/.cache/hellwal/starship.toml
else
  set -e STARSHIP_CONFIG
end

if type -q zoxide
  zoxide init fish | source
end

starship init fish | source

# Keep hellwal colors after scheme/theme changes.
if test -f ~/.config/fish/conf.d/hellwal-fish-colors.fish
  source ~/.config/fish/conf.d/hellwal-fish-colors.fish
end
