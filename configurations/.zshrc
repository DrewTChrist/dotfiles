# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# theme
source /home/andrew/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# plugins
plugins=(
	git
	docker
	docker-compose
	vi-mode
)

# directory and file colors
alias ls='ls --color'
export LS_COLORS='di=0;34:*.py=0;33:' 

export ZSH=/home/andrew/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
