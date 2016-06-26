copy_last_command_line_to_clipboard() {
    cmdcode=$( tail -n 1 ~/.bash_history )
    echo $cmdcode | xclip -selection clipboard
    echo "Copied the command: \"$cmdcode\" to the clipboard."
}
