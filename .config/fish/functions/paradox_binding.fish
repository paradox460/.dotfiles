# Deal with the hackishness needed to use custom binds in addition to vi mode
function paradox_binding
  fish_vi_key_bindings

  if command -sq fzf
    bind -M insert \ez fzf_z
  end
end
