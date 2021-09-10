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
let mapleader = " "

" plugins
call plug#begin('~/.vim/plugged')
""Plug 'morhetz/gruvbox'
""Plug 'tpope/vim-fugitive'
""Plug 'vim-utils/vim-man'
""Plug 'Valloric/YouCompleteMe'
""Plug 'mbbill/undotree'
Plug 'metakirby5/codi.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" remaps
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>h :wincmd h<CR>h
nnoremap <leader>k :wincmd k<CR>k
nnoremap <leader>l :wincmd l<CR>l
nnoremap <leader>j :wincmd j<CR>j
nnoremap <leader>th :tabp<CR>
nnoremap <leader>tl :tabn<CR>
nnoremap <leader>c :tabclose!<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" exit terminal with ctrl+\ ctrl+n
function! GetTerm()
    split
    execute("normal \<C-w>j<CR>j")
    term
    resize 8
endfunction

augroup neovim_terminal
    "autocmd!
    " Enter Terminal-mode (insert) automatically
    "autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

" automaticallly open terminal
call GetTerm()

" Automatically open NERDTree
autocmd VimEnter * NERDTree | wincmd p

" automatically open NERDTree in new tabs
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


""nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
""nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
""nnoremap <leader>t :UndoTreeToggle<CR>
