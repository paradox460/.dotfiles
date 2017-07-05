function paradox_prepend_rbl
  set current_command (commandline)
  commandline "rbl $current_command"
end
