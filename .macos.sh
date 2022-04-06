#!/usr/bin/env bash

echo "Updating MacOS System Preferences"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
echo "Closing System Preferences"
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Updating General settings"
###############################################################################
# General                                                                     #
###############################################################################

	# Enable Dark mode
	defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

	# Set accent color to Graphite
	defaults write NSGlobalDomain AppleAquaColorVariant -int 6

	# Set highlight color to Green
	defaults write NSGlobalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431"

	# Set sidebar icon size to medium
	defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

	# Always show the menu bar
	defaults write NSGlobalDomain _HIHideMenuBar -bool false

	# Automatically show scroll bar based on mouse or trackpad
	defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"
	# Possible values: `WhenScrolling`, `Automatic` and `Always`

	# Click in the scroll bar: Jump to the next page
	defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 0

	# Ask to keep changes when closing documents
	defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true

	# Close windows when quitting an app
	defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

	# Enable font smoothing when available
	defaults write -g CGFontRenderingFontSmoothingDisabled -bool false

	# Disable Sound Effects on Boot
	sudo nvram SystemAudioVolume=" "

echo "Updating Dock settings"
###############################################################################
# Dock                                                                        #
###############################################################################

	# Set dock size to 43
	defaults write com.apple.dock tilesize -int 64

	# Enable magnification effect
	defaults write com.apple.dock magnification -bool false

	# Set magnification dock size to 48
	defaults write com.apple.dock largesize -int 128

	# Set Dock to appear on the bottom
	defaults write com.apple.dock orientation -string "right"

	# Minimize windows using Genie effect
	defaults write com.apple.dock mineffect -string "genie"

	# Prefer tabs when opening documents in Full Screen Only
	#defaults write com.apple.dock windowtabbing -string "fullscreen"
	# Possible values: manual, always, fullscreen

	# Double clicking a window's title bar results in zoom
	#defaults write com.apple.dock dblclickbehavior -string "maximize"
	# Possible values: minimize, maximize, none

	# Disable minimizing windows into application icon
	defaults write com.apple.dock minimize-to-application -bool false

	# Animate opening applications
	defaults write com.apple.dock launchanim -bool true

	# Automatically hide and show the Dock
	defaults write com.apple.dock autohide -bool true

	# Show indicators for open applications
	defaults write com.apple.dock show-process-indicators -bool true

	# Don't show recent applications in Dock
	defaults write com.apple.dock show-recents -bool false

	killall Dock

echo "Updating Mission Control settings"
###############################################################################
# Mission Control                                                             #
###############################################################################

	# Disable automatically rearrange Spaces based on most recent use
	defaults write com.apple.dock mru-spaces -bool false

	#	When switching to an application, switch to a Space with open windows for the application
	defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool true

	# Do not group windows by application
	defaults write com.apple.dock expose-group-apps -bool false

	# Displays have seperate Spaces
	defaults write com.apple.spaces spans-displays -bool true

	# Set "Mission Control" shortcut to ^ + up-arrow
	defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add  32 "{enabled = 1; value = { parameters = (65535, 126, 8650752); type = standard; }; }"

	# Set "Applications Window" shortcut to ^ + down-arrow
	defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add  34 "{enabled = 1; value = { parameters = (65535, 126, 8781824); type = standard; }; }"

	# Reset Launchpad
	find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

	# Hot corners
	#  0 : NOP
	#  2 : Mission Control
	#  3 : Show application windows
	#  4 : Desktop
	#  5 : Start screen saver
	#  6 : Disable screen saver
	#  7 : Dashboard
	# 10 : Put display to sleep
	# 11 : Launchpad
	# 12 : Notification Center
	# Top left screen corner
	defaults write com.apple.dock wvous-tl-corner   -int 0
	defaults write com.apple.dock wvous-tl-modifier -int 0
	# Top right screen corner
	defaults write com.apple.dock wvous-tr-corner   -int 2
	defaults write com.apple.dock wvous-tr-modifier -int 0
	# Bottom left screen corner (Put display to sleep)
	defaults write com.apple.dock wvous-bl-corner   -int 10
	defaults write com.apple.dock wvous-bl-modifier -int 0
	# Bottom right screen corner (Start screen saver)
	defaults write com.apple.dock wvous-br-corner   -int 3
	defaults write com.apple.dock wvous-br-modifier -int 0

