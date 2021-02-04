" ===========================================
" KEY MAPPINGS
" ===========================================

" navigate buffers
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
nnoremap <C-w> :bdelete<CR>

" open fzf files searcher
map <C-p> :Files<CR>

" disable arrow keys
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'nnoremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'vnoremap' key '<Nop>'
endfor
