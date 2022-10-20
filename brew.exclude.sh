#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install homebrew if it is not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo "Homebrew not installed. Attempting to install Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
	fi
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# ---------------------------------------------
# iTerm2 & ZSH
# ---------------------------------------------

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dev/dotfiles/iterm2_preferences"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Install ZSH
brew install zsh zsh-completions

# To set zsh as your default shell, execute the following for macOS High Sierra
chsh -s /bin/zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## agnoster.zsh-theme: https://github.com/agnoster/agnoster-zsh-theme
# Powerline-patched font
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# ---------------------------------------------
# Edit Mac System Preference - https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
# ---------------------------------------------
# 
# TODO:
# - [ ] Right click on trackpad
# - [ ] Tap trackpad to click
# - [ ] Enable Double-Tap to Drag - https://apple.stackexchange.com/questions/374138/how-to-enable-double-tap-to-drag-in-mac-os-x-catalina
# - [ ] Show battery percentage
# - [ ] Install iStat menus
# - [ ] CTRL + scroll to zoom
# - [ ] Display scalled - "looks like 1680 x 1050"
# - [ ] Trackpad - Tracking speed 6/10
# - [ ] Caps lock --> esc
# - [ ] code .


# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# NodeJS 
brew install node

# Python 3
brew install python


# ---------------------------------------------
# Tools I use often
# ---------------------------------------------

# Yarn - an alternative to npm
brew install yarn

# Node Version Manager - POSIX-compliant bash script to manage multiple active node.js versions
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

# thefuck - Magnificent app which corrects your previous console command.
brew install thefuck

# Rectangle - Move and resize windows on macOS with keyboard shortcuts and snap areas https://rectangleapp.com
brew install --cask rectangle
defaults write com.knollsoft.Rectangle alternateDefaultShortcuts -bool true

# watch
brew install watch

# Remove outdated versions from the cellar
brew cleanup