echo "Updating Siri settings"
###############################################################################
# Siri                                                                        #
###############################################################################

	# Disable Siri
  defaults write com.apple.assistant.support "Assistant Enabled" -bool false

	# Keybord shortcut
	# 0 : Off
	# 2 : Hold Command Space
	# 3 : Hold Option Space
	# 4 : Press Fn (Function) Space
	# 7 : Customize
	defaults write com.apple.Siri HotkeyTag -int 2

	# Do not show Siri in menu bar
	defaults write com.apple.systemuiserver "NSStatusItem Visible Siri" -bool false

echo "Updating Locale settings"
###############################################################################
# Locale                                                                      #
###############################################################################

	# Use English and Russian languagues, in this particular order
	defaults write NSGlobalDomain AppleLanguages -array en-US

	# Use 24-hour time format
	defaults write NSGlobalDomain AppleICUForce24HourTime -bool false

echo "Updating Notification settings"
###############################################################################
# Notifications                                                               #
###############################################################################

	# Notification banner on screen time, default: 5 seconds
	defaults write com.apple.notificationcenterui bannerTime 3

echo "Updating Accessibility settings"
###############################################################################
# Accessibility                                                                #
###############################################################################

	# Shake mouse cursor to locate
	defaults write CGDisableCursorLocationMagnification -bool true

echo "Updating Security & Privacy settings"
###############################################################################
# Security & Privacy                                                                #
###############################################################################

	# Require password immediately after sleep or screen saver begins
	defaults write com.apple.screensaver askForPassword -bool true
	defaults write com.apple.screensaver askForPasswordDelay -int 0

	# Disable the "Are you sure you want to open this application?" dialog
	defaults write com.apple.LaunchServices LSQuarantine -bool false

	# Turn on Firewall
	sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

	# Allow signed apps
	sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool true

	# Firewall logging
	sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -bool false

	# Stealth mode
	sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

echo "Updating Bluetooth settings"
###############################################################################
# Bluetooth                                                                   #
###############################################################################

	# Show Bluetooth in menu bar
	defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -bool true

echo "Updating Keyboard settings"
###############################################################################
# Keyboard                                                                    #
###############################################################################

	# Enable auto-correct
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true

	# Set delay before key repeat to 15
	defaults write NSGlobalDomain InitialKeyRepeat -int 15

	# Set key repeat to 1
	defaults write NSGlobalDomain KeyRepeat -int 2

	# Automatically capitalize words
	defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

	# Use smart dashes
	defaults write NSGlobalDomain NSAutomaticDashSubstituitonEnabled -bool true

	# Use smart quotes
	defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool true

	# Add period with double space
	defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true

	# Disable spell check
	defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

echo "Updating Trackpad settings"
###############################################################################
# Trackpad                                                                    #
###############################################################################

	# Trackpad: enable tap to click for this user and for the login screen
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

	# Trackpad: map bottom right corner to right-click
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
	defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
	defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

	# Haptic feedback (0: light, 1: medium, 2: firm)
	defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
	defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

	# Set tracking speed
	defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

	# Force Click and haptic feedback
	defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool false
	defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
	defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool true

	# Disable “natural” scrolling
	defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

echo "Updating Mouse settings"
###############################################################################
# Mouse                                                                       #
###############################################################################

	# Disable natural scroll
	defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

	# Set tracking speed
	defaults write NSGlobalDomain com.apple.mouse.scaling -float 3

	# Set scrolling speed
	defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0.75

	# Set double click speed
	defaults write NSGlobalDomain com.apple.mouse.doubleClickThreshold -float 0.5

echo "Updating Date & Time settings"
###############################################################################
# Date & Time                                                                 #
###############################################################################

	# Set the timezone automatically
	sudo systemsetup -setusingnetworktime on > /dev/null

	# Set time server
	# sudo systemsetup -setnetworktimeserver "time.apple.com" > /dev/null

	# Set time zome automatically using current location
	sudo defaults write /Library/Preferences/com.apple.timezone.auto.plist Active -bool true

	# Use Digital clock in menu bar
	defaults write com.apple.menuextra.clock IsAnalog -bool false

	# Disable flashing the time separators
	defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

	# Display date time as Dec 28 9:32
	sudo defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  j:mm a"

	sudo killall SystemUIServer

echo "Updating Misc settings"
###############################################################################
# Misc.                                                                       #
###############################################################################

	# Show hidden files by default
	#defaults write com.apple.finder AppleShowAllFiles -bool true

	# Display full POXIS path as Finder window title
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true