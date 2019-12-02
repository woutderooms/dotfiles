#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Brew + apps"
source install/brew.sh

echo "Mac config"
source install/osx.sh

echo "Dock config"
source install/dock.sh

echo "Oh My Zsh"
source install/ohMyZsh.sh

echo "Setup projects folders"
source install/projects.sh

echo "VS Code settings"
source install/vscode.sh

echo "Symlinking"
source link.sh

echo "Done. Reload your terminal."
