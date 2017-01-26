# Path to your oh-my-zsh installation.
export ZSH=/Users/aemonge/.oh-my-zsh

ZSH_THEME="agnoster"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23' " Added in the ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=(autoenv, bower, brew, copybuffer, copydir, copyfile, cp, dircycle,
          dirhistory, dirpersist, django, gem, git-extras, git-flow-avh,
          git-flow, git-hubflow, git-prompt, git-remote-branch, git, gitfast,
          github, gitignore, grunt, gulp, history-substring-search, history,
          macports, node, npm, nvm, osx, ruby, rvm, sudo, tmux-cssh, tmux, vi-mode,
          zsh-autosuggestions)

## User configuration
  source $ZSH/oh-my-zsh.sh
  source ~/.profile
  set -o vi

  # You may need to manually set your language environment
  export LANG=en_US.UTF-8

  # Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='mvim'
  fi

  # Example aliases
  alias zshconfig="vim ~/.zshrc"
  alias ohmyzsh="vim ~/.oh-my-zsh"
