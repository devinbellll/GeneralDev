#!/bin/bash

######################################################################
############################## brew ##################################
######################################################################

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:$PATH

######################################################################
############################# ohmyzsh ################################
######################################################################

rm -rf ~/.oh-my-zsh
rm ~/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

######################################################################
############################# general ################################
######################################################################

brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install fzf
brew install the_silver_searcher
brew install tmux

######################################################################
############################# python #################################
######################################################################

# setup python venv
python3 -m venv ~/venv
source ~/venv/bin/activate

######################################################################
############################## rust ##################################
######################################################################

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rustup component add rust-analyzer

######################################################################
############################## nvim ##################################
######################################################################

brew install nvim 
pip3 install pynvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
