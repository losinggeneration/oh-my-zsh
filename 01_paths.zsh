# Shell Variables

export EDITOR='nvim'
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export KDEDIRS=/usr/local:/usr

export XAUTHORITY=$HOME/.Xauthority
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

appendpath "$HOME/Programs/bin"
if [ "$IS_MUSL" ]; then
	appendpath "$HOME/Programs/musl"
	export GOBIN="$HOME/Programs/musl"
fi

appendpath '/usr/local/bin'
appendpath '/sbin'
appendpath '/usr/sbin'
appendpath '/usr/local/sbin'
appendpath '/opt/android-sdk/platform-tools'
appendpath "$HOME/.gem/ruby/1.9.1/bin"
appendpath "$HOME/.luarocks/bin"
appendpath "$HOME/.local/bin"
appendpath "$HOME/.yarn/bin"
appendpath "$HOME/.cargo/bin"
appendpath "$HOME/.config/yarn/global/node_modules/.bin"
