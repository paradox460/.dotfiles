# Paths
set -gx PATH $HOME/.bin \
  $PATH

# Completion paths (homebrew fix)
set fish_complete_path ~/.config/fish/completions/ \
  /usr/local/share/fish/completions/ \
  /usr/local/share/fish/vendor_completions.d/ \
  $fish_complete_path

# Manpath
set -gx MANPATH (brew --cellar) \
  $MANPATH

# Lang Settings
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8


source (rbenv init - | sed 's/setenv/set -gx/g' | psub)

# Set my editors to Sublime Text 2
set -gx EDITOR "vim"
set -gx VISUAL "vim"
set -gx PAGER "most"

# Homebrew Cask options
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

# Ruby Options
set -gx RUBYOPT -r$HOME/.rubyrc.rb

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

# fisherman
for file in ~/.config/fish/conf.d/*.fish
    source $file
end

# NVM shit
if type -q nvm
  set -gx NVM_DIR ~/.nvm
  nvm >/dev/null ^/dev/null
end

# Homebrew command not found
brew command command-not-found-init > /dev/null 2>&1; and . (brew command-not-found-init)

source (which env_parallel.fish)
