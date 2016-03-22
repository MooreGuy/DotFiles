# .bashrc
# User specific variables
export GOPATH=$HOME/Git/gocode/bin

# Attach to tmux if session exists or create a new session.
if [ -z $TMUX ]; then
	tmux attach
else
	tmux
fi

# User specific aliases and functions
alias yolo='git commit -A -m "YOLO"'
