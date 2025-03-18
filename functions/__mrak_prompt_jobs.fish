function __mrak_prompt_jobs
    set -l job_count (count (jobs))
    if [ ! $job_count = 0 ]
        printf '%s(%s)%s' (set_color brblack) $job_count (set_color normal)
    end
end
