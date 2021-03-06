# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#
# git-completion.bash / git-prompt.sh
#
if [ -f $HOME/dotfiles/myapps/git-bash-prompt/git-prompt.sh ]; then
    source $HOME/dotfiles/myapps/git-bash-prompt/git-prompt.sh
fi
if [ -f $HOME/dotfiles/myapps/git-bash-prompt/git-completion.bash ]; then
    source $HOME/dotfiles/myapps/git-bash-prompt/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    GREEN='\[\e[32m\]'
    UNSET='\[\e[0m\]'
    CYAN='\[\e[36m\]'
    GRAY='\[\e[40m\]'
    PS1="${debian_chroot:+($debian_chroot)}\n\u$CYAN@\h$UNSET [\w]\$(__git_ps1)\n\$ "
    #PS1="${debian_chroot:+($debian_chroot)}$GRAY[\w]\$(__git_ps1)$UNSET\n\u$CYAN@\h$UNSET \$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# some more command aliases
alias mv='mv -i'
alias cp='cp -i'
alias svi='sudoedit'
alias ps='ps --sort=start_time'
#alias minicom="mkdir -p ~/minilog ; minicom -s -D /dev/ttyUSB0 -C ~/minilog/`date +%y%m%d_%H%M`.log "
if type trash-put &> /dev/null
then
    alias rm='trash-put'
fi

# environment variable
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export VISUAL=vim
export EDITOR=vim

# Add PATH
export INITPATH=$PATH
export PATH=$PATH:$HOME/dotfiles/myapps:/usr/local/bin/
export PATH=$PATH:$HOME/.roswell/bin/
export PATH=`echo $PATH | tr ':' '\n' | sort -u | paste -d: -s -`;

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

set bell-style none
complete -cf sudo

