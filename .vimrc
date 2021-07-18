syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "

nnoremap <leader>t :UndotreeToggle<CR>
nnoremap <leader>h :wincmd h<CR>h
nnoremap <leader>k :wincmd k<CR>k
nnoremap <leader>l :wincmd l<CR>l
nnoremap <leader>j :wincmd j<CR>j

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
