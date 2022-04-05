if [ -v ZSH_IVE_GOT_THE_POWER_____LINE -a "$(command -v powerline-go)" ]; then

zmodload zsh/datetime

function preexec() {
  __TIMER=$EPOCHREALTIME
}

function powerline_precmd() {
  local __ERRCODE=$?
  local __DURATION=0

  if [ -n $__TIMER ]; then
    local __ERT=$EPOCHREALTIME
    __DURATION="$(($__ERT - ${__TIMER:-__ERT}))"
  fi

  #eval "$(powerline-go -error $__ERRCODE -duration $__DURATION -shell zsh -eval -modules time,user,host,cwd -modules-right git,docker,kube,newline,root,ssh,aws,goenv,vgo,newline,jobs,duration)"
  eval "$(powerline-go -error $__ERRCODE -duration $__DURATION -shell zsh -eval -modules time,user,host,cwd -modules-right newline,git,docker,kube)"
  unset __TIMER
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
fi
