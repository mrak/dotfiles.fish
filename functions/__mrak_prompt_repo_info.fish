function __mrak_prompt_repo_info --description "prompt info for git"
    set -l folder $PWD

    while true
        if [ -r $folder/.git ]; and [ -d $folder/.git ]
            __git_state $folder
            break
        end
        set folder (path dirname $folder); or break
    end

    set_color normal
end

function __git_ongoing --description "rebasing/merging/bisecting/etc"
    set -l git_dot_dir $argv[1]
    set -l merging "∑"
    set -l rebasing "↨"
    set -l bisecting "%"
    set -l cherry "¤"

    if [ -f $git_dot_dir/rebase-merge/head-name ]
        printf '%s %s' (string replace -r '^.*/' '' < "$git_dot_dir/rebase-merge/head-name") $rebasing
    else if [ -f $git_dot_dir/rebase-merge/interactive ]
        printf %s $rebasing
    else if [ -d $git_dot_dir/rebase-merge ]
        printf %s $rebasing$merging
    else if [ -d $git_dot_dir/rebase-apply ]
        if [ -f $git_dot_dir/rebase-apply/rebasing ]
            printf %s $rebasing
        else if [ -f $git_dot_dir/rebase-apply/applying ]
            printf %s AM
        else
            printf %s AM/REBASE
        end
    else if [ -f $git_dot_dir/MERGE_HEAD ]
        printf %s $merging
    else if [ -f $git_dot_dir/MERGE_MSG ]
        printf %s $merging
    else if [ -f $git_dot_dir/CHERRY_PICK_HEAD ]
        printf %s $cherry
    else if [ -f $git_dot_dir/BISECT_LOG ]
        printf %s $bisecting
    else
        set -l tag (git -C $__git_dir --no-optional-locks tag --points-at HEAD) ∅
        printf %s $tag[1]
    end
end

function __git_state --description "git state for fish prompt"
    command -s git >/dev/null; or return

    set -l __git_dir $argv[1]
    set -l git_dot_dir $__git_dir/.git
    [ -z $git_dot_dir ]; and return

    set -l untracked "?" false
    set -l modified "±" false
    set -l deleted - false
    set -l staged "=" false

    set -l ahead "↑"
    set -l behind "↓"
    set -l diverged "↓↑"

    set -l unmerged "!" false

    set -l g ""
    if [ $UNAME = Darwin ]
        set g (git -C $__git_dir --no-optional-locks status -uno --ignore-submodules=dirty --porcelain -b 2>/dev/null)
    else
        set g (git -C $__git_dir --no-optional-locks status -uno --ignore-submodules=dirty --porcelain -b | uniq -w 2 2>/dev/null)
    end

    set_color yellow
    if string match -qr '^## HEAD' $g[1]
        __git_ongoing $git_dot_dir
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

    set_color brblack
    printf %s ' '
    for state in staged modified deleted untracked
        [ $$state[1][2] = true ]; and printf %s $$state[1][1]
    end
    if [ $unmerged[2] = true ]
        set_color brred
        printf %s $unmerged[1]
    end
    set_color normal
end
