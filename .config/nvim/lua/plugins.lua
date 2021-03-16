-- ===========================================
-- VIM PLUGINS
-- ===========================================

local paq = require('paq').paq

-- Lean & mean status/tabline
paq 'vim-airline/vim-airline'
paq 'vim-airline/vim-airline-themes'

-- Base16 color schemes.
paq 'chriskempson/base16-vim'

-- Changes working directory to git root.
paq 'airblade/vim-rooter'

-- A command-line fuzzy finder.
paq 'junegunn/fzf'
paq 'junegunn/fzf.vim'

-- Configuration for Neovim's LSP.
paq 'neovim/nvim-lspconfig'

-- A async completion framework for Neovim's LSP.
paq 'nvim-lua/completion-nvim'

-- Provides inlay hints for rust-analyzer
paq 'nvim-lua/lsp_extensions.nvim'

-- TOML syntax highlighting.
paq 'cespare/vim-toml'

-- Distraction-free writing.
paq 'junegunn/goyo.vim'

-- disable netrw
vim.g.loaded_netrwPlugin = 1
