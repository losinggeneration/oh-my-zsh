_omz_cmd_completion_plugin_dir="${0:h}"

add_completion()
{
	local cmd=$(basename ${1%.completion.zsh})
	if (( $+commands[$cmd] )); then
		local __CMD_COMPLETION_FILE="${ZSH_CACHE_DIR}/${cmd}_completion"

		if [[ ! -f $__CMD_COMPLETION_FILE ]]; then
			zsh $1 >! $__CMD_COMPLETION_FILE
		fi

		[[ -f $__CMD_COMPLETION_FILE ]] && source $__CMD_COMPLETION_FILE
	fi
}

completion_clear_cache()
{
	rm -f ${ZSH_CACHE_DIR}/*_completion 2> /dev/null
}

load_cmd_completions()
{
	for cmd in ${_omz_cmd_completion_plugin_dir}/*.completion.zsh; do
		add_completion $cmd
	done
}

reload_cmd_completions()
{
	completion_clear_cache
	load_cmd_completions
}

load_cmd_completions

