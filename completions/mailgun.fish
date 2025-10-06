complete -c mailgun -f -s t -l to --no-files -r -d "To: Name <email>"
complete -c mailgun -f -s f -l from --no-files -r -d "From: Name <email>"
complete -c mailgun -f -s s -l subject --no-files -r -d "Subject: (no subject)"
complete -c mailgun -f -s b -l body --no-files -r -d "Body text of the email"
complete -c mailgun -s a -l attachment -r -d "File to attach"
complete -c mailgun -f -s e -l editor -d 'compose body text in editor'
