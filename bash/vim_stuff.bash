#!/bin/bash

# Shell thing to help me with vim ‘project’ plugin.

function _GvimProject() {(

clear
echo -e "\n\tOpens a project in Gvim!"
echo -e "\tUse <Tab> to help auto-complete correct project names."
echo -e "${txtred}\n  Type \"exit\" to quit.${txtrst}"
echo -e "\n\033[1;33mAVAILABLE PROJECTS:${txtylw}"
echo -e "${txtrst}"

# No need to wory about "cd'ing" back to $OLDPWD
# because all this is inside a subshell.
cd ~/Vim_Stuff/Projects/
ls
project_file='init'

while [ "${project_file}" != 'exit' ]; do # {{{
    #echo -e -n "Type in project name: "
    #read -e project_file

    echo
    if ! read -p 'Type in project name: ' -e project_file; then
        # Runs this if user hits Ctrl-D (ctrl-c kills everything).
        echo "\nAborting..."; exit 1;
    else
        if [[ $project_file == 'exit' ]]; then
            # Abort the mission.
            echo "Good-bye!"
            return 0
        elif [[ -z $project_file ]]; then
            # User hit <Enter> without supplying a filename. Variable is empty.
            echo -e "Usage: \033[1;31m'${FUNCNAME} \033[0;31mPROJECT_FILE'\033[0m" >&2
            #return 1
        else
            #gvim --servername "${project_name%%.*}" -S "${project_name}"
            gvim -geometry 111x27-5+0 +"Project $project_file"
            echo "Opening project ${project_file}.project."
            return 0
        fi
    fi

done

)}

function GS() {(

clear
echo -e "\n\tOpens a vim session file!"
echo -e "\n\tUse <Tab> to help auto-complete correct project names."
echo -e "${txtred}\n  Type \"exit\" to quit.${txtrst}" # }}}
echo -e "\n\033[1;33mAVAILABLE sessios:${txtylw}"
echo -e "${txtrst}"

cd ~/Vim_Stuff/Sessions/
ls
session_file='init'

while [ "${session_file}" != 'exit' ]; do # {{{

    echo
    # Instead of using 'echo' and 'read' seppartately, which used to allow
    # user delete the "type in session name" message, this version does NOT
    # allow the user delete the message.
    if ! read -p "Type in session name: " -e session_file; then # {{{
        echo "\nAborting..."; exit 1;
    else
        if [[ $session_file == 'exit' ]]; then # {{{
            # User decided to abort.
            echo 'Good-bye!'
            return 0
        elif [[ -z $session_file ]]; then
            #if [[ -z $1 || -z $2 ]]; then
            #echo "Usage: ${0##*/} SERVERNAME SESSION_FILE" >&2
            echo -e "Usage: \033[1;31m'${FUNCNAME} \033[0;31mSESSION_FILE'\033[0m" >&2
            #return 1
        else
            gvim --servername "${session_file%%.*}" -S "${session_file}"
            echo "Opening session ${session_file}."
            return 0
        fi

    fi

done

)}

