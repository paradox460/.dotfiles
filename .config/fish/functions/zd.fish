# Utility functions
function -a directory -d Change to Zendesk Directory zd
  if test -z "$directory"
    set directory .
  end
  cd ~/Developer/zendesk/$directory
end
