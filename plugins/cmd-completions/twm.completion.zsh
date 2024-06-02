which twm &> /dev/null

if [ $? = 0 ]; then
	twm --print-zsh-completion
fi
