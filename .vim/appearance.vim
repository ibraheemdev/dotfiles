" ===========================================
" VIM APPEARANCE
" ===========================================

" always display status bar
set laststatus=2

" Give more space for displaying messages.
set cmdheight=2

" how long after you stop typing before vim triggers a plugin
set updatetime=300

" always show the signcolumn
set signcolumn=number

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

" dracula color scheme
let g:airline_theme = 'dracula'
colorscheme dracula

" open buffers header
let g:airline#extensions#tabline#enabled = 1

" lang specific
autocmd Filetype cs setlocal tabstop=2

