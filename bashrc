#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. /etc/profile
. ~/dotFiles/aliases
. ~/dotFiles/functions

PATH=~/bin:~/pear/pear:"$PATH"
export PATH

# git autocompletion
. /usr/share/git/completion/git-completion.bash

# tab-completion
complete -cf man
complete -cf sudo
complete -cf screen
complete -cf time

