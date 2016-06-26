
function rvmprompt() {
    PS1='\n\[\e[1;36m\]\w/ \e[0;31m$(__git_ps1 "[ %s ]")\e[0m \[\e[1;35m\][$(~/.rvm/bin/rvm-prompt)] \n\$ \[\e[1;0m\]'
}

function rvmpromptoff() {
    PS1='\n\[\e[1;36m\]\w/ \e[0;31m$(__git_ps1 "[ %s ]")\e[0m \[\e[1;35m\]\n\$ \[\e[1;0m\]'
}

function adocenv() {
    rvmprompt
    rvm use 2.2.3@global
}
