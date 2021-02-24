" ===========================================
" VIM PLUGINS
" ===========================================

call plug#begin('~/.config/nvim/plugged')

" airline bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" color scheme
Plug 'chriskempson/base16-vim'

" fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" language support
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

call plug#end()

" disable netrw
let loaded_netrwPlugin = 1
