# Launch a new fish shell, we pretend we're reloading configuration
alias reload 'exec fish -l'

# Use hub to wrap git. Kind of legacy at this point, but old habits die hard
if command -sq hub && type -q hub
  alias git hub
end

alias vim nvim

alias ff_duration 'ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1'
