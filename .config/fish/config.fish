# Paths
set -gx PATH $HOME/.bin \
  $PATH

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
set -gx EDITOR "vim"
set -gx VISUAL "vim"
set -gx PAGER "most"

# Homebrew Cask options
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

# Ruby Options
set -gx RUBYOPT -r$HOME/.rubyrc.rb

# Elixir Options
set -gx ERL_AFLAGS "-kernel shell_history enabled"

if command -sq fzf
  # Utilities
  set -l dirpreview "--preview 'tree --dirsfirst -C {} | head -200'"

  # FZF Config
  set -gx FZF_DEFAULT_OPTS "--height 40% --reverse --border --multi --cycle --inline-info"
  # Options for history mode
  set -gx FZF_CTRL_R_OPTS "--no-multi --prompt='history> ' --preview 'echo {}' --preview-window='down:3:wrap'"
  # Options for CD mode
  set -gx FZF_ALT_C_OPTS "--no-multi --select-1 --exit-0 --prompt='cd> ' $dirpreview"
  # Options for file mode
  set -gx FZF_CTRL_T_OPTS "--prompt='file> ' --select-1 --exit-0 --preview 'if test -e {}; begin; highlight -O ansi -l {} ^/dev/null; or cat {}; or tree --dirsfirst -C {}; end ^/dev/null | head -200;end'"
  # Options for Z mode
  set -gx FZF_Z_OPTS $dirpreview
end

# ripgrep config
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc

test -e ~/.go; and set -gx GOPATH ~/.go

test -e ~/.go/bin; and set -gx PATH $PATH $GOPATH/bin

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

# fisherman
for file in ~/.config/fish/conf.d/*.fish
    source $file
end

# Homebrew command not found
# brew command command-not-found-init > /dev/null 2>&1; and source (brew command-not-found-init)

# Direnv
test -e /usr/local/bin/direnv ; and eval (direnv hook fish)

# env_parallel for gnu parallel
test -e /usr/local/bin/env_parallel.fish ; and source (which env_parallel.fish)
