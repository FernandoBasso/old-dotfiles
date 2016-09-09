#!/usr/bin/env bash

# Place where I manipulate files when I an studying my Anki cards
# and need to run quick snippets of code to assert my knowledge of
# the things I am committing to the long-term memory.
temp_study_dir="${HOME}/Public/tempstudyfiles"

if [ ! -d "$temp_study_dir" ] ; then
    mkdir --parent "$temp_study_dir"
    cd "$temp_study_dir"
fi

tmux new-session -d -s 'studies-anki' -c "$temp_study_dir"
tmux rename-window 'vim'
tmux new-window -t studies-anki:1 -n 'emacs' \; send-keys $'emacs -nw\n'
tmux new-window -t studies-anki:2 -n 'shell-1'
tmux new-window -t studies-anki:3 -n 'shell-2'
tmux new-window -t studies-anki:4 -n 'shell-3'

tmux select-window -t studies-anki:0
tmux -2 attach-session -t studies-anki

# For some reason, I couldn't do this to start vim at early lines
# of the script. Oh well...
tmux send-keys $'vim\n'

