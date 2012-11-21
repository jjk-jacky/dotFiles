#
# ~/.zprofile
#

PATH=~/bin:"$PATH"
export PATH

level=$(runlevel)
if [ -z "$DISPLAY" ] && [ $(tty) = "/dev/tty2" ] && [ "${level:2:1}" = "5" ]; then
    exec startx > ~/.tty2.log 2>&1
fi

