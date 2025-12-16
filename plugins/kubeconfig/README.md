# KUBECONFIG plugin

This plugin loads multi-config files loading from `$HOME/.kube/config.d/*.yml`.

To use it, add `kubeconfig` to the plugins array in your zshrc file:

```zsh
plugins=(... kubeconfig)
```

## Functions

| Name              | Description                                                           |
|:------------------|:----------------------------------------------------------------------|
| reload-kubeconfig | Reload KUBECONFIG from multiple files in `$HOME/.kube/config.d/${1:+$1/}*.yml` |
