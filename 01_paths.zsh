# Shell Variables

export EDITOR='nvim'
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export KDEDIRS=/usr/local:/usr

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export CHIBI_MODULE_PATH=$HOME/.local/share/chibi-scheme

prependpath() {
	if [ -d "$1" ]; then
		case ":$PATH:" in
		*:"$1":*) ;;

		*)
			PATH="$1${PATH:+:$PATH}"
			;;
		esac
	fi
}

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

prependpaths() {
	for p in $*; do
		prependpath "$p"
	done
}

appendpaths() {
	for p in $*; do
		appendpath "$p"
	done
}

# Clear path first
PATH=""

appendpath "$HOME/Programs/bin"
if [ "$IS_MUSL" ]; then
	appendpath "$HOME/Programs/musl"
	export GOBIN="$HOME/Programs/musl"
fi

# Other useful language package installers
appendpaths "$HOME/.local/bin" \
	"$HOME/.luarocks/bin" \
	"$HOME/.cargo/bin" \
	"$HOME/.yarn/bin" \
	"$HOME/.config/yarn/global/node_modules/.bin" \
	'/opt/android-sdk/platform-tools'

# Add system paths
appendpaths '/usr/local/bin' \
	'/usr/local/sbin' \
	'/sbin' \
	'/usr/sbin' \
	'/bin' \
	'/usr/bin' \
	"$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin"
