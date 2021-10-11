# Gruvbox Dark
fzf_gruvbox_dark() {
	export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=dark
 --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
 --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'
}

# Dracula
fzf_dracula() {
	export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=dark
 --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
 --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
}

#fzf_gruvbox_dark
fzf_dracula
