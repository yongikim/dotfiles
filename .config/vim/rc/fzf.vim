let $FZF_DEFAULT_OPTS="--reverse " " top to bottom

nnoremap <silent> ,g :GFiles?<CR>
nnoremap <silent> ,f :Files<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap <silent> ,h :History<CR>

" :Filesコマンド実行時にプレビューを表示する
command! -bang -nargs=? -complete=dir Files
\   call fzf#vim#files(
\     <q-args>,
\     fzf#vim#with_preview(),
\     <bang>0)

" :Histコマンド実行時にプレビューを表示する
command! -bang -nargs=? -complete=dir History call fzf#vim#history(fzf#vim#with_preview())

" :Rgコマンド実行時にプレビューを表示する
nnoremap <silent> <C-g> :Rg<CR>
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
\    <bang>0 ? fzf#vim#with_preview('up:60%')
\            : fzf#vim#with_preview('right:50%:hidden', '?'),
\    <bang>0)

" =======================================
"   floating window fzf
" =======================================

" floating fzf window with borders
fu s:snr() abort
    return matchstr(expand('<sfile>'), '.*\zs<SNR>\d\+_')
endfu

let s:snr = get(s:, 'snr', s:snr())
let g:fzf_layout = {'window': 'call '..s:snr..'fzf_window(0.9, 0.7, "Comment")'}

fu s:fzf_window(width, height, border_highlight) abort
    let width = float2nr(&columns * a:width)
    let height = float2nr(&lines * a:height)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)
    let top = '┌' . repeat('─', width - 2) . '┐'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '└' . repeat('─', width - 2) . '┘'
    let border = [top] + repeat([mid], height - 2) + [bot]
    let frame = s:create_popup_window(a:border_highlight, {
          \ 'line': row,
          \ 'col': col,
          \ 'width': width,
          \ 'height': height,
          \ 'is_frame': 1,
          \ })
    call setbufline(frame, 1, border)
    call s:create_popup_window('Normal', {
          \ 'line': row + 1,
          \ 'col': col + 2,
          \ 'width': width - 4,
          \ 'height': height - 2,
          \ })
endfu

fu s:create_float(hl, opts) abort
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'..a:hl)
    return buf
endfu

fu s:create_popup_window(hl, opts) abort
    if has_key(a:opts, 'is_frame')
        let id = popup_create('', #{
            \ line: a:opts.line,
            \ col: a:opts.col,
            \ minwidth: a:opts.width,
            \ minheight: a:opts.height,
            \ zindex: 50,
            \ })
        call setwinvar(id, '&wincolor', a:hl)
        exe 'au BufWipeout * ++once call popup_close('..id..')'
        return winbufnr(id)
    else
        let buf = term_start(&shell, #{hidden: 1})
        call popup_create(buf, #{
            \ line: a:opts.line,
            \ col: a:opts.col,
            \ minwidth: a:opts.width,
            \ minheight: a:opts.height,
            \ zindex: 51,
            \ })
        exe 'au BufWipeout * ++once bw! '..buf
    endif
endfu

