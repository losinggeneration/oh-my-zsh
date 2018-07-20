PS1_TIME="%{$fg[green]%}%*"
PS1_USER="%{$fg[cyan]%}%n"
PS1_HOST="%{$fg[cyan]%}%M"
PS1_PATH="%{$fg_bold[red]%}%40<...<%{$fg[red]%}%~%<<"
PS1_INFO="%{$reset_color%}$PS1_TIME%{$fg[white]%}:$PS1_USER%{$fg[white]%}@$PS1_HOST%{$fg[white]%}:$PS1_PATH"

PS1="%{$fg_bold[green]%}{$PS1_INFO%{$fg_bold[green]%}}%{$fg[blue]%}%# %{$reset_color%}"
RPS1_STATUS="%{$fg_bold[blue]%}$TTY:t%(1j.%{$fg_bold[yellow]%} %j jobs.)%(?.. %{$fg_bold[red]%}%{$bg[black]%}%?)%{$reset_color%}"
RPS1='$(losinggeneration_git_prompt)'"$RPS1_STATUS"

PS2_INFO="%{$reset_color%}%{$fg[cyan]%}%_%{$fg[white]%}:$PS1_INFO"
PS2="%{$fg_bold[yellow]%}<$PS2_INFO%{$reset_color%} $RPS1_STATUS%{$fg_bold[yellow]%}>%{$reset_color%} "

#PS3="${fg[red]}?#${reset_color} "

losinggeneration_git_prompt()
{
	git status &> /dev/null
	if [ $? -ne 0 ]; then
		return
	fi

	local sha="$(git rev-parse --short HEAD 2> /dev/null)"
	local branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
	local topdir="$(git rev-parse --show-toplevel 2> /dev/null | awk '{n=split($1,d,"/"); print(d[n]);}')"
	local git_prompt="$topdir $sha [$(git_current_branch)] "

	local color=$ZSH_THEME_GIT_PROMPT_CLEAN
	if [ "$(git diff --shortstat 2> /dev/null)" != "" ]; then
		color=$ZSH_THEME_GIT_PROMPT_DIRTY
	fi

	echo "$color$git_prompt%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%}"
