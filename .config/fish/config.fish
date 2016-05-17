# Paths
set -x PATH $HOME/.bin \
  $HOME/.rbenv/bin \
  $PATH

# Completion paths (homebrew fix)
set fish_complete_path ~/.config/fish/completions/ \
  /usr/local/share/fish/completions/ \
  /usr/local/share/fish/vendor_completions.d/ \
  $fish_complete_path

# Manpath
set -x MANPATH (brew --cellar) \
  $MANPAT\H
# NVM shit
set -x NVM_DIR ~/.nvm

. (rbenv init -|psub)

# Set my editors to Sublime Text 2
setenv EDITOR "atom -w"
setenv VISUAL "atom -w"
setenv PAGER "most"

# Homebrew Cask options
setenv HOMEBREW_CASK_OPTS "--appdir=/Applications"

# Alias zone
# Doesn't really reload, more of launches a new shell, but the results the same
alias reload 'exec fish -l'
# Git
# Hub is a useful tool that provides github integration. If you don't use it, I recommend deleting these lines
alias git hub

# Run something in the latest version of ruby
alias rbl "env RBENV_VERSION=latest "

# Disable overcommit
alias disoc "env OVERCOMMIT_DISABLE=1 "

alias rbldisoc "env OVERCOMMIT_DISABLE=1 RBENV_VERSION=latest "

# Zendesk docker utils
test -e ~/Developer/zendesk/docker-images/dockmaster/zdi.fish ; and source ~/Developer/zendesk/docker-images/dockmaster/zdi.fish

# Autojump (j command)
test -e /usr/local/share/autojump/autojump.fish ; and source /usr/local/share/autojump/autojump.fish

# Fundle fish plugin manager
test -e ~/.config/fish/fundle_config.fish ; and source ~/.config/fish/fundle_config.fish

# Interactive mode settings
# Specifically, anything you might not need in scripting should be put here.
if status --is-interactive
  # Greeting on new terminal
  set fish_greeting (date)

  # Prepend sudo when Alt+S is keyed
  function prepend_sudo
    set current_command (commandline)
    commandline "sudo $current_command"
  end

  # Prepend bx (bundle exec) when Alt+X is keyed
  function prepend_bundle_exec
    set current_command (commandline)
    commandline "bx $current_command"
  end

  # Prepend g (git) when Alt+G is keyed
  function prepend_git
    set current_command (commandline)
    commandline "g $current_command"
  end

  # Prepend rbl (rbenv latest ) when Alt+R is keyed
  function prepend_rbl
    set current_command (commandline)
    commandline "rbl $current_command"
  end

  # Deal with the hackishness needed to use custom binds in addition to vi mode
  function paradox_binding
    fish_vi_key_bindings
    bind --mode insert \es prepend_sudo
    bind -M insert \ex prepend_bundle_exec
    bind -M insert \eg prepend_git
    bind -M insert \er prepend_rbl
  end

  set -g fish_key_bindings paradox_binding

  abbr g="git"
  abbr gst="git status"
  abbr gcm="git commit -m"
  abbr gc="git checkout"
  abbr gu="rbldisoc git up"

  # Ruby
  abbr b="bundle"
  abbr bx="bundle exec"
  abbr rk="rake"
  abbr rb="ruby"
  abbr bxr="bundle exec rake"
end

# iTerm 2 stuff
test -e ~/.config/fish/iterm2_shell_integration.fish ; and source ~/.config/fish/iterm2_shell_integration.fish

# GPG stuff
test -e ~/.config/fish/gnupg.fish ; and source ~/.config/fish/gnupg.fish

# z
for file in ~/.config/fish/conf.d/*.fish
    source $file
end
