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

VISUAL="vi"
if type nvim >/dev/null 2>&1; then
  VISUAL="/usr/bin/nvim"
fi
EDITOR=$VISUAL

export VISUAL EDITOR
export LESS='-R'
export GIT_COMPLETION_SHOW_ALL=1
export NVM_DIR="$HOME/.nvm"

[ ! -r "$HOME/.profile.local" ] || . "$HOME/.profile.local"

unset -f path_append
unset -f path_prepend
