# Path my scripts
export PATH=$PATH:~/user/lib/cellsOwnTools/:~/user/projects/medianet/recochy:/Applications/Seil.app/Contents/Library/bin:~/user/lib/scripts/

# Android Dev
export ANDROID_HOME=/Users/aemonge/Library/Android/sdk
export PATH=${PATH}:/Users/aemonge/Library/Android/sdk/platform-tools:/Users/aemonge/Library/Android/sdk/tools

# Aliases (vi, caltoday, tmux)
alias vi='vim -u NONE'
alias vimf='vim $(fzf)'
alias caltoday='cal | grep -C6 --color "$(date +%e)"'
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

# Install NVM
export NVM_DIR="/Users/aemonge/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  --no-use # This loads nvm

# Auto-load nvmrc from directory.
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
