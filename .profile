path_prepend() {
  for arg in "$@"; do
    if [[ ":${PATH}:" != *":${arg}:"* ]]; then
      export PATH="${arg}${PATH:+":$PATH"}"
    fi
  done
}

path_append() {
  for arg in "$@"; do
    if [[ ":${PATH}:" != *":${arg}:"* ]]; then
      export PATH="${PATH:+"$PATH:"}${arg}"
    fi
  done
}

if [ -d "$HOME/bin" ]; then
  path_prepend "$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ]; then
  path_prepend "$HOME/.local/bin"
fi

if [ -d "/opt/nvim-linux-x86_64/bin" ]; then
  path_append "/opt/nvim-linux-x86_64/bin"
fi

VISUAL="vi"
if type nvim >/dev/null 2>&1; then
  VISUAL="/opt/nvim-linux-x86_64/bin/nvim"
fi
EDITOR=$VISUAL

export VISUAL EDITOR
export LESS='-R'
export GIT_COMPLETION_SHOW_ALL=1
export NVM_DIR="$HOME/.nvm"

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

unset -f path_append
unset -f path_prepend
