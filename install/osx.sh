#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

echo -e "\\n\\nSetting OS X settings"
#==============================

#Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#show hidden files by default
# defaults write com.apple.Finder AppleShowAllFiles -bool false

#only use UTF-8 in Terminal.app
# defaults write com.apple.terminal StringEncodings -array 4

#expand save dialog by default
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

#show the ~/Library folder in Finder
chflags nohidden ~/Library

#disable resume system wide
# # defaults write NSGlobalDomainNSQuitAlwaysKeepWindows -bool false

#Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#Enable subpixel font rendering on non-Apple LCDs
# defaults write NSGlobalDomain AppleFontSmoothing -int 2

#Enable the 2D Dock
# defaults write com.apple.dock no-glass -bool true

#Disable autocorrect
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true

#Make Dock icons of hidden applications translucent
# defaults write com.apple.dock showhidden -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

#Enable iTunes track notifications in the Dock
#defaults write com.apple.dock itunes-notifications -bool true

# Disable menu bar transparency
#defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# Show remaining battery time; hide percentage
defaults write com.apple.menuextra.battery ShowPercent -bool "YES"
# defaults write com.apple.menuextra.battery ShowTime -string "YES"

#Always show scrollbars
# defaults write NSGlobalDomain AppleShowScrollBars -string "Auto"

#Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
#defaults write com.apple.finder QuitMenuItem -bool true

# Disable window animations and Get Info animations in Finder
# defaults write com.apple.finder DisableAllAnimations -bool true

#Use current directory as default search scope in Finder
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

#Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

#Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

#Disable rearranging spaces based on use
defaults write com.apple.dock mru-spaces -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

#Expand print panel by default
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

#Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

#Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
#defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

#Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

#Set a blazingly fast keyboard repeat rate
# defaults write NSGlobalDomain KeyRepeat -int 2

#Set a shorter Delay until key repeat
# defaults write NSGlobalDomain InitialKeyRepeat -int 15

#Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

#Disable opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Disable AutoFill in safari
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Update extensions automatically in safari
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Change indexing order and disable some search results
# Yosemite-specific search results (remove them if you are using macOS 10.9 or older):
#  MENU_DEFINITION
#  MENU_CONVERSION
#  MENU_EXPRESSION
#  MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
#  MENU_WEBSEARCH             (send search queries to Apple)
#  MENU_OTHER
defaults write com.apple.spotlight orderedItems -array \
   '{"enabled" = 1;"name" = "APPLICATIONS";}' \
   '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
   '{"enabled" = 0;"name" = "DIRECTORIES";}' \
   '{"enabled" = 1;"name" = "CONTACT";}' \
   '{"enabled" = 0;"name" = "PDF";}' \
   '{"enabled" = 0;"name" = "FONTS";}' \
   '{"enabled" = 0;"name" = "DOCUMENTS";}' \
   '{"enabled" = 0;"name" = "MESSAGES";}' \
   '{"enabled" = 0;"name" = "EVENT_TODO";}' \
   '{"enabled" = 0;"name" = "IMAGES";}' \
   '{"enabled" = 0;"name" = "BOOKMARKS";}' \
   '{"enabled" = 0;"name" = "MUSIC";}' \
   '{"enabled" = 0;"name" = "MOVIES";}' \
   '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
   '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
   '{"enabled" = 0;"name" = "SOURCE";}' \
   '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
   '{"enabled" = 0;"name" = "MENU_OTHER";}' \
   '{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
   '{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
   '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
   '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

# Load new settings before rebuilding the index
killall mds > /dev/null 2>&1

# Make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null

# Rebuild the index from scratch
sudo mdutil -E / > /dev/null

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

#Disable disk image verification
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

#Automatically open a new Finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

#Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Increase window resize speed for Cocoa applications
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

#Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#Show item info below desktop icons
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

#Enable snap-to-grid for desktop icons
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#Disable the warning before emptying the Trash
# defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Empty Trash securely by default
# defaults write com.apple.finder EmptyTrashSecurely -bool true

#Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

#Map bottom right Trackpad corner to right-click
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

#Disable Safari’s thumbnail cache for History and Top Sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

#Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

#Make Safari’s search banners default to Contains instead of Starts With
# defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"

#Adds a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#Only use UTF-8 in Terminal.app
#defaults write com.apple.terminal StringEncodings -array 4

#Disable the Ping sidebar in iTunes
# defaults write com.apple.iTunes disablePingSidebar -bool true



#Disable all the other Ping stuff in iTunes
# defaults write com.apple.iTunes disablePing -bool true

#Make ⌘ + F focus the search input in iTunes
# defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

# Disable send and reply animations in Mail.app
# defaults write com.apple.Mail DisableReplyAnimations -bool true
# defaults write com.apple.Mail DisableSendAnimations -bool true

# Disable Resume system-wide
# defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Finder default view
# Four-letter codes for the other view modes: `icnv` (icon), `Nlsv` (list), `Flwv` (cover flow)
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder SearchRecentsSavedViewStyle -string "clmv"

defaults write com.apple.systemuiserver menuExtras -array \
        "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
        "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
        "/System/Library/CoreServices/Menu Extras/Battery.menu" \
        "/System/Library/CoreServices/Menu Extras/Displays.menu" \
        "/System/Library/CoreServices/Menu Extras/Volume.menu"

#Disable the “reopen windows when logging back in” option
# This works, although the checkbox will still appear to be checked.
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

#Enable Dashboard dev mode (allows keeping widgets on the desktop)
# defaults write com.apple.dashboard devmode -bool true

#Reset Launchpad
[ -e ~/Library/Application\ Support/Dock/*.db ] && rm ~/Library/Application\ Support/Dock/*.db

#Kill affected applications
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
