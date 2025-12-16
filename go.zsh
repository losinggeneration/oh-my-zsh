# Google Go Programming Language
if [ "$(command -v go)" ]; then
	export GOROOT_BOOTSTRAP="$(dirname $(go env GOROOT))/src-bootstrap"
	export GOPATH="$HOME/Source/languages/go/ext"
	#export GOOS=linux
	#export GOARCH=amd64
	export GOBIN="$HOME/.local/share/go/bin"
	[ -f "$(go env GOROOT)/misc/zsh/go" ] && source "$(go env GOROOT)/misc/zsh/go"
	appendpath "$GOBIN"
fi
