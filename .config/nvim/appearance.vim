" ===========================================
" APPEARANCE 
" ===========================================

" always display status bar
set laststatus=2

" Give more space for displaying messages.
set cmdheight=2

" how long after you stop typing before vim triggers a plugin
set updatetime=300

"TODO after nvim 0.5: set signcolumn=number

" relative line numbering
set number
set relativenumber

" hide buffers
set hidden

" syntax highlighting
syntax enable

" true color (24-bit)
if exists('+termguicolors')
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" gruvbox color scheme
let g:airline_theme = 'gruvbox'
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

set background=dark

" open buffers header
let g:airline#extensions#tabline#enabled = 1

" lang specific
set tabstop=4
set shiftwidth=4
set expandtab
