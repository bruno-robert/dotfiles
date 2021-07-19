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


# Python Venv
# alias sourcehere='source ./env/bin/activate'
# Will automatically switch to the python environment contained in the current
# directory. It will search for (in order): env, .env.nosync, .env
sourcehere ()
{
  if [ -d ./env ]; then
    source ./env/bin/activate
  elif [ -d ./venv ]; then
    source ./venv/bin/activate
  elif [ -d ./.env.nosync ]; then
    source ./.env.nosync/bin/activate
  elif [ -d ./.env ]; then
    source ./.env/bin/activate
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
alias l='exa -l --color=always --group-directories-first'  # list all 
alias ll='exa -al --color=always --group-directories-first'  # list
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'                             # dotfiles

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
# alias rm='rm -i'

# npm icloud nosync
protectnode () {
  if [ -d node_modules ]; then
    mv node_modules .node_modules.nosync && ln -s .node_modules.nosync/ node_modules
  else
    echo "node_modules not found"
  fi
}
unprotectnode () {
  if [ -d .node_modules.nosync ]; then
    rm -f node_modules %% mv .node_modules.nosync node_modules
  else
    echo "node_modules not found"
  fi
}
# alias protectnode="mv node_modules .node_modules.nosync && ln -s .node_modules.nosync/ node_modules"
alias npmi="npm install && protectnode"

# codium alias
# alias code='codium'

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT:$PATH"

#Thefuck alias (fuck command)
eval $(thefuck --alias)

# Load external rc files (checks if they exist first)
[ -f ~/.zsh/.extrasrc ] && source ~/.zsh/.extrasrc

# bare git repo alias for dotfiles
alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
alias pushdotfiles="dotfiles add -u && dotfiles commit -m 'updating' && dotfiles push && dotfiles push github"

# start lindo market server
alias startserv="/Users/bruno/miniconda3/envs/data/bin/python ~/Devlocal/lindo-market/flask_api.py"

# mount cloud drives
alias mountpcloud="rclone mount --vfs-cache-mode writes pcloud: ~/pCloud/ &"
# alias mountepcloud="rclone mount --vfs-cache-mode writes pcloud-encrypt: ~/pCloud-Encrypted/ &"
alias mountgdrive="rclone mount --vfs-cache-mode writes gdrive: ~/GoogleDrive/ &"
alias doom="~/.emacs.d/bin/doom"

# Forklift alias (so you can open a directory in forklift with `fl .`)
alias fl="open -a ForkLift"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bruno/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bruno/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bruno/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bruno/google-cloud-sdk/completion.zsh.inc'; fi

# python poetry
export PATH="$HOME/.poetry/bin:$PATH"

# This is for git signign with gpg
export GPG_TTY=$(tty)

# Export variables for svn
export SVN_EDITOR="nvim"

unalias gf

# flutter
export PATH="$PATH:/home/bruno/flutter/bin"
