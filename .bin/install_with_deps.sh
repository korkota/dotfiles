#!/bin/bash

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. "$__dir/install.sh"
. "$__dir/install_deps.sh"

echo "Dotfiles and deps have been installed."
