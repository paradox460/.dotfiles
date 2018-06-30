function fzf_cdhist -d 'cd to one of the previously visited locations'
  # Clear non-existent folders from cdhist.
  set -l buf
  for i in (seq 1 (count $dirprev))
    set -l dir $dirprev[$i]
    if test -d $dir
      set buf $buf $dir
    end
  end
  set dirprev $buf
  string join \n $dirprev | uniq | eval (__fzfcmd) -0 -1 --tac +m --tiebreak=index --prompt="dirhist\> " $FZF_CDHIST_OPTS | read -l result
  test $result; and cd $result
  commandline -f repaint
end
