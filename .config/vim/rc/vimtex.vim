let g:polyglot_disabled = ['latex']
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }
set nocompatible

" Load Vimtex
let &rtp  = '~/.config/vim_plugged/vimtex,' . &rtp
let &rtp .= ',~/.config/vim_plugged/vimtex/after'

" Load other plugins, if necessary
" let &rtp = '~/path/to/other/plugin,' . &rtp

filetype plugin indent on
syntax enable
