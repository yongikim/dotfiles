call plug#begin('~/.config/vim_plugged')

" all languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'

" javascript / typescript
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }
" Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }

" ruby / rails
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" go
Plug 'mattn/vim-goimports', { 'for': 'go' }

" color scheme
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'

" extend vim
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'

" fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

call plug#end()

" =======================================
"   lightline
" =======================================
set showtabline=2

let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
    \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'charvaluehex', 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'tabline': { 'left': [ [ 'buffers' ] ], 'right': [ [ 'tabs' ] ]
    \ },
    \ 'component': {
    \   'charvaluehex': '0x%B'
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightlineFugitive',
    \   'filename': 'LightlineFilename',
    \   'fileformat': 'MyFileformat',
    \   'filetype': 'MyFiletype'
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers',
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': ' ', 'right': ' ' }
    \ }

let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1

function! LightlineModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? '⭤' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
  \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
  \  &ft == 'unite' ? unite#get_status_string() :
  \  &ft == 'vimshell' ? vimshell#get_status_string() :
  \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
  \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" =======================================
"   nerdtree
" =======================================
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" =======================================
"   colorscheme
" =======================================
set termguicolors
colorscheme iceberg

" =======================================
"   neocomplete
" =======================================
" let g:deoplete#enable_at_startup=1
" " 自動で補完候補を選択する
" set completeopt+=noinsert

" =======================================
"   fzf.vim, ripgrep
" =======================================
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
"   floaating window fzf
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

" coc.nvim
let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-docker',
\ 'coc-emoji',
\ 'coc-eslint',
\ 'coc-go',
\ 'coc-html',
\ 'coc-json',
\ 'coc-marketplace',
\ 'coc-python',
\ 'coc-sh',
\ 'coc-snippets',
\ 'coc-solargraph',
\ 'coc-stylelint',
\ 'coc-tslint-plugin',
\ 'coc-tsserver',
\ 'coc-yaml'
\ ]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <leader>e :CocCommand explorer<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <C-q> <Plug>(coc-fix-current)
" vmap <leader>a <Plug>(coc-codeaction-selected)
" nmap <leader>a <Plug>(coc-codeaction-selected)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" coc-bookmark
nmap <leader>bn <Plug>(coc-bookmark-next)
nmap <leader>bp <Plug>(coc-bookmark-prev)
nmap <leader>ba <Plug>(coc-bookmark-annotate)
nmap <leader>bt <Plug>(coc-bookmark-toggle)
