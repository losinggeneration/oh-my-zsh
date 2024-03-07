# Shell Variables

export EDITOR='nvim'
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export KDEDIRS=/usr/local:/usr

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export CHIBI_MODULE_PATH=$HOME/.local/share/chibi-scheme

appendpath() {
	if [ -d "$1" ]; then
		case ":$PATH:" in
		*:"$1":*) ;;

		*)
			PATH="${PATH:+$PATH:}$1"
			;;
		esac
	fi
}

# Clear path first
PATH=""

appendpath "$HOME/Programs/bin"
if [ "$IS_MUSL" ]; then
	appendpath "$HOME/Programs/musl"
	export GOBIN="$HOME/Programs/musl"
fi

# Other useful language package installers
appendpath "$HOME/.local/bin"
appendpath "$HOME/.luarocks/bin"
appendpath "$HOME/.cargo/bin"
appendpath "$HOME/.yarn/bin"
appendpath "$HOME/.config/yarn/global/node_modules/.bin"
appendpath '/opt/android-sdk/platform-tools'

# Add system paths
appendpath '/usr/local/bin'
appendpath '/usr/local/sbin'
appendpath '/sbin'
appendpath '/usr/sbin'
appendpath '/bin'
appendpath '/usr/bin'
appendpath "$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin"
