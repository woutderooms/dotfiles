#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Mac config"
source install/osx.sh

echo "Done. Reload your terminal."
