#! /usr/bin/env bash


# PATH ini ----------------------------------------------------------------------------------------

# The rvm path thing has to be the first, for some reason.
PATH="$GEM_HOME/bin:$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

#PATH="${PATH}:$(ruby -rubygems -e 'puts Gem.user_dir')/bin"

NPM_PACKAGES="${HOME}/bin/node_modules"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$PATH"

PATH="${PATH}:$NPM_PACKAGES/bin/"
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Some of my own stuff.
PATH="${PATH}:$HOME/bin:${HOME}/.dotfiles/bin"

export ANDROID_HOME="${HOME}/bin/android-sdk/"
export PATH="${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export NVM_DIR=~/bin/nvm
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm


### Added by the Heroku Toolbelt
export PATH="${PATH}:/usr/local/heroku/bin"

# PATH end ----------------------------------------------------------------------------------------


# We don't want C-s to lock and terminal (which is unlocked with C-q).
stty -ixon



shopt -s checkwinsize # For hr='=='stuff to work.
hr='============================================================================================================================================================='
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source '/usr/share/git/git-prompt.sh'
fi

# PS1 for a terminal emulator includes a ✓ char.
if test $TERM == linux ; then
    check=' '
else
    check=$' \u2713 '
fi

# I like the ‘$ ’ prompt on a line of its own so I have plenty of space on the right to
# punch in the commands.
PS1='\n\[\e[0;34m\]\w/ $(date +'%H:%M:%S')${check}\e[0;31m$(__git_ps1 "[ %s ]")\e[0m\[\e[0;35m\]\n\$ \[\e[1;0m\]'


if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

alias ls="ls --color=auto --classify"
alias P='pacman-color'
alias g='gvim --remote'
alias lsd='ls --group-directories-first'
alias g='gvim --remote-silent'


MANWIDTH=80
unset HISTFILESIZE
HISTSIZE=2000
PROMPT_COMMAND="${PROMPT_COMMAND:-:}; history -a"
export HISTSIZE PROMPT_COMMAND MANWIDTH

shopt -s histappend

export PAGER='/usr/bin/less'
export BROWSER='firefox'
export EDITOR='/usr/bin/vim'

# Shows only files that are not directories.
lsf() { /bin/ls -F1 "$@" | egrep -v '/$'| sort -d; }

function title {
    unset PROMPT_COMMAND
    echo -en "\033]2;$1\007"
    #PROMPT_COMMAND='echo -ne "\033]0;$1\007"'
}


# Run with: Build hello.c
Build() {
    gcc -std=c99 -Wall -pedantic -o "${1%.c}" "$1";
};

MakeBin() {
    if ! test -d ./bin; then
        echo 'Create the ./bin/ directory first.';
        return -1;
    fi
    if [[ -z $* ]]; then
        echo "No arguments provided."
        echo -e "Usage: \033[31m'MakeBin source_file.c'\033[1;37m"
        echo "Try again."
    else
        #gcc -std=c99 -W -Wall -pedantic -o "${1%.c}.bin" "${1}";
        echo "gcc -std=c99 -W -Wall -pedantic ${1} -o ./bin/${1%.c}";
        gcc -std=c99 -W -Wall -pedantic "${1}" -o "./bin/${1%.c}";
    fi
};

MBin() {
    gcc -std=c99 -W -Wall -pedantic -o ./bin/prog "${1}";
}

C_compile_to_bin() {
    # %.c drops the '.c'
    gcc -std=c99 -Wall -pedantic -o "${1%.c}.bin" "${1}";
    mv ./*.bin ./Bin
};

source ~/.dotfiles/bash/helpers_functions.bash
source ~/.dotfiles/bash/prompts.bash

if [[ $(hostname) == 'fernandovbsdev' ]] ; then
    source ~/bin/mysql/logins.bash
fi



