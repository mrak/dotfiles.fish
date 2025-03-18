function __mrak_prompt_repo_info --description "prompt info for git"
    command -s git >/dev/null; or return

    set -l git_dir $PWD
    while true
        if test -r $git_dir/.git -a -d $git_dir/.git
            break
        end
        set git_dir (path dirname $git_dir); or return
    end
    set -l git_dot_dir $git_dir/.git

    set -l merging "∑"
    set -l rebasing "↨"
    set -l bisecting "%"
    set -l cherry "¤"
    set -l nobranch "∅"

    set -l untracked "?" false
    set -l modified "±" false
    set -l deleted - false
    set -l staged "=" false
    set -l unmerged "!" false

    set -l ahead "↑"
    set -l behind "↓"
    set -l diverged "↓↑"

    set -l branch
    set -l state
    set -l g ""
    if test "$UNAME" = Darwin
        set g (git -C $git_dir --no-optional-locks status -uno --ignore-submodules=dirty --porcelain -b 2>/dev/null)
    else
        set g (git -C $git_dir --no-optional-locks status -uno --ignore-submodules=dirty --porcelain -b | uniq -w 2 2>/dev/null)
    end

    if test -d $git_dot_dir/rebase-merge
        set state $rebasing
        if test -f $git_dot_dir/rebase-merge/head-name
            set branch (string replace -r '^.*/' '' < "$git_dot_dir/rebase-merge/head-name")
        end
    else if test -d $git_dot_dir/rebase-apply
        set state $rebasing
        if test -f $git_dot_dir/rebase-apply/rebasing
            if test -f $git_dot_dir/rebase-apply/head-name
                set branch (string replace -r '^.*/' '' < "$git_dot_dir/rebase-merge/head-name")
            end
        end
    else if test -f $git_dot_dir/MERGE_HEAD
        set state $merging
    else if test -f $git_dot_dir/CHERRY_PICK_HEAD
        set state $cherry
    else if test -f $git_dot_dir/BISECT_LOG
        set state $bisecting
    end
    if test -z $branch
        if string match -qr '^## HEAD' $g[1]
            set -l tag (git -C $git_dir --no-optional-locks tag --points-at HEAD) $nobranch
            set branch $tag[1]
        else
            set branch (string replace -ra '(^## |\.\.\..*$)' '' $g[1])
        end
    end

    switch $g[1]
        case '* [ahead *, behind *]'
            set state $diverged $state
        case '* [ahead *]'
            set state $ahead $state
        case '* [behind *]'
            set state $behind $state
    end

    printf %s%s (set_color yellow) $branch
    test (count $state) -gt 0; and string join '' ' ' $state

    test (count $g) -eq 1; and return
    for l in $g[2..-1]
        switch (string sub -l 2 $l)
            case '\?\?'
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

    printf %s ' '
    if test $unmerged[2] = true
        set_color brred
        printf %s $unmerged[1]
    end
    set_color brblack
    for worktree in staged modified deleted untracked
        test $$worktree[1][2] = true; and printf %s $$worktree[1][1]
    end

    set_color normal
end
