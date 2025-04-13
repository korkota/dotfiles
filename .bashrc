HISTCONTROL=ignoredups
shopt -s histappend
HISTSIZE=-1
HISTFILESIZE=-1

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f ~/.bash_aliases ]; then
  . "$HOME/.bash_aliases"
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [ -f ~/.git-prompt.sh ]; then
  source "$HOME/.git-prompt.sh"
  GIT_PS1_SHOWDIRTYSTATE=yes
  GIT_PS1_SHOWUNTRACKEDFILES=yes
  GIT_PS1_SHOWUPSTREAM=auto
  GIT_PS1_SHOWCONFLICTSTATE=yes
  GIT_PS1_SHOWCOLORHINTS=yes
  case "$TERM" in
  xterm-color | *-256color) GIT_PS1_SHOWCOLORHINTS=yes ;;
  esac
  PROMPT_DIRTRIM=3
  get_return_code_sign() {
    if [ $? == 0 ]; then echo \$; else echo X; fi
  }
  PROMPT_COMMAND='__git_ps1 "\W" " $(get_return_code_sign) "'
fi

if [ -e "$HOME/.local/share/lscolors.sh" ]; then
  source "$HOME/.local/share/lscolors.sh"

  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

set -o vi

paste_from_clipboard() {
  local shift=$1

  local head=${READLINE_LINE:0:READLINE_POINT+shift}
  local tail=${READLINE_LINE:READLINE_POINT+shift}

  local paste
  paste=$(xclip -out -selection clipboard)
  local paste_len=${#paste}

  READLINE_LINE=${head}${paste}${tail}
  let READLINE_POINT+=$paste_len+$shift-1
}

yank_line_to_clipboard() {
  echo $READLINE_LINE | xclip -in -selection clipboard
}

kill_line_to_clipboard() {
  yank_line_to_clipboard
  READLINE_LINE=""
}

bind -m vi-command -x '"P": paste_from_clipboard 0'
bind -m vi-command -x '"p": paste_from_clipboard 1'
bind -m vi-command -x '"yy": yank_line_to_clipboard'
bind -m vi-command -x '"dd": kill_line_to_clipboard'

# shellcheck disable=SC1090
source <(minikube completion bash 2>/dev/null)
# shellcheck disable=SC1090
source <(kubectl completion bash 2>/dev/null)
# shellcheck disable=SC1090
source <(npm completion 2>/dev/null)

[ ! -r "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"
