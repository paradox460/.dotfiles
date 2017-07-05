function paradox_prepend_git
  set current_command (commandline)
  commandline "git $current_command"
end
