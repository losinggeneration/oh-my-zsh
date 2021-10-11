reload-kubeconfig() {
	export KUBECONFIG=~/.kube/config
	[ ! -d "$HOME/.kube/config.d" ] && return
	for c in ~/.kube/config.d/*.yml; do
		export KUBECONFIG=$KUBECONFIG:$c
	done
}

reload-kubeconfig
