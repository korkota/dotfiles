if [ -z "$VISUAL" ]; then
  type nvim >/dev/null 2>&1 && VISUAL=lazyvim || VISUAL=vi
fi
EDITOR=$VISUAL
export VISUAL EDITOR

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

if [ -z "$SSH_AUTH_SOCK" ]; then
  # Check for a currently running instance of the agent
  RUNNING_AGENT="$(ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]')"
  if [ "$RUNNING_AGENT" = "0" ]; then
    # Launch a new instance of the agent
    ssh-agent -s &>$HOME/.ssh/ssh-agent
  fi
  eval $(cat $HOME/.ssh/ssh-agent) >/dev/null
  ssh-add $HOME/.ssh/id_ed25519 2>/dev/null
fi

[ ! -r "$HOME/.profile.local" ] || . "$HOME/.profile.local"
