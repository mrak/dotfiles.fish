function __mrak_prompt_k8s --description "prompt info for kubernetes context"
    command -s kubectl >/dev/null; or return
    test -f ~/.kube/config; or return
    set -l ctx_ns (kubectl config get-contexts | awk '/\*/ {printf "%s\n%s", $2, ($5=="" ? "default" : $5); exit}')
    set -l color (set_color blue)

    if string match -qr 'plat|prd' $ctx_ns[1]
        set color (set_color red)
    end

    printf "%s%s"(set_color brblack)"[%s%s"(set_color brblack)"]" $color $ctx_ns[1] $color $ctx_ns[2]
end
