# Linux only aliases
if [ "$(uname -s)" = "Linux" ]; then
  alias lst="ls --sort=time"
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

export DC=/var/local/toolchains/dc
alias source_kos="source $DC/kos/environ.sh"
alias dcarp="arp -s 192.168.1.7 00:d0:f1:02:b8:dd"
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
