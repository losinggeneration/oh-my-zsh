# Fallback start up
if [[ ! -n "$ZSHRUN" && ! -d $HOME/.oh-my-zsh ]]; then
	# start off with loading the default profile
	. /etc/profile
	# Lines configured by zsh-newuser-install
	HISTFILE=~/.zsh-history
	HISTSIZE=5000
	HIST_IGNORE_SPACE=1
	SAVEHIST=5000
	APPEND_HISTORY=1
	setopt appendhistory extendedglob nomatch notify CLOBBER DVORAK hist_ignore_dups
	unsetopt autocd beep
	bindkey -v
	# End of lines configured by zsh-newuser-install
	# The following lines were added by compinstall
	zstyle :compinstall filename '$HOME/.zshrc'

	# setup some VI mode settings to be a easier for things like searching
	bindkey "^S" history-incremental-pattern-search-backward
	bindkey "^F" history-incremental-pattern-search-forward

	autoload zmv
	autoload -Uz compinit
	compinit
	# End of lines added by #

	echo "$HOME/.oh-my-zsh not found, using fallback prompt"
	export REPORTTIME=20

	is_git_dirty() {
		local dirty="$(git diff --shortstat 2>/dev/null)"
		if [ "$dirty" = "" ]; then
			echo 0
		else
			echo 1
		fi
	}

	parse_git_branch() {
		git status &>/dev/null
		if [ $? -eq 0 ]; then
			local sha="$(git rev-parse --short HEAD 2>/dev/null)"
			local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
			local topdir="$(git rev-parse --show-toplevel 2>/dev/null | awk '{n=split($1,d,"/"); print(d[n]);}')"
			echo "$topdir $sha [$branch] "
		fi
	}

	colorize_git_branch() {
		local darkcyan=$'%{\e[0;36m%}'
		local red=$'%{\e[1;31m%}'
		local reset=$'%{\e[0m%}'

		local color=$darkcyan
		if [ $(is_git_dirty) = "1" ]; then
			color=$red
		fi
		echo "$color$(parse_git_branch)$reset"
	}

	setcolors() {
		setopt PROMPT_SUBST

		local reset=$'%{\e[0m%}'
		local darkred=$'%{\e[0;31m%}'
		local red=$'%{\e[1;31m%}'
		local green=$'%{\e[1;32m%}'
		local blue=$'%{\e[1;34m%}'
		local white=$'%{\e[0;39m%}'
		local yellow=$'%{\e[1;33m%}'
		local darkcyan=$'%{\e[0;36m%}'
		local blackbg=$'%{\e[40m%}'
		local randcol=$'%{\e[0;32m%}'

		# {hh:mm:ss:~/foo}% text goes here                  'tty number' 'number of jobs' 'error status'
		PS1="$reset$green{$randcol%*$white:$darkcyan%n$white@$darkcyan%M$white:$darkred%40<...<$red%~%<<$green}$blue%#$reset "
		RPS1='$(colorize_git_branch)'"$blue$TTY:t%(1j.$yellow %j jobs.)%(?.. $red$blackbg%?)$reset"
		setopt transientrprompt

		PS2="$reset$yellow<$darkcyan%_$white:$darkred%40<...<$red%~%<<$yellow>$blue$TTY:t%# %(1j.$yellow%j jobs .)%(?.$reset.$red$blackbg%?$reset )"

		PS3="$red?#$reset "
		unset reset darkred red green blue white yellow darkcyan blackbg randcol
	}

	setcolors
	unfunction setcolors
else
	PS1="{%* %40<...<%~%<<}# "
fi

# Oh My Zsh default config stuff
[ -e "$HOME/.oh-my-zsh/custom/config.sh" ] && source "$HOME/.oh-my-zsh/custom/config.sh"
