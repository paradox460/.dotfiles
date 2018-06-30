# Deal with the hackishness needed to use custom binds in addition to vi mode
function paradox_binding
  fish_vi_key_bindings
  bind --mode insert \es paradox_prepend_sudo
  bind -M insert \ex paradox_prepend_bundle_exec
  bind -M insert \eg paradox_prepend_git
  bind -M insert \er paradox_prepend_rbl

  if command -sq fzf
    bind -M insert \ez fzf_z
  end
end
