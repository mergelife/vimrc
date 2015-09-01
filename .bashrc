# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'
alias cd6='cd ../../../../../..'
alias gitdiff='git difftool'
alias gst='git status'
alias gdf='git diff'

export ARCH=arm
#export CROSS_COMPILE="/home/caolei/projects/16AVH/16AVH+N/uboot_imx/arm-eabi-4.6/bin/arm-eabi-"
#export CROSS_COMPILE="/home/caolei/projects/SmartUnit/5.0/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-"
#export CROSS_COMPILE="/home/caolei/projects/ref/tmap/prebuilt/toolchains/arm-fsl-linux-gnueabi.orig/4.6.2/bin/arm-fsl-linux-gnueabi-"
export CROSS_COMPILE="/home/caolei/projects/Goni/prebuilts/gcc/linux-x86/arm/arm-linux-gnueabihf/bin/arm-linux-gnueabihf-"

#export PATH=${PATH}:${ANDROID_PRODUCT_OUT_BIN}:${ANDROID_PRODUCT_OUT};
#emulator -system system.img -data userdata.img -ramdisk ramdisk.img
#export ANDROID_PRODUCT_OUT=/home/caolei/projects/14AVH/14PF/km500_4_2_2/out/target/product/generic
#export ANDROID_PRODUCT_OUT_BIN=/home/caolei/projects/14AVH/14PF/km500_4_2_2/out/host/linux-x86/bin/

export GREP_OPTIONS="--exclude=tags --exclude=\.depend --exclude=cscope.out --exclude=.svn --exclude=.git --exclude=svn"

# use vim open man
#function man(){
#        /usr/bin/man $* |col -b| /usr/bin/vim -R -c 'set ft=man nomod nolist' -
#}

#for delete files to recycler
alias del='mv -t ~/.local/share/Trash/files --backup=t'

#for java env
export JAVA_HOME=/usr/lib/jvm/java-6-sun
#export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
#use vi for terminal
#set -o vi
