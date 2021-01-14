#!/bin/bash

function install_docker() {
	printf "Installing Docker and Docker-Compose\n\n"
}

function download_pycharm() {
	printf "Getting PyCharm Professional\n\n"
	curl -L 'https://download.jetbrains.com/product?code=PY&latest&distribution=linux' --output ~/pycharm.tar.gz
	tar -xvf ~/pycharm.tar.gz
}

function install_zsh() {
	printf "Installing zsh\n\n"
	
	# install zsh
	apt-get install zsh -y

	# install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# install fonts
	wget -P ~/.local/share/fonts "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
	wget -P ~/.local/share/fonts "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
	wget -P ~/.local/share/fonts "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
	wget -P ~/.local/share/fonts "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"

	# TODO: Install Hack Nerd Font https://github.com/ryanoasis/nerd-fonts/blob/master/readme.md

	fc-cache -f -v
	
	# TODO: Install ls deluxe https://github.com/Peltoche/lsd#installation

	# TODO: Install LS_COLORS https://github.com/trapd00r/LS_COLORS

	# get powerlevel10k and zsh configs
	wget -P ~/ "https://raw.githubusercontent.com/DrewTChrist/script-and-configs/master/configurations/.p10k.zsh"
	wget -P ~/ "https://raw.githubusercontent.com/DrewTChrist/script-and-configs/master/configurations/.zshrc"

}

function setup_vim() {
    printf "Installing vim-plug plugins and .vimrc\n\n"

    # i don't think this is made anywhere else, but vim-plug needs it
    mkdir ~/.vim/plugged
    
    # install vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # copy .vimrc
    wget -P ~/ "https://raw.githubusercontnet.com/DrewTChrist/script-and-configs/master/configurations/.vimrc"

    # install plugins from .vimrc
    vim +PlugInstall +qall

    # YouCompleteMe relies on cmake 
    apt install cmake -y

    # build/install YouCompleteMe
    python3 ~/.vim/plugged/YouCompleteMe/install.py
}

function all() {
	install_docker
	install_zsh
    setup_vim
	download_pycharm 
}

function usage {
    echo "usage: $0 [-adhpz]"
    echo "  -a      complete all the actions"
    echo "  -d      install docker and docker-compose"
    echo "  -h      help"
    echo "  -p      download latest version of pycharm"
    echo "  -v      install vimrc and plugins"
    echo "  -z      install zsh and zsh configuration"
    printf "\n"
}

if [[ $1 == "" ]]; then
    usage
    exit 1
fi

while getopts "adhpvz" opt; do
	case $opt in
		a) 
			all
			;;
		d)
			install_docker
			;;
		h)
			usage
			;;
		p)
			download_pycharm
			;;
        v)
            setup_vim
            ;;
		z)
			install_zsh
			;;
	esac
done

