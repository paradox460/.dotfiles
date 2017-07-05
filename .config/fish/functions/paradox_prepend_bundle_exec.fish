function paradox_prepend_bundle_exec
  set current_command (commandline)
  commandline "bundle exec $current_command"
end
