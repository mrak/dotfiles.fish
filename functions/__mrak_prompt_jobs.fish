function __mrak_prompt_jobs
    set -l job_count (count (jobs))
    if [ ! $job_count = 0 ]
        set_color brblack
        printf '(%s)' $job_count
    end
    set_color normal
end
