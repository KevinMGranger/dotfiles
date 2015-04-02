# vim
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# GPG {{{

GPG_TTY=$(tty)
export GPG_TTY

# }}}

# SSH {{{

export SSH_AUTH_SOCK=$HOME/.ssh/agent.socket

# }}}

# Editing {{{

export EDITOR=nvim

# }}}

# Path {{{

export PATH=$HOME/bin:$PATH

# }}}

# vim:fdm=marker
