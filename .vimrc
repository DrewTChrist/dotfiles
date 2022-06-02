syntax enable
filetype plugin indent on
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
Plug 'Valloric/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'rust-lang/rust.vim'
call plug#end()

" YouCompleteMe options
let g:ycm_rust_src_path = '~/rust'
let g:ycm_global_ycm_extra_conf = '~/.vimrc/global_extra_conf.py'
let g:ycm_goto_buffer_command = 'split'

" remaps
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>h :wincmd h<CR>h
nnoremap <leader>k :wincmd k<CR>k
nnoremap <leader>l :wincmd l<CR>l
nnoremap <leader>j :wincmd j<CR>j
nnoremap <leader>th :tabp<CR>
nnoremap <leader>tl :tabn<CR>
nnoremap <leader>c :tabclose!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nnoremap <leader>ut :UndotreeToggle<CR>




" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | au! | augroup END"
augroup vimStartup
au!

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

augroup END
