# Paths
fish_add_path -P $HOME/.bin $HOME/.dotfiles/.bin $HOME/.cargo/bin

# Completion paths (homebrew fix)
set fish_complete_path ~/.config/fish/completions/ \
  /usr/local/share/fish/completions/ \
  /usr/local/share/fish/vendor_completions.d/ \
  $fish_complete_path

# Lang Settings
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8


# Set my editors to Sublime Text 2
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx PAGER "most"

# Homebrew Cask options
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

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

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fzf_z'          # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

# Up
alias u='fzf_up'

# CDHist
alias cdh='fzf_cdhist'

# Nvim all the time
alias vim='nvim'

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
  abbr --add gu "hub sync"

  # Ruby
  abbr --add b "bundle"
  abbr --add bx "bundle exec"
  abbr --add rk "rake"
  abbr --add rb "ruby"
  abbr --add bxr "bundle exec rake"

  # Github Slack Spammer
  abbr --add ghss "github_slack_spammer"
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
test -e /usr/local/bin/env_parallel.fish ; and source (which env_parallel.fish)
