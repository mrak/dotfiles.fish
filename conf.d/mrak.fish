status is-interactive; or exit

for fzf_dir in /opt/homebrew/opt/fzf/ /usr/local/opt/fzf/
    if [ -f "$fzf_dir"/shell/key-bindings.fish ]
        source "$fzf_dir"/shell/key-bindings.fish
        break
    end
end

command -q mise; and mise activate fish | source

# if the terminal supports it, set keyboard_transmit mode
# fixes st
if tput smkx 2>/dev/null
    function mrak_disable_keypad_transmit --on-event fish_preexec
        tput rmkx 2>/dev/null
    end

    function mrak_enable_keypad_transmit --on-event fish_postexec
        tput smkx 2>/dev/null
    end
end

fish_config theme choose Mrak
# Emulates vim's cursor shape behavior
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace underscore
set fish_cursor_replace_one underscore
set fish_cursor_visual block
# git prompt
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_char_dirtystate ±
set __fish_git_prompt_color_dirtystate brblack
set __fish_git_prompt_char_invalidstate !
set __fish_git_prompt_char_stagedstate =
set __fish_git_prompt_color_stagedstate brblack
set __fish_git_prompt_char_untrackedfiles ?
set __fish_git_prompt_showupstream 1
set __fish_git_prompt_char_upstream_ahead ↑
set __fish_git_prompt_char_upstream_behind ↓
set __fish_git_prompt_char_upstream_diverged ↑↓
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_prefix ' '
set __fish_git_prompt_color_upstream brblack
set __fish_git_prompt_showcolorhints 1
set __fish_git_prompt_color_flags brblack
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_branch_detached yellow
set __fish_git_prompt_color_branch_dirty yellow
set __fish_git_prompt_color_merging brblack

complete --command xhs --wraps xh

abbr --add ... --regex '^\.\.+$' --function __mrak_abbr_dotdotdot
abbr --add !! --position anywhere --function __mrak_abbr_bangbang
abbr --position command --add g git
abbr --position command --add k kubectl
abbr --position command --add kns kubens
abbr --position command --add kctx kubectx
abbr --position command --add tf terraform
abbr --position command --add v env \$VISUAL
abbr --position command --add e env \$EDITOR
abbr --position command --add ne npm-exec
abbr --position command --add be bundle exec
abbr --position command --add rmrf rm -rf
abbr --position command --add cdd --set-cursor=% cd \$DEV_HOME/%
abbr --position command --add cdp --set-cursor=% cd \$DEV_HOME/Projects/%
abbr --position command --add cds --set-cursor=% cd \$DEV_HOME/Sources/%
abbr --position command --add glsg git ls-files \| grep
abbr --position command --add xrdbmerge xrdb -quiet -merge \$HOME/.Xresources
abbr --position command --add serve python3 -m http.server
switch (uname)
    case Linux
        abbr --position command --add cdbuild --set-cursor=% cd \$DEV_HOME/PKGBUILDs/%
        abbr --position command --add cdaur --set-cursor=% cd \$DEV_HOME/AUR/%
        abbr --position command --add cdabs --set-cursor=% cd /var/abs/%
        abbr --position command --add p pacman
        abbr --position command --add a aura
        abbr --position command --add repkg makepkg -scrfi

        abbr --position command --add o xdg-open
        abbr --position command --add orphans sudo pacman -Rs \(pacman -Qqdt\)
        abbr --position command --add upgrade paccache -rk2\; and paccache -ruk0\; and sudo pacman -Syu
        abbr --position command --add psg ps -eo pid,user,start_time,cmd --sort -etime \| grep -Fv grep \| grep -E
    case Darwin
        abbr --position command --add o open
        abbr --position command --add orphans brew autoremove
        abbr --position command --add upgrade brew update\; and brew upgrade
        abbr --position command --add psg ps -eo pid,user,start,command \| grep -Fv grep \| grep -E
end
