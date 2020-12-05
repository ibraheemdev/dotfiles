call plug#begin('~/.vim/plugged')

" visual flair
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" always display status bar
set laststatus=2

" airline config
let g:airline#extensions#tabline#enabled = 1 
let g:airline_theme = 'base16_gruvbox_dark_hard'

" hide buffers
set hidden

" navigate buffers
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>
