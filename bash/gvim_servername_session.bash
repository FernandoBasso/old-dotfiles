#!/bin/bash
# Tuesday, 07:05 - January 17 - 2012

# CREATE VIM SERVER and OPEN SESSIONS*** {{{

#function _GvimServerSession() {
function GS() {

    clear
    cd ~/Vim_Stuff/Sessions/
    echo -e "\n\tOpens a vim session file and set servername to"
    echo -e "\tthe name of the session."
    echo -e "\n\033[1;33mAVAILABLE SESSIONS:${txtylw}"
    echo -e "${txtred}\n    CTRL-D to cancel.${txtrst}"

    session_file='init'
    while [ "${session_file}" != 'exit' ]; do
        echo -e -n "Type in session name: "
        read -e vim_session
        echo
        if [[ -z $vim_session ]]; then
            #if [[ -z $1 || -z $2 ]]; then
            #echo "Usage: ${0##*/} SERVERNAME SESSION_FILE" >&2
            echo -e "Usage: \033[1;31m'${FUNCNAME} \033[0;31mSESSION_FILE'\033[0m" >&2
            return 1
        else
            gvim --servername "${vim_session%%.*}" -S "${vim_session}"
            cd "$OLDPWD"
            return 0
        fi

    done
}


