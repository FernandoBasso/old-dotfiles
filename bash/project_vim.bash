#!/bin/bash

function _GvimProject() {

    clear
    cd ~/Projects_Vim/
    echo -e "\n\tOpens a vim project (plugin) file and set servername!"
    echo -e "\n\033[1;33mAVAILABLE PROJECTS:${txtylw}"
    ls
    echo -e "${txtrst}"
    #echo -e "${txtred}\n    CTRL-D to cancel.${txtrst}"

    trap "cd $OLDPWD" SIGQUIT SIGHUP SIGINT SIGTERM
    project_file='init'
    while [ "${project_file}" != 'exit' ]; do
        #echo -e -n "Type in project name: "
        #read -e project_file
        read -p 'Type in project name: ' -e project_file
        echo
        if [[ -z $project_file ]]; then
            echo -e "Usage: \033[1;31m'${FUNCNAME} \033[0;31mPROJECT_FILE'\033[0m" >&2
            return 1
        elif [[ $project_file == 'exit' ]]; then
            # Abort the mission.
            echo "Good-bye!"
            return 0
        else
            #gvim --servername "${project_name%%.*}" -S "${project_name}"
            gvim +"Project $project_file"
            return 0
        fi
    done

    cd $OLDPWD

}
