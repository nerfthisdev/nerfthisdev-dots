set -l hellwal_vars_file "$HOME/.cache/hellwal/variablesfish.fish"
if test -f $hellwal_vars_file
    source $hellwal_vars_file
else
    return
end

if not set -q foreground
    return
end

set -g fish_color_normal $foreground
set -g fish_color_command $color4 --bold
set -g fish_color_keyword $color3 --bold
set -g fish_color_quote $color2
set -g fish_color_redirection $color7
set -g fish_color_end $color14
set -g fish_color_error $color1 --bold
set -g fish_color_param $color7
set -g fish_color_comment $color12
set -g fish_color_selection --background=$color4 $foreground
set -g fish_color_search_match --background=$color4 $foreground
set -g fish_color_operator $color3
set -g fish_color_escape $color2
set -g fish_color_autosuggestion $color12
set -g fish_color_cwd $color4 --bold
set -g fish_color_cwd_root $color1 --bold
set -g fish_color_valid_path $color4
set -g fish_color_user $color7
set -g fish_color_host $color7
set -g fish_color_host_remote $color3
set -g fish_color_cancel $color1 --bold
set -g fish_color_pager $color7
