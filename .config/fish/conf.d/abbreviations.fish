  abbr --add g "git"
  abbr --add gst "git status"
  abbr --add gcm "git commit -m"
  abbr --add gc "git checkout"
  abbr --add gcb "git checkout -b"
  abbr --add gu "gh repo sync"
  abbr --add j "jira"
  abbr --add rtx "mise"
  abbr --add mr "mise run"

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item
