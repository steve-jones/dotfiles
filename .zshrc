# Set machine username
USER=`whoami`

### End Steve stuff ###


# Add the portal script to your path. To make this permanent, add it into your .bashrc or .zshrc:
eval $(Users/steve/dev/ci/deploy/portal env 2> /dev/null)

### End SimSpace Stuff ###


### ZSH STUFF ###

# Set default zsh user so it's hidden when user is steve
DEFAULT_USER=$USER
#####################################################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Plugins (More Info): https://github.com/robbyrussell/oh-my-zsh#plugins

source $ZSH/oh-my-zsh.sh
# ghc for Haskell 
# source /Users/steve/.ghcup/env

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
### Alias ###
alias o="open ."
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias reset-bluetooth="echo 'sudo rm -R /Library/Preferences/com.apple.Bluetooth.plist'"
alias yarnstartnocat="unset WDS_HOST && yarn start:modern:hmr"
alias sshit="ssh -i ~/.ssh/simadmin.pem -p 6000 -L 9050:localhost:9050 simadmin@qa-portal"
alias git-delete-all-branches='git branch | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias zshconfig="vim ~/.zshrc"
alias vscodeconfig="code ~/Library/Application\ Support/Code/User/settings.json"
alias hidedesk="defaults write com.apple.finder CreateDesktop false && killall Finder"
alias showdesk="defaults write com.apple.finder CreateDesktop true && killall Finder"
alias kubes-beta-backend="export KUBECONFIG='${HOME}/.kube/config-kubes-beta-portal' && kubectl port-forward service/portal 9050:9050"
alias nuke="git clean -xdf"
alias dotfiles="vim ~/dev/dotfiles/brew.exclude.sh"
alias kick-zsh="source ~/.zshrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# zsh-completions
  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

# Add Visual Studio Code (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
# Add Visual Studio Code (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/Users/steve/.nvm/versions/node/v12.16.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/steve/.local/bin"
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
