if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/opt/nvim-linux-x86_64/bin" ]; then
  PATH="$PATH:/opt/nvim-linux-x86_64/bin"
fi

export PATH

VISUAL="vi"
EDITOR=$VISUAL
SUDO_EDITOR=$VISUAL
SYSTEMD_EDITOR=$VISUAL

if type nvim >/dev/null 2>&1; then
  VISUAL="nvim"
  EDITOR=$VISUAL
  SUDO_EDITOR="/opt/nvim-linux-x86_64/bin/nvim"
  SYSTEMD_EDITOR=$SUDO_EDITOR
fi

export VISUAL EDITOR SUDO_EDITOR SYSTEMD_EDITOR

export GIT_COMPLETION_SHOW_ALL=1

if [ -z "$SSH_AUTH_SOCK" ]; then
  # Check for a currently running instance of the agent
  RUNNING_AGENT="$(ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]')"
  if [ "$RUNNING_AGENT" = "0" ]; then
    # Launch a new instance of the agent
    ssh-agent -s &>$HOME/.ssh/ssh-agent
  fi
  eval "$(cat $HOME/.ssh/ssh-agent)" >/dev/null
  ssh-add $HOME/.ssh/id_ed25519 2>/dev/null
fi

[ ! -r "$HOME/.profile.local" ] || . "$HOME/.profile.local"
