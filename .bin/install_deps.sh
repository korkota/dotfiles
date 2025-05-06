#!/bin/bash

set -e

echo "Installing deps..."

sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

sudo add-apt-repository ppa:keyd-team/ppa

sudo apt update

sudo apt install -y build-essential

echo "Installing NeoVim..."
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

echo "Installing ripgrep..."
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
rm ripgrep_14.1.0-1_amd64.deb

echo "Installing syncthing..."
sudo apt install -y syncthing
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

echo "Installing fzf..."
sudo apt install -y fzf

echo "Installing fd..."
curl -LO https://github.com/sharkdp/fd/releases/download/v10.2.0/fd_10.2.0_amd64.deb
sudo dpkg -i fd_10.2.0_amd64.deb
rm fd_10.2.0_amd64.deb

echo "Installing xclip..."
sudo apt install -y xclip

echo "Installing tmux..."
sudo apt install -y tmux
dir="${BASH_COMPLETION_DIR:-"${XDG_DATA_HOME:-"$HOME/.local/share"}/bash-completion"}/completions"
mkdir -p "$dir"
curl -fSsL "https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux" >"${dir?error: dir not set: you must run the previous commands first}/tmux"

echo "Installing keyd..."
sudo apt install -y keyd keyd-application-mapper
sudo systemctl enable keyd --now
sudo tee /etc/keyd/default.conf >/dev/null <<EOF
[ids]

*

[main]

capslock = overload(control, esc)
EOF
sudo ln -s /usr/bin/keyd.rvaiya /usr/bin/keyd
sudo keyd reload
sudo usermod -aG keyd "$(whoami)"
mkdir -p ~/.local/share/gnome-shell/extensions
ln -s /usr/share/keyd/gnome-extension-45 ~/.local/share/gnome-shell/extensions/keyd
# run after reboot
# gnome-extensions enable keyd

echo "Installing lazygit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" |
  grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz \
  "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit lazygit.tar.gz

echo "Installing lazydocker..."
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

echo "Installing alacritty..."
sudo snap install alacritty --classic
curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x -

echo "Installing LS_COLORS..."
mkdir /tmp/LS_COLORS && curl -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master | tar xzf - --directory=/tmp/LS_COLORS --strip=1
(cd /tmp/LS_COLORS && make install)

echo "Installing complete_alias..."
curl -Lo "$HOME/.complete_alias" https://raw.githubusercontent.com/cykerway/complete-alias/refs/heads/master/complete_alias

echo "Installing JetBrainsMono Nerd Font..."
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
[ -d "$HOME/.fonts" ] || mkdir "$HOME/.fonts"
tar xf JetBrainsMono.tar.xz -C "$HOME/.fonts"
rm JetBrainsMono.tar.xz

echo "Installing the sudoers config..."
sudo tee /etc/sudoers.d/custom >/dev/null <<EOF
Defaults timestamp_type=global,timestamp_timeout=240
Defaults:%sudo env_keep += "VISUAL EDITOR"
EOF

echo "Installing the trash-cli..."
sudo apt install -y trash-cli

echo "Installing the tldr..."
sudo apt install -y tldr

echo "Installing the gnome-tweaks..."
sudo apt install -y gnome-tweaks

echo "Installing the g3kb-switch..."
curl -LO https://github.com/lyokha/g3kb-switch/releases/download/1.5/g3kb-switch-1.5-Linux.deb
sudo dpkg -i g3kb-switch-1.5-Linux.deb
rm g3kb-switch-1.5-Linux.deb
# run after reboot
# gnome-extensions enable g3kb-switch@g3kb-switch.org

echo "Installing the GNOME Bedtime extension..."
curl -LO https://github.com/ionutbortis/gnome-bedtime-mode/releases/download/v22.0/gnome-bedtime-mode_22.0.zip
gnome-extensions install --force gnome-bedtime-mode_22.0.zip
rm gnome-bedtime-mode_22.0.zip
# run after reboot
# gnome-extensions enable gnomebedtime@ionutbortis.gmail.com

echo "Installing the extension manager..."
sudo apt install -y gnome-shell-extension-manager

echo "Installing the nvm..."
mkdir "$NVM_DIR"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | PROFILE=/dev/null bash
# shellcheck source=/dev/null
. "$NVM_DIR/nvm.sh"
nvm install node

echo "Installing the Obsidian..."
sudo snap install obsidian --classic

echo "All deps have been installed."
