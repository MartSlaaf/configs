# install vim
$PWD = pwd
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
