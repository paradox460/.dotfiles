# Paths
set -l brew_root
switch (uname -m)
  case arm64
      set brew_root /opt/homebrew
  case x86_64
      set brew_root /usr/local
end
source (command $brew_root/bin/brew shellenv | psub)

fish_add_path -P $HOME/.bin $HOME/.dotfiles/.bin $HOME/.cargo/bin

# Set Editors
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER "less -FRX"

# Elixir Options

set -gx ERL_AFLAGS "-kernel shell_history enabled"
set -gx KERL_BUILD_DOCS yes

# ripgrep config
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc

if status is-interactive
  if command -sq fzf && type -q fzf_configure_bindings
      fzf_configure_bindings --directory=\ct
  end

  set fish_greeting (date)

  set -g fish_key_bindings fish_vi_key_bindings
end

# Direnv loads need to happen _after_ path is set
test -e /usr/local/bin/direnv ; and eval (direnv hook fish)

zoxide init fish | source

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

