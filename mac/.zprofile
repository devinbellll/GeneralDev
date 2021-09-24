export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/usr/local/opt/python@3.7/bin
alias ibrew="arch -x86_64 /usr/local/bin/brew"
source ~/venv/bin/activate

if [ "$TMUX" = "" ]; then tmux; fi
