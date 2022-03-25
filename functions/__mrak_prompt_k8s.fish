function __mrak_prompt_k8s --description "prompt info for kubernetes context"
    printf ' '
    command -s kubectl >/dev/null; or return
    [ -f ~/.kube/config ]; or return

    set_color blue
    kubectl config get-contexts | awk '/\*/ {printf "⬟ %s:%s ", $2, ($5=="" ? "default" : $5)}'
    set_color normal
end
