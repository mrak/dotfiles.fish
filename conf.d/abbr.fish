status is-interactive; or exit

abbr --add --position anywhere --function __mrak_abbr_bangbang  -- !!
abbr --add --regex '^\.\.+$'   --function __mrak_abbr_dotdotdot -- ...

abbr --add -- be        bundle exec
abbr --add -- cdd       --set-cursor=% cd \$DEV_HOME/%
abbr --add -- cdp       --set-cursor=% cd \$DEV_HOME/Projects/%
abbr --add -- cds       --set-cursor=% cd \$DEV_HOME/Sources/%
abbr --add -- e         env \$EDITOR
abbr --add -- g         git
abbr --add -- glsg      git ls-files \| grep
abbr --add -- k         kubectl
abbr --add -- kctx      kubectx
abbr --add -- kns       kubens
abbr --add -- lg        lazygit
abbr --add -- ne        npm-exec
abbr --add -- o         open
abbr --add -- rmrf      rm -rf
abbr --add -- serve     python3 -m http.server
abbr --add -- tf        terraform
abbr --add -- v         env \$VISUAL
abbr --add -- xrdbmerge xrdb -quiet -merge \$HOME/.Xresources

switch $UNAME
    case Linux
        abbr --add -- a aura
        abbr --add -- cdabs --set-cursor=% cd /var/abs/%
        abbr --add -- cdaur --set-cursor=% cd \$DEV_HOME/AUR/%
        abbr --add -- cdbuild --set-cursor=% cd \$DEV_HOME/PKGBUILDs/%
        abbr --add -- p pacman
        abbr --add -- repkg makepkg -scrfi

        abbr --add -- orphans sudo pacman -Rs \(pacman -Qqdt\)
        abbr --add -- psg ps -eo pid,user,start_time,cmd --sort -etime \| grep -Fv grep \| grep -E
        abbr --add -- upgrade paccache -rk2\; and paccache -ruk0\; and sudo pacman -Syu
    case Darwin
        abbr --add -- orphans brew autoremove
        abbr --add -- psg ps -eo pid,user,start,command \| grep -Fv grep \| grep -E
        abbr --add -- upgrade brew update\; and brew upgrade
end

abbr --add --command terraform --regex ws -- terraform-ws workspace

# git aliases
abbr --add --command git --regex br     -- git-br     branch
abbr --add --command git --regex ca     -- git-ca     commit --amend --no-edit
abbr --add --command git --regex co     -- git-co     checkout
abbr --add --command git --regex dt     -- git-dt     difftool
abbr --add --command git --regex lg     -- git-lg     log "--pretty='%C(yellow)%h %C(blue)%an%C(green)%d %Creset%s'" --no-merges
abbr --add --command git --regex ma     -- git-ma     merge --abort
abbr --add --command git --regex mt     -- git-mt     mergetool
abbr --add --command git --regex pf     -- git-pf     push --force-with-lease
abbr --add --command git --regex po     -- git-po     push origin
abbr --add --command git --regex pr     -- git-pr     pull --rebase
abbr --add --command git --regex ra     -- git-ra     rebase --abort
abbr --add --command git --regex rc     -- git-rc     rebase --continue
abbr --add --command git --regex sp     -- git-sp     stash pop
abbr --add --command git --regex st     -- git-st     status --short --branch
abbr --add --command git --regex staged -- git-staged diff --cached
abbr --add --command git --regex sw     -- git-sw     switch
