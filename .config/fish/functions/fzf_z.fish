# # fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
# z() {
#     [ $# -gt 0 ] && fasd_cd -d "$*" && return
#     local dir
#     dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
# }

function fzf_z -d "Fasd + fzf change directory, without arguments pulls up picker, with jumps directly"
  if count $argv
    fasd_cd -d $argv
  else
    fasd -Rdl "" | eval (__fzfcmd) --prompt="fzf\> " -1 -0 +m --no-sort $FZF_Z_OPTS | read -l result
    test $result; and cd $result
    commandline -f repaint
  end
end
