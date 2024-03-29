#!/usr/bin/env bash

dir="${HOME}/Dropbox/studies"
ses='being-awesome'

tmux new-session -d -s "$ses" -c "$dir" \; rename-window 'vim' \; \
    send-keys 'vim' C-m

# php -S takes a host name, without the protocol:// part.
tmux new-window -t "${ses}:2" -n 'emacs' -c "$dir" \; \
    send-keys 'emacs -nw ~/Dropbox/orgmode/goals.org' C-m

tmux new-window -t "${ses}:3" -n 'shell' -c "$dir"

tmux select-window -t "${ses}:1"
tmux -2 attach-session -t "${ses}"

