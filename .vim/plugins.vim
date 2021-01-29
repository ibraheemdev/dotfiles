" ===========================================
" VIM PLUGINS
" ===========================================

call plug#begin('~/.vim/plugged')

" airline bar
Plug 'vim-airline/vim-airline'

" color scheme
Plug 'morhetz/gruvbox'

" fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" disable netrw
let loaded_netrwPlugin = 1
