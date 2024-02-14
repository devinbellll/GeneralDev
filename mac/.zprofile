export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local/opt/python@3.7/bin:$PATH
alias ibrew="arch -x86_64 /usr/local/bin/brew"
source ~/venv/bin/activate

alias lsusb='ioreg -p IOUSB'
alias vim='nvim'
alias cctags='ctags --options=.ctags -R .'

alias tmux='tmux -2 -L $ITERM_PROFILE'

#make ctrl p work exactly like up arrow
bindkey "^P" up-line-or-beginning-search
#make ctrl n work exactly like down arrow
bindkey "^N" down-line-or-beginning-search


if ! [ -n "$SSH_CONNECTION" ]; then
    if [ "$TMUX" = "" ]; then tmux; fi
fi

################################################
##################### git ######################
################################################

#ignore ORIG_HEAD in git autocomplete
zstyle ':completion:*:*:git*:*' ignored-patterns '*ORIG_HEAD'

alias gadd='git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -'
alias gbfind='git branch | grep '

gch() {
 git checkout "$(git branch | fzf | tr -d '[:space:]')"
}

greb() {
 git rebase -i "$(git branch | fzf | tr -d '[:space:]')"
}

gcpick() {
 git cherry-pick "$(git branch | fzf | tr -d '[:space:]')"
}
