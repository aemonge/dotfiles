#alias vim='vim --servername LOCAL --remote-tab-silent'
#alias sfind='find $1 -not -ipath "*.svn/*"'
xbacklight -set 60%;
alias nautilus='nautilus --no-desktop'
alias tm="tmux -2 attach || tmux -2 "
export EDITOR=/usr/bin/vim


# ############  ViMode  ###################
	set -o vi
	# ^p check for partial match in history
	bind -m vi-insert "\C-p":dynamic-complete-history
	# ^n cycle through the list of partial matches
	bind -m vi-insert "\C-n":menu-complete
	# ^l clear screen
	bind -m vi-insert "\C-l":clear-screen

# #########################################
# ############### APPARIX PLUG IN #########
# #########################################
# The apparix amazing shell bookmaks !!!
function to () {
   if test "$2"; then
     cd "$(apparix "$1" "$2" || echo .)";
   else
     cd "$(apparix "$1" || echo .)";
   fi
   pwd
}
function bm () {
   if test "$2"; then
      apparix --add-mark "$1" "$2";
   elif test "$1"; then
      apparix --add-mark "$1";
   else
      apparix --add-mark;
   fi
}
function portal () {
   if test "$1"; then
      apparix --add-portal "$1";
   else
      apparix --add-portal;
   fi
}
# function to generate list of completions from .apparixrc
function _apparix_aliases ()
{   cur=$2
    dir=$3
    COMPREPLY=()
    if [ "$1" == "$3" ]
    then
        COMPREPLY=( $( cat $HOME/.apparix{rc,expand} | \
                       grep "j,.*$cur.*," | cut -f2 -d, ) )
    else
        dir=`apparix -favour rOl $dir 2>/dev/null` || return 0
        eval_compreply="COMPREPLY=( $(
            cd "$dir"
            \ls -d *$cur* | while read r
            do
                [[ -d "$r" ]] &&
                [[ $r == *$cur* ]] &&
                    echo \"${r// /\\ }\"
            done
            ) )"
        eval $eval_compreply
    fi
    return 0
}
# command to register the above to expand when the 'to' command's args are
# being expanded
complete -F _apparix_aliases to

# Power Line
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
