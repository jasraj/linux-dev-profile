#!/usr/bin/env bash

## Standard Bash Profile for Development
## Copyright (C) 2014 Jaskirat M.S. Rajasansir
## License BSD, see LICENSE for details


# Shell-specific settings

set -o vi                                                       # vi editing mode
#set -u                                                         # Unbound variables throw error
                                                                # NOTE: You might experience strange errors on tab-completion with
                                                                # this command. Uncomment at your own risk

stty stop 'undef'                                               # Disable annoying CTRL+S stop-flow signal

umask 027                                                       # Allow only group to read / execute your files (u=rwx,g=rx,o=)
                                                                #   Use 'umask 077' to only allow read / write access for yourself

export EDITOR=vim                                               # Use 'vim' edit mode
export HISTCONTROL=ignoreboth                                   # Lines matching the previous history entry and commands beginning 
                                                                # withspace are not saved
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"             # Ensure command history is saved after every command


# Application-specific settings

export LESS="-R"                                                # Render colors in 'less' output
export LS_OPTIONS="-N --color=auto -T 0"                        # Print raw entry names, color output, assume table stops at 0
export GREP_OPTIONS="--color=auto"                              # Color output
export RLWRAP_HOME=~/.rlwrap                                    # Store rlwrap output in this folder
export SCREENRC=~/.dev-profile/.screenrc                        # Custom screen settings
export VIMRC=~/.dev-profile/.vimrc                              # Custom VIM settings

source ~/.dev-profile/.git-branch-shell                         # Support printing GIT branches / tags in shell
PS1="\u@\h:\w\$(parse_git_branch_or_tag)> "

alias vi='vim -u $VIMRC'                                        # Override VIM bindings to load the custom profile
alias vim='vim -u $VIMRC'
alias view='view -u $VIMRC'


# Notify

if [[ $- == *i* ]]; then                                        # Print profile was loaded successfully only when session is interactive
    echo "$(date) Standard Bash Profile for Development Loaded"
fi
