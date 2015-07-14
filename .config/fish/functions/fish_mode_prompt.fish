function fish_mode_prompt --description "Display the current VI mode"
  if set -q __fish_vi_mode
    echo -s -n (set_color green) '['
    switch $fish_bind_mode
      case default
        echo -s (set_color red) 'N'
      case insert
        echo -s (set_color green) 'I'
      case visual
        echo -s (set_color blue) 'V'
    end
    echo -s -n (set_color green) '] '
  end
end
