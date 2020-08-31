#  ______                         ______      _    __ _ _           
#  | ___ \                        |  _  \    | |  / _(_) |          
#  | |_/ /_ __ _   _ _ __   ___   | | | |___ | |_| |_ _| | ___  ___ 
#  | ___ \ '__| | | | '_ \ / _ \  | | | / _ \| __|  _| | |/ _ \/ __|
#  | |_/ / |  | |_| | | | | (_) | | |/ / (_) | |_| | | | |  __/\__ \
#  \____/|_|   \__,_|_| |_|\___/  |___/ \___/ \__|_| |_|_|\___||___/
#                                                                   
#

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### ALIASES ###

# restart yabai window manager
alias wmrestart='launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"'

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Changing "ls" to "exa"
alias l='exa -al --color=always --group-directories-first'  # list all 
alias ll='exa -l --color=always --group-directories-first'  # list
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'                             # dotfiles

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# codium alias
alias code='codium'

#Thefuck alias (fuck command)
eval $(thefuck --alias)

# Load external rc files (checks if they exist first)
[ -f ~/.zsh/.extrasrc ] && source ~/.zsh/.extrasrc

# bare git repo alias for dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
