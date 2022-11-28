# Paths
set -l brew_root
switch (uname -m)
  case "arm64"
    set brew_root /opt/homebrew
  case "x86_64"
    set brew_root /usr/local
end

source (command $brew_root/bin/brew shellenv | psub)

fish_add_path -P $HOME/.bin $HOME/.dotfiles/.bin $HOME/.cargo/bin

# Lang Settings
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Set my editors
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx PAGER "less -FRX"

# Elixir Options
set -gx ERL_AFLAGS "-kernel shell_history enabled"

if command -sq fzf && type -q fzf_configure_bindings
  fzf_configure_bindings --directory=\ct
end

# ripgrep config
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc

# Rust config
# Don't need docs, I have dash
set -gx RUST_WITHOUT rust-docs

# Alias zone
# Doesn't really reload, more of launches a new shell, but the results the same
alias reload 'exec fish -l'
# Git
# Hub is a useful tool that provides github integration. If you don't use it, I recommend deleting these lines
alias git hub

# Up
alias u='fzf_up'

# CDHist
alias cdh='fzf_cdhist'

# Nvim all the time
alias vim='nvim'


# Get duration of file via ffprobe
alias ff_duration='ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1'

# Fundle fish plugin manager
test -e ~/.config/fish/fundle_config.fish ; and source ~/.config/fish/fundle_config.fish

# Interactive mode settings
# Specifically, anything you might not need in scripting should be put here.
if status --is-interactive
  # Greeting on new terminal
  set fish_greeting (date)

  set -g fish_key_bindings paradox_binding

  abbr --add g "git"
  abbr --add gst "git status"
  abbr --add gcm "git commit -m"
  abbr --add gc "git checkout"
  abbr --add gcb "git checkout -b"
  abbr --add gu "gh repo sync"
end

# iTerm 2 fish integration
test -e ~/.iterm2_shell_integration.fish ; and source ~/.iterm2_shell_integration.fish

# GPG stuff
test -e ~/.config/fish/gnupg.fish ; and source ~/.config/fish/gnupg.fish

# asdf
test -e ~/.asdf/asdf.fish ; and source ~/.asdf/asdf.fish

# Homebrew command not found
# brew command command-not-found-init > /dev/null 2>&1; and source (brew command-not-found-init)

# Direnv
test -e /usr/local/bin/direnv ; and eval (direnv hook fish)

# env_parallel for gnu parallel
# Disabling temporarily because it seems broken right now
# test -e /usr/local/bin/env_parallel.fish ; and source (which env_parallel.fish)


set -gx BASE16_THEME_DEFAULT "tomorrow-night"
# Base16 Shell
if status --is-interactive
  set BASE16_SHELL_PATH "$HOME/.config/base16-shell"
  if test -s "$BASE16_SHELL_PATH"
    source "$BASE16_SHELL_PATH/profile_helper.fish"
  end
end

# Zoxide
zoxide init fish | source
