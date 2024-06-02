_omz_cmd_completions_plugin_dir="${0:h}"

_omz_cmd_completions_add()
{
	local cmd=$(basename ${1%.completion.zsh})
	if (( $+commands[$cmd] )); then
		local __CMD_COMPLETIONS_FILE="${ZSH_CACHE_DIR}/completions/${cmd}_completion"

		if [[ ! -f $__CMD_COMPLETIONS_FILE ]]; then
			zsh $1 >! $__CMD_COMPLETIONS_FILE
		fi

		[[ -f $__CMD_COMPLETIONS_FILE ]] && source $__CMD_COMPLETIONS_FILE
	fi
}

_omz_cmd_completions_clear_cache()
{
	rm -f ${ZSH_CACHE_DIR}/completions/*_completion 2> /dev/null
}

_omz_cmd_completions_load()
{
	for cmd in ${_omz_cmd_completions_plugin_dir}/*.completion.zsh; do
		_omz_cmd_completions_add $cmd
	done
}

reload_cmd_completions()
{
	_omz_cmd_completions_clear_cache
	_omz_cmd_completions_load
}

_omz_cmd_completions_load


