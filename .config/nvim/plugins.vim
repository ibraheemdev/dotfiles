" ===========================================
" VIM PLUGINS
" ===========================================

call plug#begin('~/.config/nvim/plugged')

" Lean & mean status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Base16 color schemes.
Plug 'chriskempson/base16-vim'

" Changes working directory to git root.
Plug 'airblade/vim-rooter'

" A command-line fuzzy finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Configuration for Neovim's LSP.
Plug 'neovim/nvim-lspconfig'

" A async completion framework for Neovim's LSP.
Plug 'nvim-lua/completion-nvim'

" TOML syntax highlighting.
Plug 'cespare/vim-toml'

" Distraction-free writing.
Plug 'junegunn/goyo.vim'

call plug#end()

" disable netrw
let loaded_netrwPlugin = 1
