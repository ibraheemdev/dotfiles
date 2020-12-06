" ale fix (format)
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}

" ale autocompletion
let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 1

" ale linting
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

" ale rust config
let g:ale_rust_rls_config = {'rust': {'clippy_preference': 'on'} }

" ale visual config
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 0

" TODO balloons are not working currently (dense-analysis/ale#2442)
let g:ale_set_balloons = 1

"move between ale errors
nmap <silent> <C-u> <Plug>(ale_previous_wrap)
nmap <silent> <C-i> <Plug>(ale_next_wrap)

call plug#begin('~/.vim/plugged')

" visual flair
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

" fuzzy finder
Plug 'airblade/vim-rooter'

" language server
Plug 'dense-analysis/ale'

call plug#end()

" always display status bar
set laststatus=2

" color scheme
set background=dark

let base16colorspace=256
let g:base16_shell_path="~/.scripts/base16/"

colorscheme base16-gruvbox-dark-hard
syntax on

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16_gruvbox_dark_hard'

" hide buffers
set hidden

" navigate buffers
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>
