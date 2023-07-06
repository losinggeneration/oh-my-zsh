function kubectlgetall() {
  kubectl get --show-kind --ignore-not-found -n $1 $(kubectl api-resources --verbs=list --namespaced -o name | xargs echo | sed "s/ /,/g")
}
