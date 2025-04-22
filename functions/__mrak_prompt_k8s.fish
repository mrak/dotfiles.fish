function __mrak_prompt_k8s --description "prompt info for kubernetes context"
    command -s kubectl >/dev/null; or return
    test -f ~/.kube/config; or return

    kubectl config get-contexts \
    | awk '/\*/ {printf "'(set_color blue)'⬟ %s'(set_color brblack)'['(set_color blue)'%s'(set_color brblack)']", $2, ($5=="" ? "default" : $5); exit}'
end
