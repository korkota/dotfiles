#!/bin/bash

set -e

echo "Installing deps..."

sudo pacman -Syuq --noconfirm alacritty base-devel bash-completion chromium curl fd fzf git gnome gnome-tweaks keyd lazydocker lazygit \
  less lua-jsregexp man man-db neovim networkmanager nvm obsidian openssh ripgrep sudo syncthing tldr \
  tmux trash-cli tree-sitter-cli ttf-jetbrains-mono-nerd virtualbox-guest-utils vlc xclip zip

curl -Lks https://raw.githubusercontent.com/korkota/dotfiles/main/.bin/install.sh | /bin/bash
source "$HOME/.profile"

echo "Enabling syncthing..."
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

echo "Enabling keyd..."
sudo systemctl enable keyd --now
sudo tee /etc/keyd/default.conf >/dev/null <<EOF
[ids]
*
[main]
capslock = overload(control, esc)
EOF
sudo usermod -aG keyd "$(whoami)"
mkdir -p ~/.local/share/gnome-shell/extensions
ln -s /usr/share/keyd/gnome-extension-45 ~/.local/share/gnome-shell/extensions/keyd\@keyd.rvaiya.github.com

echo "Installing compilation for tmux..."
dir="${BASH_COMPLETION_DIR:-"${XDG_DATA_HOME:-"$HOME/.local/share"}/bash-completion"}/completions"
mkdir -p "$dir"
curl -fSsL "https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux" >"${dir?error: dir not set: you must run the previous commands first}/tmux"

echo "Installing the alacritty's tty config..."
curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x -

echo "Installing complete_alias..."
curl -Lo "$HOME/.complete_alias" https://raw.githubusercontent.com/cykerway/complete-alias/refs/heads/master/complete_alias

echo "Installing the sudoers config..."
sudo tee /etc/sudoers.d/custom >/dev/null <<EOF
Defaults timestamp_type=global,timestamp_timeout=240
Defaults:%sudo env_keep += "VISUAL EDITOR"
EOF

echo "Installing the GNOME Bedtime extension..."
curl -LO https://github.com/ionutbortis/gnome-bedtime-mode/releases/download/v23.0/gnome-bedtime-mode_23.0.zip
gnome-extensions install --force gnome-bedtime-mode_23.0.zip
rm gnome-bedtime-mode_23.0.zip

echo "Installing node..."
# shellcheck source=/dev/null
. /usr/share/nvm/init-nvm.sh
nvm install node

echo "Adding the layout switch shortkey..."
sudo localectl set-x11-keymap us,ru "" "" grp:alt_shift_toggle
# dconf write /org/gnome/desktop/wm/keybindings/switch-input-source-backward "['<Shift>Alt_L']"
# dconf write /org/gnome/desktop/wm/keybindings/switch-input-source "['<Alt>Shift_L']"

echo "Enabling gdm..."
sudo systemctl enable gdm.service

echo "Installing paru..."
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
paru --gendb

echo "Installing g3kb-switch..."
paru --noconfirm --useask -S g3kb-switch

echo "Installing lscolors..."
paru --noconfirm --useask -S lscolors

echo "Installing .postinstall.sh..."
tee "$HOME/.postinstall.sh" >/dev/null <<EOF
#!/bin/bash
gsettings set org.gnome.shell disable-extension-version-validation true

gnome-extensions enable keyd@keyd.rvaiya.github.com
gnome-extensions enable gnomebedtime@ionutbortis.gmail.com
gnome-extensions enable g3kb-switch@g3kb-switch.org
EOF

echo "Generating ssh keys..."
ssh-keygen -t ed25519
