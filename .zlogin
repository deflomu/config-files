# Auto attach to tmux
if [ "$PS1" != "" -a "${TMUX:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
        tmux attach-session -t remote && exit 0
        echo "tmux failed to start"
fi
