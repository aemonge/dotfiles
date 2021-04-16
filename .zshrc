# If you come from bash you might have to change your $PATH.
  export PATH=$HOME/usr/lib/bin:$PATH
  # export PATH="$HOME/npm/bin:$HOME/usr/bin:$PATH"

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
  ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
  DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
  ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
  COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
  DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
  # plugins=()
  # Core plugins
  # plugins=(
    # archlinux
    # cp dircycle dirhistory fzf git gitfast
    # history-substring-search history ng node npm vi-mode
    # vim-interaction
  # )

  if [ $VIM_TERMINAL ]; then
    plugins=( archlinux aws bower cargo cloudfoundry coffee colored-man-pages colorize command-not-found
      common-aliases composer copydir copyfile cp dircycle dirhistory dirpersist docker-compose docker-machine
      docker dotenv emoji-clock emoji emotty encode64 extract frontend-search fzf gem git-auto-fetch git-extras
      git-flow-avh git-flow git-hubflow git-prompt git gitfast github gitignore gnu-utils gradle
      grunt gulp jira jruby jsontools man marked2 mvn ng node npm oc pod python rake react-native rsync
      ruby rust rvm shrink-path singlechar ssh-agent stack sudo systemadmin systemd tig vi-mode vim-interaction vundle
      yarn zsh-navigation-tools zsh_reload
    )
    source $ZSH/oh-my-zsh.sh

    # User configuration
    set -o vi
  fi;

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
  export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
  export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
  alias ohmyzsh="vim ~/.oh-my-zsh"
  alias zvi='vim $(fzf)'
  alias pd=pushd
  alias pdd=popd
  alias ls='ls --color'
  alias open='xdg-open'
  alias lsports='echo "$> netstat -plunt;" && echo && netstat -plunt'
# Dont' save to `pushd` stack on every `  cd`
# Execute command without keeping it in history  (they have to start with space)
  export HISTCONTROL=ignorespace
  setopt histignorespace


# My own version of tmux
  if [ $VIM_TERMINAL ]; then
    alias vim=~/.vim/_vim
    alias vcd=~/.vim/_vcd
  fi
  if [ -z $VIM_TERMINAL ]; then
    vim +':terminal ++curwin ++close' && exit # || exit
  fi
