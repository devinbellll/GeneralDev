brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install fzf
brew install the_silver_searcher
python3 -m venv ~/venv

pushd ~ > /dev/null
HOME_PATH=$(pwd)
HOME_PATH=$(echo $HOME_PATH | sed 's/\//\\\//g')
popd > /dev/null

cp global_gitignore ~/.gitignore
sed "s/HOME_DIRECTORY/${HOME_PATH}/g" "global_gitconfig" > ~/.gitconfig

