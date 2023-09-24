export IS_MUSL="$(file $(readlink -f $(which sh)) | grep musl)"

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

preexec() {
	tmux_refresh
}

mp3normalize() {
	find . -iname '*.mp3' -exec dirname "{}" \; | sort -u | while read line; do mp3gain -s i -a -q -k "$line"/*.mp3; done
}

vorbisnormalize() {
	# This scans every single directory and even if there are no vorbis files reports "Tags present; no files processed"
	# This seems sub-optimal, rather, te build the directory list up-front and loop over those
#	vorbisgain -afrs .
	# This actually does end up being faster than above
	find . -iname '*.ogg' -exec dirname "{}" \; | sort -u | while read line; do vorbisgain -afsn "$line"; done
}

wine32() {
	WINEPREFIX=~/.wine32 WINEARCH=win32 wine $*
}

winetricks32() {
	WINEPREFIX=~/.wine32 WINEARCH=win32 winetricks $*
}

winecfg32() {
	WINEPREFIX=~/.wine32 WINEARCH=win32 /usr/bin/winecfg32 $*
}

git_diff_add() {
	for i in $*; do
		git diff -w "./$i"
		echo "Add file? (y/n)"
		read response
		[ "$response" = "y" -o "$response" = "yes" ] && git add "./$i"
	done
}

apt-cache() {
	local search=""
	# Initial space will be optional if no options are given
	[ "$(echo "$*" | grep -E '[[:space:]]*search[[:space:]]')" ] && search=true

	if [ "$search" ]; then
		command apt-cache $* | sort
	else
		command apt-cache $*
	fi
}

dub() {
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

for i in lua lua5.2 lua5.1 luajit lua5.3 lua5.4; do
function $i()
{
	# Get Lua's version
	local lua_version=$(command $0 -e "print(_VERSION:sub(-3))")

	LUA_PATH=$(command $0 -e "print(package.path..';?/init.lua;$HOME/.luarocks/share/lua/$lua_version/?.lua;$HOME/.luarocks/share/lua/$lua_version/?/init.lua;$HOME/.local/share/lua/$lua_version/?.lua;$HOME/.local/share/lua/$lua_version/?/init.lua')") \
	LUA_CPATH=$(command $0 -e "print(package.cpath..';$HOME/.luarocks/lib/lua/$lua_version/?.so;$HOME/.local/lib/lua/$lua_version/?.so')") \
	command $0 $*
}
done

markdown() {
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

mdcat() {
	if [ $# = 0 ]; then
		markdown | pandoc -t plain -f html
	else
		markdown < $* | pandoc -t plain -f html
	fi
}

mdmore() {
	mdcat $* | more
}

mdless() {
	mdcat $* | less
}

psgrep() {
	ps -eF | head -n1
	if [ "$*" ]; then
		ps -eF | tail -n+2 | grep "$*"
	else
		ps -eF | tail -n+2
	fi
}

