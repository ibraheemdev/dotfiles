call plug#begin('~/.vim/plugged')

" visual flair
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

" fuzzy finder
Plug 'airblade/vim-rooter'

call plug#end()

" always display status bar
set laststatus=2

" color scheme
set background=dark
let base16colorspace=256
let g:base16_shell_path="~/.scripts/base16/"
colorscheme base16-gruvbox-dark-hard
syntax on

" airline config
let g:airline#extensions#tabline#enabled = 1 
let g:airline_theme = 'base16_gruvbox_dark_hard'

" hide buffers
set hidden

" navigate buffers
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>
