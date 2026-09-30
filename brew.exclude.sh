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

# iTerm2 itself
brew install --cask iterm2

# Prompt: Starship (replaced oh-my-zsh agnoster + Powerline fonts in 09/2026).
# Config is starship.toml in this repo, linked to ~/.config/starship.toml by bootstrap.exclude.sh.
brew install starship

# Font: JetBrains Mono Nerd Font (has the arrow and branch glyphs the prompt uses).
# The iTerm prefs in iterm2_preferences/ already select it at 14 pt.
brew install --cask font-jetbrains-mono-nerd-font

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

# Claude Code - native installer, lands in ~/.local/bin
curl -fsSL https://claude.ai/install.sh | bash

# thefuck - Magnificent app which corrects your previous console command.
brew install thefuck

# Rectangle - Move and resize windows on macOS with keyboard shortcuts and snap areas https://rectangleapp.com
brew install --cask rectangle
defaults write com.knollsoft.Rectangle alternateDefaultShortcuts -bool true

# watch
brew install watch

# Remove outdated versions from the cellar
brew cleanup
