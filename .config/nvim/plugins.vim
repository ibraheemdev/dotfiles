" ===========================================
" VIM PLUGINS
" ===========================================

call plug#begin('~/.nvim/plugged')

" airline bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" color scheme
Plug 'chriskempson/base16-vim'

" fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'

" toml support
Plug 'cespare/vim-toml'

call plug#end()
