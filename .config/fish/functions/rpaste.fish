function rpaste --description 'Interact with the rocketpaste service'
  argparse -x "o,d" -x 'd,c' 'o/open' 'd/delete' 'c/copy' -- $argv


  if test (count $argv) -eq 0
      set -l url (curl --data-binary @/dev/stdin https://paste.rs/)
      if set -q _flag_c
        pbcopy $url
      end
      if set -q _flag_o
        open $url
      else
        echo $url
      end
      return
  end

  for arg in $argv
    if string match 'http*' $arg
      if set -q _flag_o
        open $arg
      else if set -q _flag_d
        curl -X DELETE $arg
      end
    else if set -q _flag_d
      echo "Delete flag can only be used with URLs"
    else if test -e $arg
      set -l url (curl --data-binary @$arg https://paste.rs/)

      if set -q _flag_c
        echo $url | pbcopy
      end

      if set -q _flag_o
        open $url
      else
        echo $url
      end
    end
  end
end
