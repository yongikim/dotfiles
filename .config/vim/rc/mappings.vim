inoremap {<Enter> {}<Left><CR><Esc><S-o>
inoremap [<Enter> []<Left><CR><Esc><S-o>
inoremap (<Enter> ()<Left><CR><Esc><S-o>
inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>

" バッファ操作
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <C-d> :bd<CR>

let g:maplocalleader="L"
