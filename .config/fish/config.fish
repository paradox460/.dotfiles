# If you don't want to run the head version of rbenv, uncomment this line
# set paradox_old_rbenv true

# Fish colors and escape codes
set fish_color_autosuggestion 808080
set fish_color_command green\x1e--bold
set fish_color_cwd yellow
set fish_color_cwd_root yellow\x1e--bold
set fish_color_normal white
set fish_color_param blue\x1e--bold
set fish_color_quote cyan\x1e--bold
set fish_color_search_match magenta
set fish_color_valid_path magenta\x1e--underline

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

# Actually bind the keys mentioned above
function fish_user_key_bindings
  bind \es prepend_sudo
  bind \ex prepend_bundle_exec
  bind \eg prepend_git
end
# Paths
# While you can use a single fish array to do this (space-separated list), this is easier to read
set PATH /usr/local/bin /usr/local/sbin $PATH
if set -q paradox_old_rbenv
  set PATH $HOME/.rbenv/shims $PATH
end
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.bin $PATH

if not set -q paradox_old_rbenv
  # Use rbenv's native fish support
  # NOTE: This is only in HEAD of rbenv as of this date (2014/09/02)
  . (rbenv init -|psub)
end

# Set my editors to Sublime Text 2
setenv EDITOR "atom -w"
setenv VISUAL "atom -w"
setenv PAGER "most"

# Git prompt options
set -g __fish_git_prompt_showstashstate true
set -g __fish_git_prompt_show_informative_status true
set -g __fish_git_prompt_showcolorhints true

# Set some individual git colors
set -g __fish_git_prompt_color_suffix yellow

set -g __fish_git_prompt_color_upstream_ahead red
set -g __fish_git_prompt_color_upstream_behind violet
set -g __fish_git_prompt_color_cleanstate green --bold

# Alias zone
# Rehash fish configs quickly
alias reload '. ~/.config/fish/config.fish'
# Git
# Hub is a useful tool that provides github integration. If you don't use it, I recommend deleting these lines
alias git hub
alias g hub
alias gst "git status"

# Ruby
alias b "bundle"
alias bx "bundle exec"
alias rk "rake"
alias rb "ruby"

# Prompt function
function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q -g __fish_classic_git_functions_defined
    set -g __fish_classic_git_functions_defined

    function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
      if status --is-interactive
        set -e __fish_prompt_user
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
      if status --is-interactive
        set -e __fish_prompt_host
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
      if status --is-interactive
        set -e __fish_prompt_status
        commandline -f repaint ^/dev/null
      end
    end
  end

  # Get the current Git commit hash
  function __paradox_git_hash --description "Get the current git commit hash, if we're in a git working tree"
    set -l git_info (command git rev-parse --is-inside-work-tree --short HEAD ^/dev/null)
    if test (count $git_info) -gt 1
      set -l inside_worktree $git_info[1]
      set -l git_head $git_info[2]
      if test "true" = "$inside_worktree"
        echo -s "[$git_head]"
      end
    end
  end

  function __paradox_command_duration --description "Get the current command duration"
    if set -q CMD_DURATION
      echo -s "[⌛️ $CMD_DURATION]"
    end
  end

  switch $USER

  case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end
    if not set -q __fish_prompt_delim
      set -g __fish_prompt_delim '❗ $ '
    end

  case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    if not set -q __fish_prompt_delim
      set -g __fish_prompt_delim '🍩 $ '
    end

  end

  set -l prompt_status
  if test $last_status -ne 0
    if not set -q __fish_prompt_status
      set -g __fish_prompt_status (set_color $fish_color_status)
    end
    set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
  end

  if not set -q __fish_prompt_user
    set -g __fish_prompt_user (set_color $fish_color_user)
  end
  if not set -q __fish_prompt_host
    set -g __fish_prompt_host (set_color $fish_color_host)
  end
  if not set -q __fish_prompt_splitter
    set -g __fish_prompt_splitter (set_color $fish_color_splitter)
  end

  set -l __fish_prompt_command_count "$__fish_command_count"

  # Separator
  set -l prompt_separator_color
  if test $last_status -ne 0
    set prompt_separator_color (set_color red)
  else
    set prompt_separator_color (set_color green)
  end
  set -l prompt_separator_width (math $COLUMNS - 1)
  if set -q __fish_prompt
    set -l prompt_separator_characters (command jot -b "━" -s "" $prompt_separator_width ^/dev/null)
    echo -s "$prompt_separator_color" "$prompt_separator_characters"
  end
  echo -s "$__fish_prompt_user" "$USER" "$__fish_prompt_splitter" @ "$__fish_prompt_host" "$__fish_prompt_hostname" "$__fish_prompt_normal" ' ' "$__fish_prompt_cwd" (prompt_pwd) (__fish_git_prompt) (set_color blue) (__paradox_git_hash) "$__fish_prompt_normal" "$prompt_status"
  echo -s "$__fish_prompt_delim"
  set -g __fish_prompt 1
end

# initialize our new variables
# in theory this would be in a fish_prompt event, but this file isn't sourced
# until the fish_prompt function is called anyway.
if not set -q __prompt_initialized_2
  set -U fish_color_user blue
  set -U fish_color_host green
  set -U fish_color_status red
  set -U fish_color_splitter red
  set -U __prompt_initialized_2
end

# Right-hand prompt
function fish_right_prompt
  set -l date (command date +%I:%M:%S%P ^/dev/null)
  set -l rb_version (command ruby -e 'print RUBY_VERSION' ^/dev/null)
  echo -s (set_color blue) "(💎  $rb_version)" (set_color green) (__paradox_command_duration) (set_color normal) "[$date]"
end
