#!/bin/bash

function install_docker() {
	printf "Installing Docker and Docker-Compose\n\n"
}

function download_pycharm() {
	printf "Getting PyCharm Professional\n\n"
	curl -L 'https://download.jetbrains.com/product?code=PY&latest&distribution=linux' --output pycharm.tar.gz
	tar -xvf pycharm.tar.gz
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

function all() {
	install_docker
	install_zsh
	download_pycharm 
}

function usage {
    echo "usage: $0 [-adhpz]"
    echo "  -a      complete all the actions"
    echo "  -d      install docker and docker-compose"
    echo "  -h      help"
    echo "  -p      download latest version of pycharm"
    echo "  -z      install zsh and zsh configuration"
    printf "\n"
}

if [[ $1 == "" ]]; then
    usage
    exit 1
fi

while getopts "adhpz" opt; do
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
		z)
			install_zsh
			;;
	esac
done

