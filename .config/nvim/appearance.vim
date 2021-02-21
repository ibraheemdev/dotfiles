" ===========================================
" APPEARANCE 
" ===========================================

" always display status bar
set laststatus=2

" Give more space for displaying messages.
set cmdheight=2

" how long after you stop typing before vim triggers a plugin
set updatetime=300

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

" gruvbox color scheme
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:gruvbox_contrast_dark = 'hard'
colorscheme base16-gruvbox-dark-hard

set background=dark

" open buffers header
let g:airline#extensions#tabline#enabled = 1

" lang specific
set tabstop=4
set shiftwidth=4
set expandtab
