function paradox_prepend_sudo
  set current_command (commandline)
  commandline "sudo $current_command"
end
