dotFiles
========

My dot files configs, but mainly my VIMRC !!!

## VIM
* It uses [Vundle](https://github.com/gmarik/Vundle.vim) as the main plug-in manager.
* It also needs you to manually compile the [youCompleteMe](https://github.com/Valloric/YouCompleteMe) plugin
* And install `Ag` as a faster substitution of `Grep`.

## Zsh
Please check oh-my-zsh first

## Tmux
Please download all tmux themes before ;)

## guiDonws
Just kill everything at port 8080
`for A in $(NETSTAT.EXE -ano | findstr.exe 8080 | rev | cut -f1 -d' ' | uniq); do taskkill -F -PID $A; done`

## Bash tools
### Split into user password variables a String key such as `user:password`
```bash
IFS=: read usr pwd <<< "hola:mundio"; echo $usr " -> " $pwd
```

