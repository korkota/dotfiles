#!/bin/bash

echo "Installing Dotfiles..."

git clone --bare https://github.com/korkota/dotfiles.git "$HOME/.cfg"
function config {
  /usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
}
cd "$HOME" || exit 1
mkdir -p .config-backup
if config checkout; then
  echo "Checked out config."
else
  echo "Backing up pre-existing dot files."
  config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi
curl -o "$HOME/.git-prompt.sh" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
config checkout
config config status.showUntrackedFiles no

echo "Dotfiles has been installed."
