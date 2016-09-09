#!/usr/bin/env bash

# Place where I manipulate files when I an studying my Anki cards
# and need to run quick snippets of code to assert my knowledge of
# the things I am committing to the long-term memory.
temp_study_dir="${HOME}/Public/tempstudyfiles"

if [ ! -d "$temp_study_dir" ] ; then
    mkdir --parent "$temp_study_dir"
    cd "$temp_study_dir"
fi

# \033 is \e, which is ESC.
# \007 is \a, which is BEL.
#echo -en '\033]2;Always Be Awesome!\007'
printf '\e]2;%s\a' 'Always Be Awesome!'

tmux new-session -d -s 'studies-anki' -c "$temp_study_dir"
tmux rename-window 'vim' \; send-keys $'vim\n'
tmux new-window -t studies-anki:1 -n 'emacs' \; send-keys $'emacs -nw\n'
tmux new-window -t studies-anki:2 -n 'shell-1'
tmux new-window -t studies-anki:3 -n 'shell-2'
tmux new-window -t studies-anki:4 -n 'shell-3'

tmux select-window -t studies-anki:0
tmux -2 attach-session -t studies-anki

