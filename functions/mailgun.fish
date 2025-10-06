function mailgun --description "send email through the mailgun API"
    set -l _flag_subject "(no subject)"
    set -l _flag_body ""
    set -l attachments

    argparse --move-unknown --strict-longopts \
        "t/to=" \
        "f/from=" \
        "s/subject=" \
        "b/body=" \
        "e/editor" \
        "a/attachment=+" \
        -- \
        $argv

    if not set -ql _flag_to || not set -ql _flag_from
        echo "mailgun: options '-t/--to' and '-f/--from' are required" >&2
        return 1
    end

    if set -ql _flag_editor
        set -l editor $VISUAL $EDITOR vi
        set -l bodyfile (mktemp).txt
        env $editor[1] $bodyfile
        if test $status -ne 0
            echo "Non-zero exit code while composing body. Exiting." >&2
            return 1
        end
        set _flag_body "<$bodyfile"
    end

    for file in $_flag_attachment
        set attachments $attachments "-F" "attachment=@$file"
    end

    set -l domain "$(string replace --regex --all '^.*@|>.*$' '' $_flag_from)"
    set -l api_key "$(op item get --account my.1password.com --vault Private "mailgun: $domain" --fields "credential" --reveal)"

    curl -s --user "api:$api_key" \
        "https://api.mailgun.net/v3/$domain/messages" \
        -F "to=$_flag_to" \
        -F "from=$_flag_from" \
        -F "subject=$_flag_subject" \
        -F "text=$_flag_body" \
        $attachments
end
