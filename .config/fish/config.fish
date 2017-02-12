# Paths
set -x PATH $HOME/.bin \
  $PATH

# Completion paths (homebrew fix)
set fish_complete_path ~/.config/fish/completions/ \
  /usr/local/share/fish/completions/ \
  /usr/local/share/fish/vendor_completions.d/ \
  $fish_complete_path

# Manpath
set -x MANPATH (brew --cellar) \
  $MANPATH

# Lang Settings
set LANG en_US.UTF-8
set LANGUAGE en_US.UTF-8
set LC_ALL en_US.UTF-8

source (rbenv init -|psub)

# Set my editors to Sublime Text 2
setenv EDITOR "vim"
setenv VISUAL "vim"
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

# Add editor override to use atom
alias atomedit "env EDITOR='atom -w' VISUAL='atom -w' "


# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

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
  abbr gcb="git checkout -b"
  abbr gu="rbldisoc git up"

  # Ruby
  abbr b="bundle"
  abbr bx="bundle exec"
  abbr rk="rake"
  abbr rb="ruby"
  abbr bxr="bundle exec rake"
end

# iTerm 2 fish integration
test -e ~/.iterm2_shell_integration.fish ; and source ~/.iterm2_shell_integration.fish

# GPG stuff
test -e ~/.config/fish/gnupg.fish ; and source ~/.config/fish/gnupg.fish

# z
for file in ~/.config/fish/conf.d/*.fish
    source $file
end

# NVM shit
if type -q nvm
  set -x NVM_DIR ~/.nvm
  nvm >/dev/null ^/dev/null
end
source (which env_parallel.fish)
