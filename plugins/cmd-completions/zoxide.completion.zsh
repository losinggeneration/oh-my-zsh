which zoxide &> /dev/null

if [ $? = 0 ]; then
  zoxide init zsh
fi
