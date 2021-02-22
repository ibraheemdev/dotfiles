" ===========================================
" APPEARANCE 
" ===========================================

" always display status bar
set laststatus=2

" Give more space for displaying messages.
set cmdheight=2

" always show side bar
set signcolumn=yes

" relative line numbering
set number
set relativenumber

" hide buffers
set hidden

" syntax highlighting
syntax enable

" true color (24-bit)
if exists('+termguicolors')
  set termguicolors
endif

" color scheme
let g:airline_theme = 'base16_gruvbox_dark_hard'
colorscheme base16-gruvbox-dark-hard
set background=dark

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

set tabstop=4
set shiftwidth=4
set expandtab

" syntax highlighting for markdown code blocks
let g:markdown_fenced_languages = ['rust']
