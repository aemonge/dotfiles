# Path my scripts
export PATH=$PATH:~/usr/bin/

# Android Dev
# export ANDROID_HOME=~/Library/Android/sdk
# export PATH=${PATH}:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools

# Aliases (vi, caltoday, tmux)
# alias vi='vim -u NONE'
# alias vimf='vim $(fzf)'
alias caltoday='cal | grep -C6 --color "$(date +%e)"'

# TMUX
# if which tmux >/dev/null 2>&1; then
  # # if no session is started, start a new session
  # test -z ${TMUX} && tmux

  # # when quitting tmux, try to attach
  # while test -z ${TMUX}; do
    # tmux attach || break
  # done
# fi

xbindkeys -p
