# The following lines were added by compinstall
. /etc/profile

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-/]=* r:|=*'
zstyle ':completion:*' menu select=2
zstyle :compinstall filename ~/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=420
SAVEHIST=420
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
key[C-Left]=$'\033'\[1\;5D
key[C-Right]=$'\033'\[1\;5C

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char
[[ -n "${key[C-Left]}"  ]]  && bindkey  "${key[C-Left]}"  backward-word
[[ -n "${key[C-Right]}" ]]  && bindkey  "${key[C-Right]}" forward-word
# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
function zle-line-init () {
  echoti smkx 2>/dev/null
}
function zle-line-finish () {
  echoti rmkx 2>/dev/null
}
zle -N zle-line-init
zle -N zle-line-finish

autoload -U colors
colors

# set prompt
function precmd() {
  local clr
  clr=$fg[red]
  [[ $(id -u) -ne 0 ]] && clr=$fg[green]
  PS1="[%{$clr%}%n%{$reset_color%}@%m %(?..%{$fg[red]%}%?%{$reset_color%} )%1~]%# "
  title
}

function title() {
  [[ $TERM == linux ]] && return
  local t
  t=$(print "$@" | tr -cd '[:print:]')
  print -Pn "\e]0;%n@%m:%~ $t\a"
}

function preexec() {
  title $1
}

setopt interactivecomments

. ~/dotFiles/aliases
. ~/dotFiles/functions

PATH=~/bin:~/pear/pear:"$PATH"
export PATH

READNULLCMD=less
