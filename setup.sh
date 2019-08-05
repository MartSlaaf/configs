# install vim
PWD = pwd
ln -s $PWD/.vimrc $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
