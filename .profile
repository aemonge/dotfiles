#alias vim='vim --servername LOCAL --remote-tab-silent'
#alias sfind='find $1 -not -ipath "*.svn/*"'
#xbacklight -set 60%;
alias nautilus='nautilus --no-desktop'
#alias tm="tmux -2 attach || tmux -2 "


# ############  ViMode  ###################
	#set -o vi
	## ^p check for partial match in history
	#bind -m vi-insert "\C-p":dynamic-complete-history
	## ^n cycle through the list of partial matches
	#bind -m vi-insert "\C-n":menu-complete
	## ^l clear screen
	#bind -m vi-insert "\C-l":clear-screen

# Power Line
#if [ -d "$HOME/.local/bin" ]; then
    #PATH="$HOME/.local/bin:$PATH"
#fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

tmux -2 new-session 2> /dev/null || tmux -2 2> /dev/null
