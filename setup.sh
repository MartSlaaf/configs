#!/bin/bash

PWD=$(pwd)

install_zsh_locally () {
    echo "installing zsh locally"
    
    # download
    wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
    mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1

    # compile
    cd zsh
    ./configure --prefix=$HOME
    make
    make install

    # clean up
    cd ..
    rm -rf zsh
    rm zsh.tar
    
    # make it start from bash
    echo 'export PATH="$HOME/bin:$PATH"' >> $HOME/.bashrc
    echo "[ -f $HOME/bin/zsh   ] && exec $HOME/bin/zsh -l" >> $HOME/.bashrc

    echo "installing oh-my-zsh"
    
    # add zsh to path
    export PATH="$HOME/bin:$PATH"
}

i_have_sudo () {
    echo "installing via apt-get: zsh, curl, powerline-fonts"

    sudo apt-get install fonts-powerline zsh curl
}

for i in "$@"
do
case $i in
    --install-zsh-locally|-izl)
    install_zsh_locally
    ;;
    --i-have-sudo|-ihs)
    i_ve_sudo
    ;;  
    *)
    echo "unrecognized option!"
    ;;
esac
done


# all in one
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# configure vim
echo "configuring vim"

ln -s $PWD/.vimrc $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# configure zsh
echo "configuring zsh"

FILE=$HOME/.zshrc
if test -f "$FILE"; then
    mv $FILE $HOME/.zshrc_b4
fi
ln -s $PWD/.zshrc $FILE

# tmux config
echo "configuring tmux"

ln -s $PWD/.tmux.conf $HOME/.tmux.conf

# config git
echo "configuring git"

ln -s $PWD/.gitignore-global $HOME/.gitignore
git config --global core.editor "vim"
git config --global core.excludesfile ~/.gitignore
git config --global user.name "Yaroslav Zharov"
git config --global user.email "mart.slaaf@gmail.com"
