# remove aliases added by tmux plugin to change the prefix from t to tm

unalias ta tad ts tl tksv tkss

alias tma='tmux attach -t'
alias tmad='tmux attach -d -t'
alias tms='tmux new-session -s'
alias tml='tmux list-sessions'
alias tmksv='tmux kill-server'
alias tmkss='tmux kill-session -t'

# a couple more custom aliases
alias tmd='tmux detach'
alias tmkcs='tmux kill-session' # tmux kill current session
