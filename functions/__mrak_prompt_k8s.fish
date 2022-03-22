function __mrak_prompt_k8s --description "prompt info for kubernetes context"
    command -s kubectl >/dev/null; or return
    [ ! -f ~/.kube/config ]; and return

    set_color blue
    kubectl config get-contexts | awk '/\*/ {printf "⬟ %s %s ", $2, $5}'
    set_color normal
end
