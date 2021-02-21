" ===========================================
" VIM PLUGINS
" ===========================================

call plug#begin('~/.vim/plugged')

" airline bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" color scheme
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

" fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'

call plug#end()
