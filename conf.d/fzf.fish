status is-interactive; or exit

for fzf_dir in /opt/homebrew/opt/fzf/ /usr/local/opt/fzf/
    if test -f $fzf_dir/shell/key-bindings.fish
        # @fish-lsp-disable-next-line 1004
        source $fzf_dir/shell/key-bindings.fish
        break
    end
end
