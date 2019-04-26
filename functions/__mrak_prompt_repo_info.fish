function __mrak_prompt_repo_info --description "prompt info for git, svn, and hg"
    set -l folder '.'

    for i in (seq 0 (pwd|tr -cd '/'|wc -c))
        if [ -r $folder/.git ]; and [ -d $folder/.git ]
            __git_state $folder
            break
        end
        if [ -r $folder/.svn ]; and [ -d $folder/.svn ]
            __svn_state
            break
        end
        if [ -r $folder/_darcs ]; and [ -d $folder/_darcs ]
            __darcs_state
            break
        end
        if [ -r $folder/.hg ]; and [ -d $folder/.hg ]
            __hg_state
            break
        end
        set folder ../$folder
    end

    set_color normal
end

function __git_state --description "git state for fish prompt"
    set -g __mrak_prompt_symbol "∓" "yellow"
    command -s git >/dev/null; or return

    set -l __git_dir $argv[1]
    set -l git_dot_dir $__git_dir/.git
    [ -z $git_dot_dir ]; and return

    set -l merging "∪"
    set -l rebasing "⊆"
    set -l bisecting "%"
    set -l cherry "¤"

    set -l untracked "?" false
    set -l modified "±" false
    set -l deleted "-" false
    set -l staged "=" false

    set -l ahead "↑"
    set -l behind "↓"
    set -l diverged "↓↑"

    set -l unmerged "!" false

    if [ -f $git_dot_dir/rebase-merge/interactive ]
       set __mrak_prompt_symbol[1] $rebasing">"
    else if [ -d $git_dot_dir/rebase-merge ]
       set __mrak_prompt_symbol[1] $rebasing$merging
    else
       if [ -d $git_dot_dir/rebase-apply ]
          if [ -f $git_dot_dir/rebase-apply/rebasing ]
             set __mrak_prompt_symbol[1] $rebasing
          else if [ -f $git_dot_dir/rebase-apply/applying ]
             set __mrak_prompt_symbol[1] "AM"
          else
             set __mrak_prompt_symbol[1] "AM/REBASE"
          end
       else if [ -f $git_dot_dir/MERGE_HEAD ]
          set __mrak_prompt_symbol[1] $merging
       else if [ -f $git_dot_dir/MERGE_MSG ]
          set __mrak_prompt_symbol[1] $merging
       else if [ -f $git_dot_dir/CHERRY_PICK_HEAD ]
          set __mrak_prompt_symbol[1] $cherry
       else if [ -f $git_dot_dir/BISECT_LOG ]
          set __mrak_prompt_symbol[1] $bisecting
      end
    end

    set -l g ""
    if [ (uname) = Darwin ]
        set g (git -C $__git_dir status --porcelain -b 2>/dev/null)
    else
        set g (git -C $__git_dir status --porcelain -b | uniq -w 2 2>/dev/null)
    end

    set_color yellow
    if string match -qr '^## HEAD' $g[1]
        set -l tag (git -C $__git_dir tag --points-at HEAD) ∅
        printf $tag[1]
    else
        string replace -ra '(^## |\.\.\..*$)' '' $g[1] | tr -d \n
        switch $g[1]
            case '* [ahead *, behind *]'
                printf ' %s' $diverged
            case '* [ahead *]'
                printf ' %s' $ahead
            case '* [behind *]'
                printf ' %s' $behind
        end
    end

    [ (count $g) -eq 1 ]; and return
    for l in $g[2..-1]
        switch (string sub -l 2 $l)
            case '??'
                set untracked[2] true
            case '\!\!'
            case DD AU UD UA DU AA UU
                set unmerged[2] true
            case ' M'
                set modified[2] true
            case '*M'
                set staged[2] true
                set modified[2] true
            case ' D'
                set deleted[2] true
            case '*D'
                set staged[2] true
                set deleted[2] true
            case '*'
                set staged[2] true
        end
    end

    set_color brblack
    printf ' '
    for state in staged modified deleted untracked
        [ $$state[1][2] = true ]; and printf $$state[1][1]
    end
    if [ $unmerged[2] = true ]
        set_color brred
        printf $unmerged[1]
    end
    set_color normal
end

function __svn_state --description "svn state for fish prompt"
    set -g __mrak_prompt_symbol "⚡" "blue"
    command -s >/dev/null; or return

    set_color blue
    svn info | awk '$1 == "Revision:" { print $2 }' | tr -d \n

    set -l modified "±"
    set -l added "+"
    set -l removed "\-"
    set -l missing "!"
    set -l untracked "?"

    printf ' '
    set_color brblack
    # use string for ± since tr doesn't respect unicode
    svn status 2>/dev/null | string sub -l 1 \
                           | sort -u \
                           | tr -d \n \
                           | string replace M $modified \
                           | tr 'AD?!' {$added}{$removed}{$untracked}{$missing}
    set_color normal
end

function __hg_state --description "hg state for fish prompt"
    set -g __mrak_prompt_symbol "☿" "magenta"
    command -s hg; or return

    set_color magenta;
    hg branch 2>/dev/null | tr -d \n

    set -l modified "±"
    set -l added "+"
    set -l removed "\-"
    set -l missing "!"
    set -l untracked "?"

    printf ' '
    set_color brblack
    # use string for ± since tr doesn't respect unicode
    hg status 2>/dev/null | string sub -l 1 \
                          | sort -u \
                          | tr -d \n \
                          | string replace M $modified \
                          | tr 'AD?!' {$added}{$removed}{$untracked}{$missing}
    set_color normal
end

function __darcs_state --description "darcs state for fish prompt"
    set -g __mrak_prompt_symbol "∗" "cyan"
    command -s darcs; or return

    set -l modified "±"
    set -l added "+"
    set -l removed "\-"

    set_color cyan
    printf '%s ' darcs

    set_color brblack
    # use string for ± since tr doesn't respect unicode
    darcs whatsnew -s 2>/dev/null | string sub -l 1 \
                                  | sort -u \
                                  | tr -d \n \
                                  | string replace M $modified \
                                  | tr 'AR' {$added}{$removed}
    set_color normal
end
