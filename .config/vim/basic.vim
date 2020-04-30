syntax enable
set updatetime=300
set shortmess+=c
set signcolumn=yes
set laststatus=2
set cmdheight=2
set hidden
set list

" バックアップ・スワップファイルを作成しない
set noswapfile
set nobackup
set nowritebackup

" エンコーディング
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8
set fileformats=unix,dos,mac
set showcmd

" タブ・インデント
set expandtab
set tabstop=2
set softtabstop=2
set smartindent
set shiftwidth=2

" 文字列検索
set incsearch
set smartcase
set hlsearch

" カーソル
set whichwrap=b,s,h,l,<,>,[,],~
set listchars=tab:>\ ,extends:<
set title
set number
set ruler
set cursorline
set backspace=indent,eol,start
set showmatch
highlight LineNr ctermfg=darkyellow

" コマンド補完
set history=5000

" マウスの有効化
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif


" 端末内でtrue colorを利用するための設定
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  set t_Co=256
  set background=dark
endif

" augroup my_tex_settings
"   autocmd!
"   au BufNewFile,BufRead *.tex :e ++enc=cp932
"   au BufWrite *.tex :se fenc=cp932
" augroup END
