#!/usr/bin/env bash

#Disable recents in Dock
defaults write com.apple.dock show-recents -bool false

# Move to dock left side
defaults write com.apple.Dock orientation -string left

# Make dock smaller
defaults write com.apple.dock tilesize -int 25

#Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

#Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

#Disable resizing Dock
defaults write com.apple.Dock size-immutable -bool true

#Real dock layout
dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add '' --type spacer --section apps
dockutil --no-restart --add "/System/Applications/Messages.app"
dockutil --no-restart --add "/System/Applications/FaceTime.app"
dockutil --no-restart --add "/Applications/WhatsApp.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add '' --type spacer --section apps
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add '' --type spacer --section apps
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/GitKraken.app"
dockutil --no-restart --add '' --type spacer --section apps
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add '' --type spacer --section apps
dockutil --no-restart --add "/Applications/Pages.app"
dockutil --no-restart --add "/Applications/Numbers.app"
dockutil --no-restart --add "/Applications/Keynote.app"
dockutil --no-restart --add '' --type spacer --section apps

dockutil --add '~/Downloads' --view grid --display folder --allhomes

killall Dock