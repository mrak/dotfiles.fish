function fish_right_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
      echo 'NORMAL'
    case insert
      if [ ! $__mrak_prompt_status = 0 ]
        set_color brblack;
        printf '%s' $__mrak_prompt_status
      end
      set -e __mrak_prompt_status
    case replace_one
      set_color --bold green
      echo 'REPLACE'
    case visual
      set_color --bold brmagenta
      echo 'VISUAL'
    case '*'
      set_color --bold red
      echo '?'
  end
  set_color normal
end
