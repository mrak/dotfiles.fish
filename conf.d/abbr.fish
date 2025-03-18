status is-interactive; or exit

abbr --add --position anywhere --function __mrak_abbr_bangbang  -- !!
abbr --add --regex '^\.\.+$'   --function __mrak_abbr_dotdotdot -- ...

abbr --add -- lg        lazygit
abbr --add -- g         git
abbr --add -- k         kubectl
abbr --add -- kns       kubens
abbr --add -- kctx      kubectx
abbr --add -- tf        terraform
abbr --add -- v         env \$VISUAL
abbr --add -- e         env \$EDITOR
abbr --add -- ne        npm-exec
abbr --add -- be        bundle exec
abbr --add -- rmrf      rm -rf
abbr --add -- cdd       --set-cursor=% cd \$DEV_HOME/%
abbr --add -- cdp       --set-cursor=% cd \$DEV_HOME/Projects/%
abbr --add -- cds       --set-cursor=% cd \$DEV_HOME/Sources/%
abbr --add -- glsg      git ls-files \| grep
abbr --add -- xrdbmerge xrdb -quiet -merge \$HOME/.Xresources
abbr --add -- serve     python3 -m http.server
abbr --add -- o         open

switch $UNAME
    case Linux
        abbr --add -- cdbuild --set-cursor=% cd \$DEV_HOME/PKGBUILDs/%
        abbr --add -- cdaur --set-cursor=% cd \$DEV_HOME/AUR/%
        abbr --add -- cdabs --set-cursor=% cd /var/abs/%
        abbr --add -- p pacman
        abbr --add -- a aura
        abbr --add -- repkg makepkg -scrfi

        abbr --add -- orphans sudo pacman -Rs \(pacman -Qqdt\)
        abbr --add -- upgrade paccache -rk2\; and paccache -ruk0\; and sudo pacman -Syu
        abbr --add -- psg ps -eo pid,user,start_time,cmd --sort -etime \| grep -Fv grep \| grep -E
    case Darwin
        abbr --add -- orphans brew autoremove
        abbr --add -- upgrade brew update\; and brew upgrade
        abbr --add -- psg ps -eo pid,user,start,command \| grep -Fv grep \| grep -E
end

abbr --add --command terraform --regex ws -- tfws workspace

# git aliases
abbr --add --command git --regex br     -- gitbr     branch
abbr --add --command git --regex ca     -- gitca     commit --amend --no-edit
abbr --add --command git --regex co     -- gitco     checkout
abbr --add --command git --regex dt     -- gitdt     difftool
abbr --add --command git --regex mt     -- gitmt     mergetool
abbr --add --command git --regex st     -- gitst     status --short --branch
abbr --add --command git --regex staged -- gitstaged diff --cached
abbr --add --command git --regex sw     -- gitsw     switch
abbr --add --command git --regex pf     -- gitpf     push --force-with-lease
abbr --add --command git --regex po     -- gitpo     push origin
abbr --add --command git --regex pr     -- gitpr     pull --rebase
abbr --add --command git --regex sp     -- gitsp     stash pop
abbr --add --command git --regex lg     -- gitlg     log "--pretty='%C(yellow)%h %C(blue)%an%C(green)%d %Creset%s'" --no-merges
abbr --add --command git --regex ma     -- gitma     merge --abort
abbr --add --command git --regex ra     -- gitra     rebase --abort
abbr --add --command git --regex rc     -- gitrc     rebase --continue
