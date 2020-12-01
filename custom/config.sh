# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="losinggeneration"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  cmd-completions
  docker
  git
  git-extras
  git-flow
  kubeconfig
  systemd
  tmux
  vi-mode
  web-search
  yarn
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Shell Variables
export GEMPATH=$HOME/.gem/ruby/1.9.1/bin

export EDITOR='nvim'
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export KDEDIRS=/usr/local:/usr

# For PixelLight
export PL_RUNTIME=$HOME/Source/pixellight/Bin-Linux/Runtime/x64

# For Native Client SDK
export NACL_SDK_ROOT=$HOME/Programs/nacl_sdk

#for android
export ANDROIDPATH=/opt/android-sdk/platform-tools
export ANDROID_SDK=/opt/android
export ANDROID_HOME=/opt/android
export ANDROID_NDK_ROOT=/opt/android-ndk-r8e

# Google Go Programming Language
if [ "$(command -v go)" ]; then
export GOROOT_BOOTSTRAP=$(dirname $(go env GOROOT))/src-bootstrap
export GOPATH=$HOME/Source/languages/go/ext
#export GOOS=linux
#export GOARCH=amd64
export GOBIN=$HOME/Programs/bin
[ -f "$(go env GOROOT)/misc/zsh/go" ] && source $(go env GOROOT)/misc/zsh/go
fi

export XAUTHORITY=$HOME/.Xauthority
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export CHIBI_MODULE_PATH=$HOME/.local/share/chibi-scheme

export PATH=$HOME/Programs/bin:$PATH:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/.luarocks/bin:$HOME/.local/bin:$GEMPATH:$ANDROIDPATH
unset ANDROIDPATH GEMPATH

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Required because some completions are in local paths not the defaults
load_cmd_completions

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Linux only aliases
if [ "$(uname -s)" = "Linux" ]; then
	alias ls="ls --color"
	alias nls="ls --color=none"
	alias mv='mv -n'
elif [ "$(uname -s)" = "FreeBSD" ]; then
	alias ls="ls -G"
	alias nls="command ls"
else
	alias nls="ls"
fi

alias gvim='command vim -g -X -p'
alias mmv='noglob zmv -W'

alias gdmXepher='gdmXnest -x"Xephyr" -o "-extension GLX -query localhost :8 -host-cursor -screen 1024x768"'
alias gdmXepherchooser='gdmXnestchooser -x"Xephyr" -o "-extension GLX -query localhost :8 -host-cursor -screen 1024x768"'
alias ssh-ignore-id='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias scp-ignore-id='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

alias html2text="html2text -style pretty -ascii"
alias pandoc-text="pandoc -w plain"

# Haxe related aliases
alias nme="haxelib run nme"
alias openfl="haxelib run openfl"
alias lime="haxelib run lime"
alias haxepunk="haxelib run HaxePunk"
alias flixel="haxelib run flixel-tools"

# Clojure
alias clojure="java -cp $HOME/Source/languages/clojure/clojure/clojure.jar clojure.main"

# Dig aliases
alias dig-gg='dig @8.8.8.8'
alias dig-ns1='dig @ns1.ics-llc.net'
alias dig-ns2='dig @ns2.ics-llc.net'

# Unzip from a stream
alias unzip-stream="python2 -c \"import zipfile,sys,StringIO;zipfile.ZipFile(StringIO.StringIO(sys.stdin.read())).extractall(sys.argv[1] if len(sys.argv) == 2 else '.')\""

alias source_kos="source $DC/kos/environ.sh"
# Alias CMake to use ninja by default
alias cmake="cmake -G Ninja"
alias ccmake="ccmake -G Ninja"

alias voice="arecord -f cd | sox -t wav -b 16 -r 44100 -e signed - -t wav - | aplay -"
alias dce="docker-compose exec"
alias rm-st='find . -iname "*~" -delete'
alias vim="nvim"
#alias hb='HOST=127.0.0.1 gin -p 8099 -a 8000 -t ".:../harebrane" -i ../..'
alias mv="mv -i"
alias bundle-exec="bin/bundle exec"

# Functions

# tmux environment refresh
if [ -n "$TMUX" ]; then
	function tmux_refresh {
		local sock="$(tmux show-environment | grep "^SSH_AUTH_SOCK")"
		local display="$(tmux show-environment | grep "^DISPLAY")"
		[ "$sock" = "" ] || export $sock
		[ "$display" = "" ] || export $display
	}
