call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'

call plug#end()

" always display status bar
set laststatus=2

" hide buffers
set hidden

" navigate buffers
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>
