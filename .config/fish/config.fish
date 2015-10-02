# If you don't want to run the head version of rbenv, uncomment this line
# set paradox_old_rbenv true

fish_vi_mode

# Fish colors and escape codes
set fish_color_autosuggestion 808080
set fish_color_command green\x1e--bold
set fish_color_cwd yellow
set fish_color_cwd_root red\x1e--bold
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

# Paths
set PATH $HOME/.bin \
  $HOME/.rbenv/bin \
  $PATH
if set -q paradox_old_rbenv
  set PATH $HOME/.rbenv/shims $PATH
end

if not set -q paradox_old_rbenv
  # Use rbenv's native fish support
  # NOTE: This is only in HEAD of rbenv as of this date (2014/09/02)
  . (rbenv init -|psub)
end

# Set my editors to Sublime Text 2
setenv EDITOR "atom -w"
setenv VISUAL "atom -w"
setenv PAGER "most"

# Homebrew Cask options
setenv HOMEBREW_CASK_OPTS "--appdir=/Applications"

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
# Doesn't really reload, more of launches a new shell, but the results the same
alias reload 'exec fish -l'
# Git
# Hub is a useful tool that provides github integration. If you don't use it, I recommend deleting these lines
alias git hub
abbr g="git"
abbr gst="git status"
abbr gcm="git commit -m"

# Ruby
abbr b="bundle"
abbr bx="bundle exec"
abbr rk="rake"
abbr rb="ruby"

# Run something in the latest version of ruby
alias rbl "env RBENV_VERSION=latest "

################################################################################
# Prompt methods
################################################################################

function command_separator -e fish_postexec
  set -l last_status $status
  if test $last_status -ne 0
    set paradox_status_color (set_color red)
    set paradox_status_string "┫$last_status┣"
    set paradox_status_string_width (echo $paradox_status_string | command wc -m ^/dev/null)
    set paradox_status_left_width (math \($COLUMNS /2 \) - $paradox_status_string_width)
    set paradox_status_right_width (math $COLUMNS - \($paradox_status_left_width + $paradox_status_string_width - 1\))
    echo -s $paradox_status_color (jot -b '━' -s "" $paradox_status_left_width ^/dev/null) $paradox_status_string (jot -b '━' -s "" $paradox_status_right_width ^/dev/null)
  else
    set paradox_status_color (set_color green)
    echo -s $paradox_status_color (jot -b '━' -s "" $COLUMNS ^/dev/null)
  end
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

source ~/Developer/zendesk/docker-images/dockmaster/zdi.fish
