PWD = pwd


for i in "$@"
do
case $i in
    --install-zsh-locally|-izl)
    install_zsh_locally
    ;;
    *)
    echo "unrecognized option!"
    ;;
esac
done

function install_zsh_locally {
    echo "installing zsh locally"
    
    # download
    wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
    mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1

    # compile
    cd zsh
    ./configure --prefix=$HOME
    make
    make install
    
    # make it start from bash
    echo "[ -f $HOME/bin/zsh   ] && exec $HOME/bin/zsh -l" >> $HOME/.bashrc

    echo "installing oh-my-zsh"
    
    # all in one
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}


# configure vim
echo "configuring vim"

ln -s $PWD/.vimrc $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# configure zsh
echo "configuring zsh"

ln -s $PWD/.zshrc $HOME/.zshrc

# tmux config
echo "configuring tmux"

ln -s $PWD/.tmux.conf $HOME/.tmux.conf

# config git
echo "configuring git"

ln -s $PWD/.gitignore $HOME/.gitignore
git config --global core.editor "vim"
git config --global core.excludesfile ~/.gitignore
git config --global user.name "Yaroslav Zharov"
git config --global user.email "mart.slaaf@gmail.com"
