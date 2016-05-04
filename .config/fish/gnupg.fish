function __refresh_gpg_agent_info -d "Re-load ~/.gpg-agent-info into environment"
  cat ~/.gnupg/.gpg-agent-info | sed 's/=/ /' | while read key value
    set -e $key
    set -U -x $key "$value"
  end
end


if test -f ~/.gnupg/.gpg-agent-info
  __refresh_gpg_agent_info
end
