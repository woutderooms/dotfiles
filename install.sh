#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Mac config"
source install/osx.sh

echo "Brew + apps"
source install/brew.sh

echo "Done. Reload your terminal."