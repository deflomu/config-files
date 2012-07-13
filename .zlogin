# Auto attach to tmux
if [ "$PS1" != "" -a "${TMUX:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
        ( (tmux has-session -t remote && tmux attach-session -t remote) || (tmux new-session -s remote) ) && exit 0
        echo "tmux failed to start"
fi
