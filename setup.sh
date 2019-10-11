$PWD = pwd

# configure vim
ln -s $PWD/.vimrc $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# tmux config
ln -s $PWD/.tmux.conf $HOME/.tmux.conf

# config git
ln -s $PWD/.gitignore $HOME/.gitignore
git config --global core.editor "vim"
git config --global core.excludesfile ~/.gitignore
git config --global user.name "Yaroslav Zharov"
git config --global user.email "mart.slaaf@gmail.com"
