reload-kubeconfig() {
	export KUBECONFIG=~/.kube/config
	local subdirectory=${1:+$1/}
	[ ! -d "$HOME/.kube/config.d/${subdirectory}" ] && return
	for c in ~/.kube/config.d/${subdirectory}*.yml; do
		export KUBECONFIG=$KUBECONFIG:$c
	done
}

reload-kubeconfig
