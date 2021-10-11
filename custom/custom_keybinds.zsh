### My Key bindings ###
# setup some VI mode settings to be a easier for things like searching
bindkey "^S" history-incremental-pattern-search-backward
bindkey "^F" history-incremental-pattern-search-forward

## Quick reminder, Ctrl+V then the key ##
case $TERM in
	*linux|screen*|xterm|xterm-vt220|*256color)
		bindkey "[3~"	delete-char # Delete
		bindkey ""	backward-delete-char # Backspace
		bindkey "[1~"	beginning-of-line # Home
		bindkey "[4~"	end-of-line # End
		bindkey "[5~"	up-line-or-search # PgUp
		bindkey "[6~"	down-line-or-search # PgDn
		bindkey "OA"	up-line-or-history # Up
		bindkey "OB"	down-line-or-history # Down
		bindkey "OD"	backward-char # Left
		bindkey "OC"	forward-char # Right
		bindkey ""	undo # Ctrl+U
		bindkey ""	redo # Ctrl+Y
		;;

	*xterm*|(dt|k)term)
		precmd () {print -Pn "\e]0;%n@%m: %~\a"}
		bindkey '[3~'	delete-char # Delete
		bindkey ''	backward-delete-char # Backspace
		bindkey 'OH'  beginning-of-line # Home
		bindkey 'OF'	end-of-line # End
		bindkey "[5~"	up-line-or-search # PgUp
		bindkey "[6~"	down-line-or-search # PgDn
		bindkey "OA"	up-line-or-history # Up
		bindkey "OB"	down-line-or-history # Down
		bindkey "OD"	backward-char # Left
		bindkey "OC"	forward-char # Right
		bindkey ""	undo # Ctrl+U
		bindkey ""	redo # Ctrl+Y
		;;

	rxvt*)
		precmd () {print -Pn "\e]0;%n@%m: %~\a"}
		bindkey "[3~"	delete-char # Delete
		bindkey ""	backward-delete-char # Backspace
		bindkey "[7~"  beginning-of-line # Home
		bindkey "[8~"	end-of-line # End
		bindkey "[5~"	up-line-or-search # PgUp
		bindkey "[6~"	down-line-or-search # PgDn
		bindkey "OA"	up-line-or-history # Up
		bindkey "OB"	down-line-or-history # Down
		bindkey "OD"	backward-char # Left
		bindkey "OC"	forward-char # Right
		bindkey ""	undo # Ctrl+U
		bindkey ""	redo # Ctrl+Y
		;;
esac

