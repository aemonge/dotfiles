set -o vi
# My own version of tmux
  if [ $VIM_TERMINAL ]; then
    alias vim=~/.vim/_vim
    alias vcd=~/.vim/_vcd
  fi
  if [ -z $VIM_TERMINAL ]; then
    vim +':terminal ++curwin ++close' && exit # || exit
  fi
