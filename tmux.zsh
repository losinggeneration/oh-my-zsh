# remove functions & aliases added by tmux plugin to change the prefix from t to tm

unfunction ta tad ts tkss
unalias tksv tl

function _build_tmux_alias {
  eval "function $1 {
    if [[ -z \$1 ]] || [[ \${1:0:1} == '-' ]]; then
      tmux $2 \"\$@\"
    else
      tmux $2 $3 \"\$@\"
    fi
  }"
}

alias tmksv='tmux kill-server'
alias tml='tmux list-sessions'
alias tmuxconf='$EDITOR $ZSH_TMUX_CONFIG'

_build_tmux_alias "tma" "attach" "-t"
_build_tmux_alias "tmad" "attach -d" "-t"
_build_tmux_alias "tms" "new-session" "-s"
_build_tmux_alias "tmkss" "kill-session" "-t"


unfunction _build_tmux_alias

# a couple more custom aliases
alias tmd='tmux detach'
alias tmkcs='tmux kill-session' # tmux kill current session