else
	function tmux_refresh { }
fi

function preexec {
	tmux_refresh
}

function mp3normalize
{
	find . -iname '*.mp3' -exec dirname "{}" \; | sort -u | while read line; do mp3gain -s i -a -q -k "$line"/*.mp3; done
}

function vorbisnormalize
{
	# This scans every single directory and even if there are no vorbis files reports "Tags present; no files processed"
	# This seems sub-optimal, rather, te build the directory list up-front and loop over those
#	vorbisgain -afrs .
	# This actually does end up being faster than above
	find . -iname '*.ogg' -exec dirname "{}" \; | sort -u | while read line; do vorbisgain -afsn "$line"; done
}

function wine32
{
	WINEPREFIX=~/.wine32 WINEARCH=win32 wine $*
}

function winetricks32
{
	WINEPREFIX=~/.wine32 WINEARCH=win32 winetricks $*
}

function winecfg32
{
	WINEPREFIX=~/.wine32 WINEARCH=win32 /usr/bin/winecfg32 $*
}

function git_diff_add
{
	for i in $*; do
		git diff -w "./$i"
		echo "Add file? (y/n)"
		read response
		[ "$response" = "y" -o "$response" = "yes" ] && git add "./$i"
	done
}

function apt-cache()
{
    local search=""
    # Initial space will be optional if no options are given
    [ "$(echo "$*" | grep -E '[[:space:]]*search[[:space:]]')" ] && search=true

    if [ "$search" ]; then
            command apt-cache $* | sort
    else
            command apt-cache $*
    fi
}

function dub()
{
	if [ $# = 0 ]; then
		echo "Usage: $0 <lua file>"
		echo "<lua file> should be a lua file using dub to, for example, generate bindings."
		return
	fi
	# Get Lua's version
	local lua_version=$(command lua5.1 -e "print(_VERSION:sub(-3))")
	# Append to Lua's paths using normal shell variable interpolation
	LUA_PATH=$(command lua5.1 -e "print('$HOME/.local/share/lua/$lua_version/?.lua')") \
	LUA_CPATH=$(command lua5.1 -e "print('$HOME/.local/share/lua/$lua_version/lubyk/?.so')") \
	command lua5.1 -llubyk -e 'lk.Dir.sep="/"' $*
}

for i in lua lua5.2 lua5.1 luajit; do
function $i()
{
	# Get Lua's version
	local lua_version=$(command $0 -e "print(_VERSION:sub(-3))")

	LUA_PATH=$(command $0 -e "print(package.path..';?/init.lua;$HOME/.luarocks/share/lua/$lua_version/?.lua;$HOME/.luarocks/share/lua/$lua_version/?/init.lua;$HOME/.local/share/lua/$lua_version/?.lua;$HOME/.local/share/lua/$lua_version/?/init.lua')") \
	LUA_CPATH=$(command $0 -e "print(package.cpath..';$HOME/.luarocks/lib/lua/$lua_version/?.so;$HOME/.local/lib/lua/$lua_version/?.so')") \
	command $0 $*
}
done

function markdown()
{
	lua5.1 <(echo "$(cat << EOLUA
		discount=require("discount")
		if #arg > 0 then
			for _,v in ipairs(arg) do
				local lines = ""
				local f = io.open(v, "r")
				if not f then
					io.output(io.stderr):write(string.format([[%s: No such file or directory\n]], v))
					os.exit(1)
				end

				io.write(discount(f:read("*a")))
				f:close()
			end
		else
			local lines = ''
			while true do
				local line = io.read()
				if not line then
					break
				end
				lines = string.format('%s\\\n%s', lines, line)
			end
			io.write(discount(lines))
		end
EOLUA
	)") $*
}

function mdcat()
{
	if [ $# = 0 ]; then
		markdown | pandoc -t plain -f html
	else
		markdown < $* | pandoc -t plain -f html
	fi
}

function mdmore()
{
	mdcat $* | more
}

function mdless()
{
	mdcat $* | less
}

function psgrep()
{
	ps -eF | head -n1
	if [ "$*" ]; then
		ps -eF | tail -n+2 | grep "$*"
	else
		ps -eF | tail -n+2
	fi
}

# Remove console beeps
[ "$(uname -s)" = "Linux" -a "$TERM" = "xterm" ] && setterm -blength 0

# Include other configuration
[ -e "/etc/zsh_command_not_found" ] && source /etc/zsh_command_not_found
