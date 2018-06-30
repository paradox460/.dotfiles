function fzf_up -d 'cd backwards'
  pwd | awk -v RS=/ '/\n/ {exit} {p=p $0 "/"; print p}' | eval (__fzfcmd) --tac +m --select-1 --exit-0 --prompt="cd\ up\> " $FZF_BCD_OPTS | read -l result
  test $result; and cd $result
  commandline -f repaint
end
