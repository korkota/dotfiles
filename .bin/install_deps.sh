#!/bin/bash

set -e

echo "Installing deps..."

echo "Installing NeoVim..."
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

echo "Installing ripgrep..."
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
rm ripgrep_14.1.0-1_amd64.deb

sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

sudo apt-get update

echo "Installing syncthing..."
sudo apt install -y syncthing
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

echo "Installing fzf..."
sudo apt install -y fzf

echo "Installing fd..."
sudo apt install -y fd-find

echo "Installing xclip..."
sudo apt install -y xclip

echo "Installing tmux..."
sudo apt install -y tmux

echo "Installing vim..."
sudo apt install -y vim

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins..."
vim +'PlugInstall --sync' +qa

echo "Installing keyd..."
curl -LO "https://salsa.debian.org/debian/keyd/-/jobs/7274560/artifacts/raw/debian/output/keyd_2.5.0-2+salsaci+20250318+27_amd64.deb"
sudo dpkg -i ./keyd_2.5.0-2+salsaci+20250318+27_amd64.deb
rm ./keyd_2.5.0-2+salsaci+20250318+27_amd64.deb
sudo systemctl enable keyd --now
sudo tee /etc/keyd/default.conf >/dev/null <<EOF
[ids]

*

[main]

shift = oneshot(shift)
control = oneshot(control)

leftalt = oneshot(alt)
rightalt = oneshot(altgr)

capslock = overload(control, esc)
insert = S-insert
EOF
sudo keyd.rvaiya reload

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

echo "All deps have been installed."
