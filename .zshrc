# Path to your oh-my-zsh installation.
  export ZSH=/home/aemonge/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="normi"

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
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(
  apache2-macports, autoenv, autojump, autopep8, battery, bower, bundler, capistrano, chruby, cloudapp, coffee, colorize
  , command-not-found, common-aliases, copydir, copyfile, cp, debian, dircycle, dirhistory, dirpersist, docker, emacs, gcloud-zsh-completion
  , encode64, fastfile, fbterm, forklift, frontend-search, gem, git-extras, git-flow-avh, git-flow, git-hubflow, git-prompt
  , git-remote-branch, git, gitfast, github, gitignore, glassfish, gnu-utils, heroku, history-substring-search, history, iwhois
  , jake-node, jira, jruby, jsontools, jump, lighthouse, mercurial, meteor, node, npm, nvm
  , perl, pip, pj, pod, postgres, pow, powder, powify, profiles, pyenv, pylint, python, rails, rails3, rails4, rake-fast, rake, rand-quote, rbenv, rbfu, rebar
  , redis-cli, repo, rsync, ruby, rvm, safe-paste, scd, sfffe, singlechar, sprunge, ssh-agent, sublime, sudo, supervisor, svn-fast-info, svn, symfony, symfony2, systemadmin, systemd
  , taskwarrior, terminalapp, themes, thor, tmux, tmuxinator, torrent, urltools, vagrant
  , vi-mode, vim-interaction, virtualenv, virtualenvwrapper, vundle, wakeonlan, wd, web-search, xcode, yii, yum, z, zeus, zsh_reload
  , zsh-syntax-highlighting, zsh-autosuggestions, mvn
)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/aemonge/.gem/ruby/2.2.0/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Vi mode
set editing-mode vi
set blink-matching-paren on
set -o vi
alias tmux='tmux -2'

# TMUX
if which tmux >/dev/null 2>&1; then
  # if no session is started, start a new session
  test -z ${TMUX} && tmux

  # when quitting tmux, try to attach
  while test -z ${TMUX}; do
    tmux attach || break
  done
fi

# Old User configuration
# export PATH="/home/aemonge/.nvm/v0.11.13/bin:/home/aemonge/local/bin:/home/aemonge/.rvm/gems/ruby-head/bin:/home/aemonge/.rvm/gems/ruby-head@global/bin:/home/aemonge/.rvm/rubies/ruby-head/bin:./node_modules/.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/games:/usr/local/games:/home/aemonge/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"
# export NODE_PATH=$NODE_PATH:/home/aemonge/.npm/lib/node_modules
