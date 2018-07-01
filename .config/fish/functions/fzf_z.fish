# # fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
function fzf_z -d "Fasd + fzf change directory, without arguments pulls up picker, with jumps directly"
  if count $argv > /dev/null
    fasd_cd -d $argv
  else
    fasd -Rdl "" | eval (__fzfcmd) --prompt="fzf\> " -1 -0 +m --no-sort $FZF_Z_OPTS | read -l result
    test $result; and cd $result
    commandline -f repaint
  end
end
